Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5B3655A2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 11:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113441.216157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmu7-0006RS-Dc; Tue, 20 Apr 2021 09:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113441.216157; Tue, 20 Apr 2021 09:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmu7-0006R3-9H; Tue, 20 Apr 2021 09:42:47 +0000
Received: by outflank-mailman (input) for mailman id 113441;
 Tue, 20 Apr 2021 09:42:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4LT=JR=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lYmu6-0006Qy-0F
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 09:42:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02fe63df-d64a-42bd-b101-6b5184836f2f;
 Tue, 20 Apr 2021 09:42:44 +0000 (UTC)
Received: from AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23)
 by VI1PR08MB5421.eurprd08.prod.outlook.com (2603:10a6:803:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 09:42:40 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::9a) by AM6P193CA0082.outlook.office365.com
 (2603:10a6:209:88::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Tue, 20 Apr 2021 09:42:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 09:42:39 +0000
Received: ("Tessian outbound b610e7b4d771:v90");
 Tue, 20 Apr 2021 09:42:39 +0000
Received: from 767d2bb96a2f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3497F03F-04E1-4521-87C3-CA4CE957980D.1; 
 Tue, 20 Apr 2021 09:42:12 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 767d2bb96a2f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Apr 2021 09:42:12 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1632.eurprd08.prod.outlook.com (2603:10a6:800:57::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 09:42:08 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 09:42:08 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0393.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Tue, 20 Apr 2021 09:42:08 +0000
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
X-Inumbo-ID: 02fe63df-d64a-42bd-b101-6b5184836f2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0qZM+69xz6DI0UHt9HHGYiNRpRswYbQO4hvdtFAYuo=;
 b=AvhhtkhlYOCW0138u6Op1iJ5nkT52S6+Brw6HGMxPtkEsHGJ+6atH4ouW848qqKG5KPYSVfrAu4InlpqZmM2Guq8ThI73qiPR713zlR7/ZIPs/Jj+Ebo5Ug18ZEDMAgfQRYfJ7YMFb6vfAkuIQEGgz8h8jETjmoHRFOplHPBqZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b18cf0e1f38b3203
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ9Bi0xr7Bgy8dv9pMbyTQXV0Aga/sDMqSzmTJr8HhW+oxwlgL4ZS4Ew34lkDcNoTVd+IxokX9d3uf0XNbUqvI50i8dcs3NCd0d4NYRs6cwJfzFCccjBUhKhoYW74hNzLykPsgGTGybVbSKJvq6aARxklLmriTvgBEuTAb2ZGgOkFqsg9bQluvN0R4DjQBrJAugO+BdD5mnsVgBhtV0RAKnZP9dNvQec86jl44LU3h4s5lxdcwTerUegTe3bss6Js1M/ycSkO4fzB+oU+G4VLtTFnzFnWg8W1dYsUBeX6wJoyZdVklRDABhXU9XRjNTg3kV+v+ZpxA9zZg3RteRhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0qZM+69xz6DI0UHt9HHGYiNRpRswYbQO4hvdtFAYuo=;
 b=VHPmwwXvgjhV+xNmyoJSQAZG3Wug7jhfG2B4cuxyuSkm9zWH2a4qSK1gOelL91ERdMZ96t1dsfVFFjPu5LsXSDTHUDpJORWyEZr5XlHQMCF96VCGgJ1GX3/BSO6006lSJsFM/KRG87kzvpObcLl1DLLR0Reicdeppu63sgfrDyK5cpEgCZ8OCrmWR1lwVGnXO0fSk8/ZVA3lAmuFvO6DMMLEvwb6NdiKzKkkFHN+l4b2j/+T8kYoaJVpKrSVZtqyjaZj8dQI8W++0ggX+PNAd4VbDvj1yL9Iwy9uc9rLsd21ZxsHmmcGWmYeOgYmFtZeiqkYYLYnEkatOFBuxdI3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0qZM+69xz6DI0UHt9HHGYiNRpRswYbQO4hvdtFAYuo=;
 b=AvhhtkhlYOCW0138u6Op1iJ5nkT52S6+Brw6HGMxPtkEsHGJ+6atH4ouW848qqKG5KPYSVfrAu4InlpqZmM2Guq8ThI73qiPR713zlR7/ZIPs/Jj+Ebo5Ug18ZEDMAgfQRYfJ7YMFb6vfAkuIQEGgz8h8jETjmoHRFOplHPBqZU=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <c6d80a92-b8e7-703a-e051-18dc845b242a@suse.com>
Date: Tue, 20 Apr 2021 10:42:00 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <ADF98BE7-02CA-48C1-B0CF-E4C7B4C0E828@arm.com>
References: <20210419091231.55684-1-luca.fancellu@arm.com>
 <20210419091231.55684-4-luca.fancellu@arm.com>
 <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
 <0F26E53E-0C0A-4596-AC88-F803BC7A0493@arm.com>
 <c6d80a92-b8e7-703a-e051-18dc845b242a@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0393.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::20) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193d6f94-b435-44fb-8cdc-08d903e0a368
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1632:|VI1PR08MB5421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5421AF01D14D7AA680EBFE86E4489@VI1PR08MB5421.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tv3jLXPtp++mK507S4En5kqXWfzrdI28e3J4hoiiHFXzdrkReh2Qb40E2D9k4WeZOhEcWf4k1YXPlMJLnF+1/W14tDbGsO5vbgB5IabJd9BgO3OzX9MNpbAvEQEvwPrOQ7Tqb5C52KsmttJarcBPXZkMFg/tXYviWkoJcRx1bWPFt1FJP+PZUyWfJSWsJ4EfrFg0iJ4XS4LV95j9iIE6LNSmT2Wo5B3AERBBNxJJQTxhTSZWTqy0iTKNKMLzQniwceIsnFWxKAvzLSJK2AgxQ5v20kjECgrzCurf5nMKsVxnwF8+JhVlr4o7MFiig5yeo7+QYPEYEAHGh96VXKD5wMk+7ZcN1PI02NJR7rhf75jMaEA3Zksy5j+8C8GabRGJBmsZ49MxoOEkAiuqgNRU01TBGbEpytOiN2VJheJYn5gbBplTa5Wb4MKzQBpEwONP5Ft3rrGhSEK4z0ORTFFUQzRDC4KxEmlUmHCmT4Ga3/RWlyoLRrXd5zb+0kvcgJT52LPf+0XcTMbcjlhSLTQLu1JWkZRfpIGQs4FjbmbAUGqMI/TSmq3XvF61bB551ouezbmhpSOh6I+FWTuz1fQljLOcmO56oF37FHvVUyQG3FrbUAHULyfFNnJWcyIprCuNTikeNDdrSdX95CmqiGx+lWwFnpcJmu7hVTpU3Mh3TxA8aBwlrhgvh7ENhNk69+upBHt2Gy4bYmV/AfBh8MIC52mgyRl0QLl7u5aMdMJ/GwiaB8/5G6/3Bxs3oAKTtoWU/l5lIW0NwRwGKq9ztU4v2w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(316002)(966005)(2616005)(26005)(86362001)(186003)(38350700002)(8676002)(2906002)(38100700002)(83380400001)(66476007)(6916009)(66556008)(6486002)(54906003)(53546011)(6666004)(956004)(4326008)(16526019)(52116002)(66946007)(478600001)(33656002)(7696005)(8936002)(30864003)(5660300002)(36756003)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?bWtwYWd5MlNGcC8vekwxMGFwbGJlT0ZESkFFVU40a3lPbHZoMkF0ZU9UUlRy?=
 =?utf-8?B?S0Zta3FxeTB3QzhnQmtTVkdhNVAybzAwY0I2bFVqcDFlVUxuVXNxd2VHVEEz?=
 =?utf-8?B?RnRlcXFXSE0vbEllMTh1S3NqWnRZMCt5YXZQTjdYbWdZaEs2US9JdjlwS3Vl?=
 =?utf-8?B?Wm9OM01RM3paZ1M2ajQxcHFRN2dHWE1MUk1aeGdEOFlJVTU2VmtrbVQ0VG5q?=
 =?utf-8?B?bndSZkJJMzhrZ2tBU3pSc2JFcjl0QW9yaHpwWEpvMmhGY29NeTc5VVFKV0g2?=
 =?utf-8?B?dUlNZlB5d28xSVNoM0UyeEFzTlFpUGxodEtOZkJOSFNCbWNLZE5JRHVTNlpv?=
 =?utf-8?B?V0xycXZRNmNBamZrRGxHY0dGU29GVWlUUnd1TDlvKytCTm4yUy91bkNjdFM1?=
 =?utf-8?B?YU5GUjdYazFwZW1NcEVobkhuQ0F3YXdhcmNEVlVERkVhMzZ0MFhBakcraXZC?=
 =?utf-8?B?RU1NZkZ5Tk4rYWs1TTd1VG80RE5EbWVBcmh3TmxsZlF1bFNwK3NuQ2xTY2ZL?=
 =?utf-8?B?NVNBZXNqaFlESXVzN2dCN2hwYUtyTTZkMVhOcXNBbkpzZlM2WXBWL1FUSURG?=
 =?utf-8?B?dU9yWlhtem5VMndtL3pWQVg5VTRHeDhKVzkzQ3BTb0dTOTNSK1BzK0lBVDh4?=
 =?utf-8?B?RmNkMnZaM1RTNnFlN0hwMk40VldxazVNcG9vdXdJczFKS3hkK1JUaFZxaC9G?=
 =?utf-8?B?a3JLckpGajNiSmNxVjZFUFdkL2FORG1BN01BN1RoL1dReFNzUENXdlI5bmlY?=
 =?utf-8?B?b0pNOVBXbXdEMU9tT3VTZGxBb1pWbUxta1lyRnJ2UnJ2SzYvajhuenpydHBC?=
 =?utf-8?B?aG5LUGdTd0p2dmhIQVRlbUxvcUhVRUZHdnZTZk9GQURuNS9DdE5KM2lMQUhM?=
 =?utf-8?B?ajVsUWo5MjZ0OU9IdlYyeTFPb0VuSytvL25DR2JYeXRhOGtNN2t6NGVjdEt6?=
 =?utf-8?B?blh6a3FhUjFlczFyZjRCY3lJQy9DODZsUThSMU1uTGZrWWQ5alRmajQzSVNX?=
 =?utf-8?B?TjB2VHBJN29WTnNzQzViVmw4WHZmTzRGN3ExN0N1QVRDVDBwUzZPUWVEQ1ZM?=
 =?utf-8?B?MUIrMDAwZE1WY3dleUp5UGx0bzF0UnlaSUpEMWdvRVBYQXBGdEZOc2JvUUZt?=
 =?utf-8?B?Q0NDZUdGajZQL0Fma3A4UGQ5RFpLN2pGa2UzOS9OVVhhSzA5dm1vS2x3aTRP?=
 =?utf-8?B?TXA4aHNxWDUwaTJ0OXZoM3NuSXZOWUFzMFFQWjRseGZiUkRyeUU2NEpyTnN1?=
 =?utf-8?B?YXhZV2VWbGVLT0RVM3RIYkZEY29NMnVUVkY3SFNka25GWVBURTdWYnE3SkJN?=
 =?utf-8?B?NzBTWmFIeTErT0cvTmRmU3FPR1EzdW40ZjNybmN2RzJ4N2g5bGJSeDU4Ym9H?=
 =?utf-8?B?STl3NkpPaThGT1FuQWwvOWpWWkVCdWV3N2JBRXhnZVZ5dDFjVWdVS3lybXdR?=
 =?utf-8?B?eURUZ3JPS3JSb1g5QVo0V2F2STdrdlRBZFhLNzJSZHhYZHpsZVBwN3B6MjhS?=
 =?utf-8?B?Z0xIRWlHTXlrYTNpNlNNT1VKZlFXWHhDSzI5SWhGQ2pIZ0VyNXgyTjV4Z0FZ?=
 =?utf-8?B?MFQ1YXRGTDBsVnUxM3R5QnEzZXZvQTlrQlYrYmRTZ0pxTG84N0pZWElBTkRT?=
 =?utf-8?B?RlNUazRENGlGd0pVbXBSN2JHQXRNeG9WSXhsTVNCZG0yd2IxSFF0RzZ1eUVj?=
 =?utf-8?B?VW9EM2RONnBvbCtnNEd6a0J3eDBDaERRcDNaZ0FJYVM5b3hBVFFhU25XZTV5?=
 =?utf-8?Q?9+7kbUN1prfgJh0CbQIzxcGAb3Z/wHM9xcVrXLS?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1632
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	301b544f-7a71-4982-89c3-08d903e090be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnRVCL9xLTsXjPTIY6US5ssdCGk2r/FcXHNnCmyIhmJUCRReNlUHVYxvtdZQWGJwArDnNzeQ0WJb5rFTWtoF0HIvMQ0ikn2jD5xj/OezU6zJZFloelz7jfKT8bo5pGDka+UVOQV4L9C7PKksOhtYTMk+/KQfeE/5nkvFGrkIcrBlMYUfUbHLszkxzkhaIRVxHV9aeaDRneEZQjamMuQ5D8kZc8ZSB1dOXKb4Cpwutd3xMxO2rB0sEeke9bGr5fIoDFScRB9/DnRMrfM8blvPd50AnsdULMd5TeLuCuC/fmNjJSXWAyyxZwfjq3NgYq88ZCV0H+TZvyfh4Pgx1xSYGm4ctS0E7ZvjbF0fj7p4xRptGXA07tZYS3f57hwtx/ucKCkQT5XD1M4Qf+rEBdj15HKQc6K0tPEL3udjWM20vq/2q1JrM6DBPZxfiMl4/Jl1csVu2ZHcW74xtkp1uvv/0YDxtZ1C02ULElUUAz0X/rjCPeilwMeWuc7il+MB6qPJHUwmJltM20cac7tLhoH2pr2f1SE5gkeW3kSbzYrnbVPiojc6Qso3D8pIVQafVlth/KO+8uNzjhk0E2CCQhuuPi0hJfn5lQir9d2Hs9lOk3RhGrS7Q7IdWhUOqFXWS7bUXfkdbZqP1Z3iQU7nKObaON8P6ffg6F4/p8jii7I1RqSJycPYKuImKFu68w711NL2GeaE/Fjlvt0GdWrBr4WvWjZmabqBiKV7mQIkdQiXH8I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(36840700001)(46966006)(47076005)(186003)(26005)(70586007)(336012)(16526019)(956004)(30864003)(2616005)(6486002)(70206006)(36860700001)(54906003)(8676002)(86362001)(5660300002)(36756003)(44832011)(33656002)(83380400001)(82310400003)(8936002)(2906002)(4326008)(966005)(7696005)(478600001)(82740400003)(316002)(356005)(53546011)(6666004)(81166007)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 09:42:39.6922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 193d6f94-b435-44fb-8cdc-08d903e0a368
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5421



> On 20 Apr 2021, at 10:14, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 20.04.2021 10:46, Luca Fancellu wrote:
>>> On 19 Apr 2021, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 19.04.2021 11:12, Luca Fancellu wrote:
>>>> Modification to include/public/grant_table.h:
>>>>=20
>>>> 1) Add doxygen tags to:
>>>> - Create Grant tables section
>>>> - include variables in the generated documentation
>>>> 2) Add .rst file for grant table for Arm64
>>>=20
>>> I'm missing some reasoning about at least some of the changes done
>>> to grant_table.h. Looking at this and the earlier patches I also
>>> couldn't spot any general outline of what is acceptable or even
>>> necessary in such a header to be understood by doxygen. Without
>>> this written down somewhere (or, if documented elsewhere, a
>>> pointer provided to that doc) I'm afraid things might get screwed
>>> up again later on.
>>=20
>> Doxygen is a tool that generates documentation based on parsing the sour=
ce code comments, it recognises some
>> commands in the comments and builds the documentation sticking to what y=
ou wrote.
>>=20
>> Here the doxygen docs: https://www.doxygen.nl/manual/docblocks.html
>>=20
>> Basically it doesn=E2=80=99t react to all comments, it parses only some =
well crafted comments as explained in its documentation.
>=20
> Providing this link somewhere might be helpful. However, also seeing
> some of your further comments, it feels like to edit a public header
> enabled for doxygen one has to know fair parts of this documentation.
> While I'm certainly in favor of having a way to generate docs from
> the headers, I'm afraid I don't think such knowledge should become a
> prereq to e.g. adding a new sub-function of a hypercall. So far I was
> assuming that the formatting requirements would be quite limited, and
> that it would hence be possible to just glean them from existing code.
> But e.g. the "/**<" notation isn't going to be obvious to spot.

