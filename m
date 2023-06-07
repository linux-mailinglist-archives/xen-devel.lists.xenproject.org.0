Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82C725769
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544479.850290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oPh-0000XH-25; Wed, 07 Jun 2023 08:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544479.850290; Wed, 07 Jun 2023 08:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oPg-0000U8-UT; Wed, 07 Jun 2023 08:21:04 +0000
Received: by outflank-mailman (input) for mailman id 544479;
 Wed, 07 Jun 2023 08:21:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqqK=B3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q6oPf-0008OV-BC
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:21:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d42e659-050c-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 10:21:02 +0200 (CEST)
Received: from DU2PR04CA0315.eurprd04.prod.outlook.com (2603:10a6:10:2b5::20)
 by DB3PR08MB8842.eurprd08.prod.outlook.com (2603:10a6:10:437::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 08:20:56 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::25) by DU2PR04CA0315.outlook.office365.com
 (2603:10a6:10:2b5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 08:20:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 08:20:56 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 07 Jun 2023 08:20:55 +0000
Received: from dfe7c6cc26d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 975D2168-A510-4B2B-A9B4-C40AE137839D.1; 
 Wed, 07 Jun 2023 08:20:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfe7c6cc26d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Jun 2023 08:20:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 08:20:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 08:20:46 +0000
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
X-Inumbo-ID: 3d42e659-050c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgdeA4nka7GrSACwH5VRv/YIBEaQEJdl14TezReNxwc=;
 b=zwtHnOPiAylWmHzTyK7XCtgaOvZJOAjyi5ADXaXxWQlyFlIR/L7M34tjUbVncIbmvD9R1HWgFpj8NI3PeAgu8ZvUpfLavkZIjWAmoyFk9ocr5hIbi0Ik5c0UYW0Zmys/8/YhOEYklIEnUxEwM1BwpSpwuxQcMNGi8NTU4eho8pA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69a21bf8aada36e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg4GwOttvanJjcDnvhEvlkqHi4vdW02a2LuFgXCm3+aJ4V0BwHv0pwXZW+gUQ4UoC+yimv08ov45RwSVU/zo5p4UCcRUmb4qckwgGV5MLnvyGToheiVUj169Q6PHkXfLxmNPo3TzCJpOcrcdco0j68NLt8nYnZrgVEQLdg/mO+gjR+lp/o6lAs+JP3Mbrrf7CLVjy7rGYnJJi8oH17p/B8rjd6CtA6WtIQcs2PPHOLdgkWGmUZhh1MCBUPeTis4uNHSF13NuLN55zDa/axnZTJ9fHzzM9GVF63cqThDcsYI6Lv/1QHLmP9A51rWmVmofZPzg3ywMcEj0xLfAtn0Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgdeA4nka7GrSACwH5VRv/YIBEaQEJdl14TezReNxwc=;
 b=dI5Z0x43rU+m7DL6CiaFnMHPMNzsrFLD8FobYf7fOwcSxb8BXq80onBGNwHWnlaIOT0yC50dI6Apfyj7MpkVXa9b9YkRHVBlrUS/toeWCXh2Q0H1EgZdyiDMGLne39Q4pTNfSmvjaaUcDjr9fnhI1jdso5DXHyV8CnZqTuIejgrf3ApWtyJhc310iALXwqQyJFK6LbwpDf6NbKQ5J4gQnxoQt4ebhjbga5ODvo/u0fAppsrSNwkXYDRiwxJD+caj5QitQMlSuVX7tw9QdvUTinjdFakLKmq3cmouKKd3L2aaDeWMiHpT4ar2cfG/6JNzaj16oGdLlaWtJiVcpJVimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgdeA4nka7GrSACwH5VRv/YIBEaQEJdl14TezReNxwc=;
 b=zwtHnOPiAylWmHzTyK7XCtgaOvZJOAjyi5ADXaXxWQlyFlIR/L7M34tjUbVncIbmvD9R1HWgFpj8NI3PeAgu8ZvUpfLavkZIjWAmoyFk9ocr5hIbi0Ik5c0UYW0Zmys/8/YhOEYklIEnUxEwM1BwpSpwuxQcMNGi8NTU4eho8pA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen: Fix incorrect taint constant
Thread-Topic: [PATCH v2] xen: Fix incorrect taint constant
Thread-Index: AQHZl6An0ZVCR8BjEkS3vk0sA5g2C69+/+QAgAACuYA=
Date: Wed, 7 Jun 2023 08:20:46 +0000
Message-ID: <C695B8A5-52E9-4809-89A3-65B028BC5834@arm.com>
References: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
 <1f356d3b-7068-088a-a59b-eadbfb3f59cd@suse.com>
In-Reply-To: <1f356d3b-7068-088a-a59b-eadbfb3f59cd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB6148:EE_|DBAEUR03FT050:EE_|DB3PR08MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: dff77b60-f97c-477d-e4ab-08db67301de4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XKqNgCkkw5kK4epMs/NbdMpOHm2MMiaX+MM9F52EDgC18Vg9cekCLfJA4DFwtADImVHV4pK1xuQsFyfRFXbdB6HMrUE/i3+kHjmO5EMsnZBrqKC0WuKdWdMPGvejR8y04Jkpcp7TAqXuL1lE1XXhSuMo1b/XK4zEAhO2dHM8TiU+Vd37ZUfFj9KmEYU4PLjTQfVuaGq4cJzTKyHSLsc/njt6FLuBPLR1DAqwGFwGqv+0YyusXfX8ikqLXWJHtPm9zyBAaLv7X5PsEFr909CFxAzT+CQOpIG+g2scTqJ9Kp07Z2KD+vFUaabEkxtwbL6+N3iIHCRkP4rdeFM7urdC9a5Oe3AWiOeF/aM52GOiG3iGRlkk1XSryidc2hDFsNMIbU4D5CQ4ZVaDHeYXWLXipCk9ZHXTmDx0RciBlskn1kKty/O2uIOZGODjkB8U02cUUa9ljQxxl9/KW0Zga3rmzMaaKoG96Bl3fzFSvFgp+48KwcmGob0xiWMbMMycDIGAXkuFuUjQFBg5f+hloboxtgOhYzrfjGAYQ5btaADQlMfEPyvRAkcbWSoDekPRSV+STzoZXdmvjKXZ9gxwBtYUgMWvgXEtUNWDUE+zrMhKlVIFa1PuIeMn8KEnajF4RwbArbDv+8Zuj6Hja97nZoBASg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(186003)(8676002)(8936002)(6916009)(4326008)(66556008)(66446008)(66476007)(64756008)(66946007)(91956017)(76116006)(5660300002)(316002)(41300700001)(54906003)(4744005)(83380400001)(2906002)(478600001)(122000001)(38100700002)(6512007)(6506007)(53546011)(86362001)(71200400001)(33656002)(6486002)(2616005)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2AFD00FFDDC5CA499A388D19CA9063F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5338fee9-a601-4ef7-ca13-08db6730181d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RckeJmrdG6uGSVwQPmHSdTXvGL2rkRgMSNzGvy2hg42jDSRhxO9RoUQDFxediyrmgR/9nZnNTvhDs1dcV3ANyYX/NMAAmLRllFHubB1WyokGCFeb1HvrmsA/pua2Ur8Yi1zn6oDDe57Wlo04P8ReyhndU7uq21fp0UjVZxaMEdSKV9LMGLdVFg8uHm1D+oJwbdmphuLa00f9WX3ghzACipewKhNeKXdbxuYz4UJGiowhNg3B4mPvl7cMB2qV/ZXWcFTNNVC47ddWtro7gmheinRKuaYN1ibZTbKl9PlJKvc7UG0NwHnaKYjC1g5nYwqeOUPF7AWlujPl6aoO4AaffkMwOA/zyrytxIrsHI8UGamRlM5S/UFofJ/h+KB1oYpUzHY4HmZpacHXA/spu/Pco28UbQylVV9kZbYT8FDCTy1wlRnDOvqo594bo9OaoGchsbDZBrruTRGy8M6Yp4mzYn9+yLjd68VyJXt+oGNHMu0ThHIwTeYP3ASr4RPdIHdYeWAb18mjoCsD6oNFj4x5dF2d28CenG2h0meL3ASMaxHPlUXYiIW6iHR+WZX1oJbSWWX2vQze46lv1ZB2KysVXqWgTY6scnjLsVOIBdixWdsTdzy7E92g1mx0BY/QYLXk3niCcsIBmgI8oYT5m+MAU++Y8wx2b3tbece/VQYMV2WkkN4uAO9603B9e8re/LK7KqaJYSH2NnjU3Rf0Va+J+QkRNWyPJ+YOKear6U6yQL+ZqxLRI1fcR0txmHr3J64A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(4744005)(47076005)(2906002)(336012)(83380400001)(2616005)(82310400005)(33656002)(36756003)(86362001)(356005)(81166007)(82740400003)(36860700001)(40480700001)(6486002)(41300700001)(5660300002)(316002)(8676002)(6862004)(8936002)(54906003)(478600001)(70206006)(70586007)(4326008)(6512007)(53546011)(6506007)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:20:56.0532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dff77b60-f97c-477d-e4ab-08db67301de4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8842

Hi Jan,

> On 7 Jun 2023, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.06.2023 13:23, Andrew Cooper wrote:
>> v2:
>> * Fix commmit message
>> * Update comment ahead of print_tainted()
>> * Change the emitted char from 'U' to 'I'
>=20
> Just to mention it: With this additional change I'm no longer
> considering this applicable to stable trees. I realize that one could
> argue that by taking it we could accelerate learning that we broke
> someone (if anyone), but I'm not inclined to follow this line of
> thinking. If Arm maintainers (seeing that only Arm uses this right
> now) think they want the change nevertheless, I'd include it,
> though.
>=20

Not sure if it is what you mean here, but this is not a candidate for=20
backports definitely.

Or do you mean something else here ?

Bertrand

> Jan


