Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F0344F9F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 20:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100449.191362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOPuz-00035i-8O; Mon, 22 Mar 2021 19:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100449.191362; Mon, 22 Mar 2021 19:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOPuz-00035M-5J; Mon, 22 Mar 2021 19:08:49 +0000
Received: by outflank-mailman (input) for mailman id 100449;
 Mon, 22 Mar 2021 19:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mPde=IU=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lOPuy-00035H-3n
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 19:08:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50860b29-d22a-43af-a5f3-594a3a79bd55;
 Mon, 22 Mar 2021 19:08:45 +0000 (UTC)
Received: from AM6P194CA0103.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::44)
 by VI1PR0802MB2287.eurprd08.prod.outlook.com (2603:10a6:800:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 19:08:37 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::c1) by AM6P194CA0103.outlook.office365.com
 (2603:10a6:209:8f::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 19:08:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 19:08:36 +0000
Received: ("Tessian outbound 6484dad39064:v89");
 Mon, 22 Mar 2021 19:08:36 +0000
Received: from 8ca154a56113.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D163889-3DDB-40BD-984B-3D7808A0F3ED.1; 
 Mon, 22 Mar 2021 19:08:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ca154a56113.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Mar 2021 19:08:29 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5069.eurprd08.prod.outlook.com (2603:10a6:803:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 19:08:22 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3955.024; Mon, 22 Mar 2021
 19:08:22 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Mon, 22 Mar 2021 19:08:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 50860b29-d22a-43af-a5f3-594a3a79bd55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtCUcluG2i0OOfOxFYabbi/hVb+K2lHtBjvpxI/FEiY=;
 b=bouSnlQxGmG/xxaruTw+Bz2G+eZ8sIqV6VGrsAwNT0fHS8znw2oxjS7KRErWy6ap3OI64dEbdlwoXwx5PlIapDCSuoe0+UR56G/CzVWip5KmL8IoRKvc6lIuNgqZjWu75HwPpvlBrsjchsdd3lEU3F3hsNPrfw8BjiWA+wirr2E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59742b422956e216
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7r3anjIiLY/yoT0epNoWdiRvTUIluORJDLnQm+teikzqFO1WCXTFSX21xp8gn0lv7Ct+SLMZJZxGhlUv6xbSwiF0Dyu2RhJQXGyqxPlShvGpj8epN8kycabVqRN1nu4iP8RQhe40ERSz6Grk9O1zsUhttg0KZiE4Z65gZUufapx3VnpS/5ZHPmhZ8D1vWGQUaswjOyDsNXtGWlRLiT9f6lAi6NttdLsW1gK2gJBKIUQ1V1VGdJIMbenIVAMRueYdpHCZOQPcN+gMmbunVgZ7T2IDfBl/WSW4FBs4m8Fk398/5Tsxc5Xh6dRgenWW5pVWeoFhWIFayKEZ26uX4PH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtCUcluG2i0OOfOxFYabbi/hVb+K2lHtBjvpxI/FEiY=;
 b=bbmkLbQ6XCLPErJXezru1zSDqoLrPvYepa2NvIa+hW84AOkCcbeeb/h5AEMPeZ5QPo1fQ96eAjw3tlSnnBV4wCrF1cUvMpI3Az6L2LZRtjFH6o5H8g8H+OgVI6rsLQGKFwTQ3osJ9IYR9td/TM03pq3PI0g5n7WvLp0ciQiSEiVJcXlORvjmvRJaVmAV/dxs6/XIsPHEq2za+JhAPOHnDatY5HK7t4Ld+UKb0JPE6tqQiw07+zy2lZ1fKiGHdrG1XzybE6zfQDlqp8f3qjXGf4u7JRJhqM/zv9g+0YzWNktrOphocXQ/mk2GWqRFChX5WSG2y+5yH1dDlr1GJM18Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtCUcluG2i0OOfOxFYabbi/hVb+K2lHtBjvpxI/FEiY=;
 b=bouSnlQxGmG/xxaruTw+Bz2G+eZ8sIqV6VGrsAwNT0fHS8znw2oxjS7KRErWy6ap3OI64dEbdlwoXwx5PlIapDCSuoe0+UR56G/CzVWip5KmL8IoRKvc6lIuNgqZjWu75HwPpvlBrsjchsdd3lEU3F3hsNPrfw8BjiWA+wirr2E=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
Date: Mon, 22 Mar 2021 19:08:13 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
 <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e195c13-154e-43a1-ef01-08d8ed65e55b
X-MS-TrafficTypeDiagnostic: VE1PR08MB5069:|VI1PR0802MB2287:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2287FDAEC2273F8DB19479A9E4659@VI1PR0802MB2287.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mkRXV0dba+2BrECMtMwqQ1/smNFVJ1le6KD+QqBvLsCBuUDo7W5euU4YLDXm9hPBnC3zShRZlx6Fz/hA/sweE/p6jwhKstK9rnLY5QeOorQxkyOzhnsJQ1EY4sKVCJsE8r6x6zW3As/2TC18aAJVWl9jN1Sopoal04srTIBIz2xwz/rpSwFmS+HeDHE+ljLVIm6tjgvsEx8yn+pTQBQf2OWHwCfMC+UGdhgMN1fKUZZtcDn4cG1anrQrMvRREfAbhZE7wY9OJqy4BkNmjcpRYnoiwvFDY3VpiXUtWZBiuiuFhwPx/ssZbKcOr4ESqrHMB5Lgz9/QSY8wtqAGM+I8nFiVnU28Nnj4oL11ZLGqPgXBo4O7bO2zeWYV7RRsU/hvuCBKlrpfm7oPZ8b7gnzvf2vRKFg2PzW295PanjdSZoNtusiNQpsjEMLL/73FuHkiJk73z84eaxnir1W2ffdnWwZ+NvMXgsbXQ6Xc2WGhlOjPrcsFvnYdM76P2njE5z5+j9FEsQFd/TvRke6F1myJttf5PEAFz6eaH7GsgfK0ZkmGHv1IujB/uP1RMHfirXoV17Lf0K/oNUzhQqyfJdE2+vq2R3jYShq0u6L510WS6g7Lu0d9qUT0DVe+loHRvorCF6IN0NsieWEXo3YLrHKZsvgTvHcCKJHkn4MUUgzaCaZlBPRlrpiDp+IOYKEyn37BT8xc43luKeckPcZszv7fz4IAfN3zoV7M9GICWhXCygS6ysgUqq9lXr9ruqugnPhOdSrJYbCv3PRmVxmCy+QBVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(6916009)(966005)(36756003)(8936002)(66574015)(44832011)(478600001)(52116002)(38100700001)(4326008)(7696005)(6486002)(83380400001)(5660300002)(6666004)(53546011)(956004)(66556008)(66476007)(66946007)(16526019)(186003)(316002)(26005)(86362001)(33656002)(2906002)(8676002)(2616005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?NFFLTnRXV1dWN04vOXJLVjM5WmdsbnRheThnMWlRZVptQ21Kd3dSZXA4R2o0?=
 =?utf-8?B?bUE0cGNlaWpOTlpxMzJDZE5PREdFZStQZWFtc3hhOWtWajhDSi9oQWdQaVJm?=
 =?utf-8?B?cEVlVTU3Z2Z5cnhxck9kcU16eUovN3EvRnI5SGZVYUc1ZTB2ZHphblR3cTRp?=
 =?utf-8?B?NlpFTTU5S0ZlUGtPaXdseUlXZi81bzJ5TzBiNmFaQ2ZKQ0xTWXowSEh2aWZU?=
 =?utf-8?B?MWRaaDBwQXRFakdVK2h0d3pnajJ2K1VWZlhaTHFPNVRucnBHVUVHRE1GcFVH?=
 =?utf-8?B?SUlwQ0tRYjh0TlM4QjFLdGZhdm94NWxpZVdmTnY1WisyRC9mQjhxUk9MTjE0?=
 =?utf-8?B?TGh4MkdlMU13citsZ3NjTHZNWng0RExJd2tLeGU5b29icWhhRjJNeEZhM0hD?=
 =?utf-8?B?MGpDNnNleFFXYkJWcG0vRVpXOTRJSWdiUm5NWjZnWDZsK3h3eFBpWUZnckV4?=
 =?utf-8?B?VlRXQ0RxN1hYN044c0VPSnY1dEpZL3pycDVCM01hZnU5VTZXc3R3d3ZCbzJr?=
 =?utf-8?B?ckNrTWJGeTZWdlRORnhPZitXYzY4S2RMaVJKbzJuYjJyVjE3ZGhwbHU0Rmtv?=
 =?utf-8?B?TFJIVEdSc201dzZVY1dYaWVBcXp3VmR6Qkx0cnZ4TnN2R1AwSzh3QmI1b1ZC?=
 =?utf-8?B?VERSNTA2MW5UM3NvVXBpd3JnWkw2SVYwamYxOE9NdTljNEpjT09FSXN4eFZ2?=
 =?utf-8?B?VWdWaVJuUDNjT2FWOWNpOVNOcHRuaGIyWlZPVm5CNkNCNFBDbCtvbmFUVFR1?=
 =?utf-8?B?ZTBZendhcW4yT09MZlY2aWZuTkV5RTFZZXFIcDVYYVhFMTdmOEU1ZzJXZjJj?=
 =?utf-8?B?Z0toakZPZVA4QmhOTmlXQWxlUjBhUitMN2M0WTdFdEN4b2FzM1FzOEVwZ0dx?=
 =?utf-8?B?UlZsS3BTNG4vQmdQUElLUTdiRkZ6bStKQWJrT2NiMXQ4bTg1ZDJjN0J4bjFq?=
 =?utf-8?B?a21YZjFNT3RhUERVMVZrRFRwVXNDTEx4NG1uYjRDdUxjcDJxTWJucUF1bGgv?=
 =?utf-8?B?VTJwNm1uYTByQ2E2WHcrRy9qY3ZKQ3g1SUJrMHZpWVpBQVZTa0c1MndGSGFv?=
 =?utf-8?B?c2VTL3hVamY1VVZqMmNNR0tHL3dYQUJNcjFjVmFUVzN4U3NhWjFNZU5Yd0Vn?=
 =?utf-8?B?MnZrUnlOTURhd0JJQ0JmNFlvVlJlcTZJUjhPakgrWXlnS2ZnczVTNlZxaTFZ?=
 =?utf-8?B?cDVMVzkvc2pCdnMvRS95NmdJVlRLK1hWd0JqS253SWh4MDMvS2JWY3JDSEQ2?=
 =?utf-8?B?UkNxMks1VUxuUEVoclFwWWlrRkFSSCtyQlViWmp1VHcwVmxyeTN1dElaMEEz?=
 =?utf-8?B?R2tOTlhRRXlwWkZRdVBCajVXcFdEVGE3UXNndU9pazFXbUpkL09ZdS9paDFR?=
 =?utf-8?B?b2FManV2UENsamlmTnhRYXRXbWFGMTVCZDNIeWh4QXVPazJNdEtGT2p4VEhR?=
 =?utf-8?B?bm1VZ1lPQnpQVnpKWWhrdmlLTlVvZE1ybHpORjRSQktBVC8waFdBZkhlYUs1?=
 =?utf-8?B?ci8va0VJV2VTZEM5UXE3SmdObUExNG1NVEIzd1NQY0g4eXhwR2pXUTlFZlJC?=
 =?utf-8?B?NVNZcVl5TjVoQnc4OTJmd0JWL3ZXYTc0MGJreWFKS1VsWlNuTTRqQnFydEhJ?=
 =?utf-8?B?ejc0UDFUQVM3WEJGRW93YmVCYjdyOFErV1hLZUVURlZ3REhCM2hNRHlLdElJ?=
 =?utf-8?B?RlZrU1hqYkFGUktBRVRzNTRiUENOUHpPVFIzTnVxNUtwNVMzd21tTld3RENG?=
 =?utf-8?Q?S2yIzdCGB9Xwafk/sDdPyHjRdY6O+qUSdKqEc3h?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5069
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f76566b4-aa5b-4eb2-4be3-08d8ed65dc30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S5YksgIdxDOlPm8cyKXWaRcaIfPALz69TEyiu8veyRPuLZ96x5yw0FZdAhQkI5tQvalDc4828QAhMoKLY4yZVz1btKq7iSFe+4Ol+0yy0wl5jBNbb5kStTwCoWaJt1sota2uKWQo4UoJiVqjat/+vJe8i7FsJBDYetETD0UxeXlouJlFzTSOk0SgqTVlcRFmP5iiGwHgu89NbjRKyxuz8ZgXHMtgr8XrW8CloHpNQZT7g1n41VUy5vDP+wp2nkuA57xnnTMIXHu/iTJKc+RrTNz/3oipHNTkicvdLxxtBVm/XqQBrDiX5LmnDIWNicTWbtAY9oBr6aOSdFHox4TJ6ZTS8TJCp/Pw/OgUz2Vf7xAW8kzQkjkgyKEX3NY8k+eA9aPGmcVot0xNRriu8dBgdX3qfrGNh95PXRj2ZgqmaMWEay2gqRGUse0EBfG50SWozNEMyV9+5vsZp49QF1Qx0zcogYtZLb9/56wzKvsJPcj/+RX7emUqrIcjOrAdgkB7EUJgybdSGHmFp3KnbC+V4gV/XzDszmIpZ+tYcH+sZ4YpnkAYSCNRuSSBo50odbUe3MN37oJruQr19JiEOBK9N5qH3EZzt3UvoehKlrmt3LMrGPNu0J5OeTefSUL1xN4Vbd52w1WBS4PpW3L+0aEG1pEvA+sswbKNPC+UjPG6GhtW5wACJ3a96Xnkz5/945jm7UtOiHDfAjCjVBRWv/BCrfF/gP71zhzB8n0PbvwQGm0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(36840700001)(86362001)(7696005)(82310400003)(70586007)(8676002)(33656002)(2616005)(44832011)(956004)(70206006)(356005)(5660300002)(186003)(6862004)(966005)(6486002)(16526019)(36860700001)(81166007)(8936002)(47076005)(2906002)(66574015)(83380400001)(478600001)(53546011)(26005)(4326008)(6666004)(336012)(82740400003)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 19:08:36.7792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e195c13-154e-43a1-ef01-08d8ed65e55b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2287

Hi Juergen,

Yes you are right it was my mistake, as you said to remove the BUG_ON(=E2=
=80=A6) this serie (https://patchwork.kernel.org/project/xen-devel/cover/20=
210306161833.4552-1-jgross@suse.com/) is needed, since I=E2=80=99m using yo=
cto I=E2=80=99m able to build a preempt_rt kernel up to the 5.10.23 and for=
 this reason I=E2=80=99m applying that serie on top of this version, then I=
=E2=80=99m removing the BUG_ON(=E2=80=A6).

A thing that was not expected is that now the Dom0 kernel is stuck on =E2=
=80=9CSetting domain 0 name, domid and JSON config=E2=80=A6=E2=80=9D step a=
nd the system seems unresponsive. Seems like a deadlock issue but looking i=
nto the serie we can=E2=80=99t spot anything and that serie was also tested=
 by others from the community.
Do you have any idea on that?

Thank you for your time.

> On 19 Mar 2021, at 11:54, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
>=20
> On 19.03.21 12:50, Luca Fancellu wrote:
>> Hi Juergen,
>> Could you confirm that back porting this two serie to the linux kernel 5=
.10:
>> https://patchwork.kernel.org/project/xen-devel/cover/20201210192536.1184=
32146@linutronix.de/
>=20
> I don't see why this one would be needed?
>=20
>> https://patchwork.kernel.org/project/xen-devel/cover/20210306161833.4552=
-1-jgross@suse.com/
>=20
> This is already part of 5.10.24.
>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>

Cheers,
Luca=