Yes I see, some knowledge of the documentation tool is required but I=E2=80=
=99m sure that if anyone is able to
put his/her hands on the xen code, he/she will be able to use some of the d=
oxygen tag too, as you can
see from this patch the usage is easy and some less obvious thing can be un=
derstood looking the source
code and the corresponding generated doc page.


>=20
>>>> --- a/docs/hypercall-interfaces/arm64.rst
>>>> +++ b/docs/hypercall-interfaces/arm64.rst
>>>> @@ -8,6 +8,7 @@ Starting points
>>>> .. toctree::
>>>>   :maxdepth: 2
>>>>=20
>>>> +   arm64/grant_tables
>>>>=20
>>>>=20
>>>> Functions
>>>> diff --git a/docs/hypercall-interfaces/arm64/grant_tables.rst b/docs/h=
ypercall-interfaces/arm64/grant_tables.rst
>>>> new file mode 100644
>>>> index 0000000000..8955ec5812
>>>> --- /dev/null
>>>> +++ b/docs/hypercall-interfaces/arm64/grant_tables.rst
>>>> @@ -0,0 +1,8 @@
>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>> +
>>>> +Grant Tables
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +.. doxygengroup:: grant_table
>>>=20
>>> Why is this Arm64-specific?
>>=20
>> This particular one is Arm64 specific, but it doesn=E2=80=99t mean that =
grant tables are arm specific, it is only that for now I=E2=80=99m
>> Introducing a partial documentation in the arm side. Any other user can =
in the future add more documentation for
>> each platform.
>=20
> I'm of the pretty strong opinion that common hypercalls should be
> documented as common, and hence not live in an arch-specific
> section.

Yes sure, I agree, but this is the first step to enable a kind of documenta=
tion, it=E2=80=99s a work in progress.
On a future serie this can be modify. For now I=E2=80=99ve tried to reprodu=
ce this page: https://xenbits.xen.org/docs/unstable/
In the section =E2=80=9CHypercall Interfaces"

>=20
>>>> @@ -73,20 +75,25 @@
>>>> *                           frame, or zero if none.
>>>> *  3. Write memory barrier (WMB).
>>>> *  4. Write ent->flags, inc. valid type.
>>>> + * @endcode
>>>> *
>>>> * Invalidating an unused GTF_permit_access entry:
>>>> + * @code
>>>> *  1. flags =3D ent->flags.
>>>> *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>> *  NB. No need for WMB as reuse of entry is control-dependent on succe=
ss of
>>>> *      step 3, and all architectures guarantee ordering of ctrl-dep wr=
ites.
>>>> + * @endcode
>>>> *
>>>> * Invalidating an in-use GTF_permit_access entry:
>>>> + *
>>>> *  This cannot be done directly. Request assistance from the domain co=
ntroller
>>>> *  which can set a timeout on the use of a grant entry and take necess=
ary
>>>> *  action. (NB. This is not yet implemented!).
>>>> *
>>>> * Invalidating an unused GTF_accept_transfer entry:
>>>> + * @code
>>>> *  1. flags =3D ent->flags.
>>>> *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>> @@ -97,47 +104,55 @@
>>>> *      transferred frame is written. It is safe for the guest to spin =
waiting
>>>> *      for this to occur (detect by observing GTF_transfer_completed i=
n
>>>> *      ent->flags).
>>>> + * @endcode
>>>> *
>>>> * Invalidating a committed GTF_accept_transfer entry:
>>>> *  1. Wait for (ent->flags & GTF_transfer_completed).
>>>> *
>>>> * Changing a GTF_permit_access from writable to read-only:
>>>> + *
>>>> *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writi=
ng.
>>>> *
>>>> * Changing a GTF_permit_access from read-only to writable:
>>>> + *
>>>> *  Use SMP-safe bit-setting instruction.
>>>=20
>>> For example - are the blank lines you add necessary or merely nice
>>> to have in your personal opinion?
>>=20
>> The blank lines makes the docs output more good looking
>=20
> I'm inclined to suggest to split beautification from basic enabling.

I will take this into consideration

>=20
>>>> - */
>>>> -
>>>> -/*
>>>> - * Reference to a grant entry in a specified domain's grant table.
>>>> - */
>>>> -typedef uint32_t grant_ref_t;
>>>=20
>>> Why does this get moved ...
>>>=20
>>>> -
>>>> -/*
>>>> + *
>>>> * A grant table comprises a packed array of grant entries in one or mo=
re
>>>> * page frames shared between Xen and a guest.
>>>> + *
>>>> * [XEN]: This field is written by Xen and read by the sharing guest.
>>>> + *
>>>> * [GST]: This field is written by the guest and read by Xen.
>>>> + *
>>>> + * @addtogroup grant_table Grant Tables
>>>> + * @{
>>>> */
>>>>=20
>>>> -/*
>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>> - * for backwards compatibility.  New guests should use version 2.
>>>> +/**
>>>> + * Reference to a grant entry in a specified domain's grant table.
>>>> */
>>>> +typedef uint32_t grant_ref_t;
>>>=20
>>> ... here, past a comment unrelated to it?
>>=20
>> The comment =E2=80=9CVersion 1 of the grant table entry [=E2=80=A6]=E2=
=80=9D was moved on top of the struct grant_entry_v1, in this way
>> Doxygen associate the comment to that structure.
>>=20
>> The comment =E2=80=9CReference to a grant entry in a specified domain's =
grant table.=E2=80=9D Is moved on top of typedef uint32_t grant_ref_t
>> for the same reason above
>=20
> But it's the other comment ("A grant table comprises ...") that I
> was asking about.

I thought it was part of the brief about grant tables, am I wrong? For that=
 reason I moved it.

>=20
>>>> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>>>>     * In that case, the frame field has the same semantics as the
>>>>     * field of the same name in the V1 entry structure.
>>>>     */
>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>    struct {
>>>>        grant_entry_header_t hdr;
>>>>        uint32_t pad0;
>>>>        uint64_t frame;
>>>>    } full_page;
>>>> +    /** @endcond */
>>>>=20
>>>>    /*
>>>>     * If the grant type is GTF_grant_access and GTF_sub_page is set,
>>>>     * @domid is allowed to access bytes [@page_off,@page_off+@length)
>>>>     * in frame @frame.
>>>>     */
>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>    struct {
>>>>        grant_entry_header_t hdr;
>>>>        uint16_t page_off;
>>>>        uint16_t length;
>>>>        uint64_t frame;
>>>>    } sub_page;
>>>> +    /** @endcond */
>>>>=20
>>>>    /*
>>>>     * If the grant is GTF_transitive, @domid is allowed to use the
>>>> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>>>>     * The current version of Xen does not allow transitive grants
>>>>     * to be mapped.
>>>>     */
>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>    struct {
>>>>        grant_entry_header_t hdr;
>>>>        domid_t trans_domid;
>>>>        uint16_t pad0;
>>>>        grant_ref_t gref;
>>>>    } transitive;
>>>> +    /** @endcond */
>>>=20
>>> While already better than the introduction of strange struct tags,
>>> I'm still not convinced we want this extra clutter (sorry). Plus -
>>> don't these additions mean the sub-structures then won't be
>>> represented in the generated doc, rendering it (partly) useless?
>>=20
>> Are you suggesting to remove the structure from docs?
>=20
> Just yet I'm not suggesting anything here - I was merely guessing at
> the effect of "@cond" and the associated "skip ..." to mean that this
> construct makes doxygen skip the enclosed section. If that's not the
> effect, then maybe the comment wants rewording? (And then - what does
> @cond mean?)

Yes you were right, in the documentation the structure grant_entry_v2 won=
=E2=80=99t display the
anonymous union.

>=20
>>>> @@ -433,7 +454,12 @@ typedef struct gnttab_transfer gnttab_transfer_t;
>>>> DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>>>=20
>>>>=20
>>>> -/*
>>>> +#define _GNTCOPY_source_gref      (0)
>>>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>>> +#define _GNTCOPY_dest_gref        (1)
>>>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>>> +
>>>> +/**
>>>> * GNTTABOP_copy: Hypervisor based copy
>>>> * source and destinations can be eithers MFNs or, for foreign domains,
>>>> * grant references. the foreign domain has to grant read/write access
>>>> @@ -451,18 +477,15 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>>> * bytes to be copied.
>>>> */
>>>>=20
>>>> -#define _GNTCOPY_source_gref      (0)
>>>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>>> -#define _GNTCOPY_dest_gref        (1)
>>>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>>> -
>>>> struct gnttab_copy {
>>>=20
>>> Again the question - why the movement?
>>=20
>> Doxygen takes the comment just above the data structure to build the doc=
s, so here we are moving the
>> Comment just on top of the described structure.
>=20
> Well, okay, this then is an explanation _that_ the #define-s want
> moving, but not an explanation for where they got moved (father
> away from what they actually relate to). Personally I consider it
> good practice to have such #define-s next to the field they relate
> to (and we have such placement elsewhere). Perhaps worth
> considering to move them down rather than up?

Sure they can be moved down without problem.

>=20
> Jan
>=20
>>>> @@ -579,17 +602,19 @@ struct gnttab_swap_grant_ref {
>>>> typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
>>>> DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>>>>=20
>>>> -/*
>>>> +/**
>>>> * Issue one or more cache maintenance operations on a portion of a
>>>> * page granted to the calling domain by a foreign domain.
>>>> */
>>>> struct gnttab_cache_flush {
>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>    union {
>>>>        uint64_t dev_bus_addr;
>>>>        grant_ref_t ref;
>>>>    } a;
>>>> -    uint16_t offset; /* offset from start of grant */
>>>> -    uint16_t length; /* size within the grant */
>>>> +    /** @endcond */
>>>> +    uint16_t offset; /**< offset from start of grant */
>>>> +    uint16_t length; /**< size within the grant */
>>>=20
>>> Skipping just part of a struct is perhaps even more confusing than
>>> omitting it altogether.
>>>=20
>>> Also, what's the significance of "/**<" ?
>>=20
>> It is a doxygen pattern that tells it to use the comment as a field rela=
ted documentation.
>> If you build the documentation you will find the result, I encourage you=
 to see it to
>> realize the power of the tool and the benefits that Xen can get with it.
>>=20
>> Cheers,
>> Luca


