Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172A7D060F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 03:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619617.965001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qte6v-00059S-SM; Fri, 20 Oct 2023 01:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619617.965001; Fri, 20 Oct 2023 01:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qte6v-00057I-PM; Fri, 20 Oct 2023 01:15:33 +0000
Received: by outflank-mailman (input) for mailman id 619617;
 Fri, 20 Oct 2023 01:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qte6u-0004xJ-M1
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 01:15:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 299eefb9-6ee6-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 03:15:32 +0200 (CEST)
Received: from DUZPR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::18) by DU0PR08MB7392.eurprd08.prod.outlook.com
 (2603:10a6:10:353::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 01:15:28 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::44) by DUZPR01CA0029.outlook.office365.com
 (2603:10a6:10:46b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 01:15:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 01:15:27 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Fri, 20 Oct 2023 01:15:27 +0000
Received: from 0f438b9b11cb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76B9460B-039F-422E-89C7-B534F3081F9B.1; 
 Fri, 20 Oct 2023 01:15:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f438b9b11cb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 01:15:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8082.eurprd08.prod.outlook.com (2603:10a6:150:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 01:15:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 01:15:14 +0000
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
X-Inumbo-ID: 299eefb9-6ee6-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JO4nu2+ZZR49sZ6y/Dh9LMufrhxJW+ac5Y2/Pl4DWE=;
 b=d2YZeNCmUU/6RlDjsE07oI7oq9OqQbt0Djubx05kWaaFxG+eSRy8WcpDXTTv22HUBRhP8+yq6s5tuVub0hAyND4r34LYVRTuE0ZKOEYKoOGYOcbs45c+OyYh5j+sG/OwS6OAHOCiGaPFTibnebqWOvwApc0Yq0y1IzkZRYeK+Ds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1854263bd165fd5c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esEfURn2eEMxoN6GAfZXDyw27y+2cHKXqoVX8Q97z0yVbADW2yDUYQ+ikDciGg5T9fiHoGBlNDuAZtMpACz7IWPmJdPacNmYXhp3b8hZXW9Yly2hHpTgozMGXhwPaHlmdUf3hVxtw7AL9sexpgpsdhDe0S+6thTumpXI381fDfkP1us9Ns82/JbyJLH1qqO+27jfceq42Kryb7HcajCFdWxKJQgeWf8kYTt3LBG4XcykMFNxGJrjAiO5PJA75og0Ay9Lp8LlsY6afhda9c3KPSlO0Z4LDZa2QJFWP1BVWI0Kp7NMLzdTxvXmmKo/aWd+iwrDdkTTB0I/6eKYUKEX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JO4nu2+ZZR49sZ6y/Dh9LMufrhxJW+ac5Y2/Pl4DWE=;
 b=KeqSNin7NN7UevEgNv16gCKpKW3d15CfAkvbq5fEu/2LH0tABfwqBbUXmZcTIR1ajdNmF5cWJsvWFZDJZdltfdXf4ub8wmI7cv8v/lZhFUPHKvBsf/XvaploMHksdWtYhBZkRpjZazSJXJeQXbuLk6Si7Ik6cjB5es4qhQmkSpw/A6QnIEg19NO8FTRB2XPteYy6d+agayHqYncoYOsMLiLqFLRzTL1a9cborLELNMKbR1D5dGNo7jWkzcHAvw3WTWZcIyhTvjTtGQsKIm9Gx6KpRk9jthE9uYHLeEjDL+Ihcc3e1k/OWEHaeTbVzggklO+1JNmDWMRF81eZ+EnWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JO4nu2+ZZR49sZ6y/Dh9LMufrhxJW+ac5Y2/Pl4DWE=;
 b=d2YZeNCmUU/6RlDjsE07oI7oq9OqQbt0Djubx05kWaaFxG+eSRy8WcpDXTTv22HUBRhP8+yq6s5tuVub0hAyND4r34LYVRTuE0ZKOEYKoOGYOcbs45c+OyYh5j+sG/OwS6OAHOCiGaPFTibnebqWOvwApc0Yq0y1IzkZRYeK+Ds=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in 4.18
 dev cycle
Thread-Topic: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in
 4.18 dev cycle
Thread-Index: AQHaAkwZpuNxj+yPc0utTQUv+u0QObBRScQAgACXVwA=
Date: Fri, 20 Oct 2023 01:15:14 +0000
Message-ID: <348BADAA-65C5-4234-A545-E41684538A46@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8082:EE_|DU6PEPF0000B621:EE_|DU0PR08MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c47089-5c46-48b4-8873-08dbd10a0bb6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1jeA5hqJOTsi6o+TLXgUDzHeWTYyrbGXS9eEnNwcCzhCXJJy08mhZHdnGOkmxnJvhqo5HlrATNEddEaKsfClBFQKfgN0fpIiaEGlYMfs06QJvD8wWVaWheCzBkNOkZgn14yYtJv7UTjbHxZXSHeToPOmAtFeGYi2xM/da7561Ki64nJ3wv2YMEHf+EOL/Rfqu1z3Um/G69nAz0IdAlodLUeTXIqHl+71yJ8nXHsNqUoMwO16B2U1vxcOk27ynKAO7ElDxyPh9wPeNstAp3rG9WaaVe4P4QYn8T3TBMBvo6UUggYCeJdfR6pUb9CqlEwArTQzd9H95ZqeiLc4dcIxtLzLT0nbonwXw2wzRqf9fDpmTPe6jgnidFBxgoQtQu4YZ2He72VVkKZsJH+dhs85CNqMLSi50bMH0HSaxGwM4SN4hCfQY+lbtO9xzhYjIdsXqL/DLLQ6WWD/eZUfGS3zhTaQCasyMeX0SDVAlcXxT02lVJhXqcGLEAxII0ghVrst/LJ4er9dZtiyVdNSFRkHNX0R5AjC1WwPXoxSDL8NrkKans98hvltpabqC4pRByFEQPRk/q2aGXVQfdzuW+YTGDmXnIgGeVq7Pn41XaLBKiInKYcvjHb+JsB0ivK3tP3v8pSPyDnoC7NWObrOkWx5qp0YFF1IU2AYdFq+V5We2KLuFmohoptEszsQKv+11tEk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(4326008)(66946007)(76116006)(41300700001)(8936002)(54906003)(66446008)(64756008)(6916009)(316002)(8676002)(86362001)(91956017)(66556008)(66476007)(33656002)(36756003)(2906002)(4744005)(38100700002)(53546011)(6506007)(478600001)(6512007)(122000001)(71200400001)(26005)(2616005)(5660300002)(6486002)(38070700009)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <49BDEF068735124B9E8A5EB509D41458@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8082
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e3e5530-e26c-4e70-dc87-08dbd10a03f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M9uM0JkJpTs2M+hJ1QaokcKD1RU2XqSR4Z+ya5rxrQehrvIazZfa81Sul0d7udzI6MxbwLMF4Rdan1WUu384qZOHL8HtiH2CjQw7mapBbxJZB+aHVtgKlvvWiH8W3PNZW6mvSD8f7PRxCu3wndOHM3CWxjUboFkavYSyZnIZ+sXtDn00B/Gu/IUxqembBl3MHdsNFvqCVsM0/SdQCjSWit+bB4BQ/Uha/kydBg35ZqlHf3KznIXqLy508QMvW+tdlFLCmHCSetCeGaKHTOMd/8fBPGSv/S6ZbtkdaDDtkIm3AkPQspo3BQwmeEOb/9MlL5ezBuJ+fxVQ3p7M2B0aq4EwsbOeJY4+AwSR41g1596c+iMMOAwdSakdF9VQHO2y+8yIF3QQM3dU/xvT99W/0cvlTxJ8It/we5BIKvov2hUPvO//5xQIfmO76MJue/OKC9Y3iQH8DAKF8G51PlEmH+SYEQB1quoSv0BszAIMO8IpuVbrqgtlcveNIuyY2DE4YiyWuz1XSRah/bQkMZiQwQWNFzLSQF8pc40+yRn+mvruAw76UOGZlVpm+IN++yok7yxydrJQcP4Qofssh/sVR/hkK/4wLqKUlG9d5YXgr25ZMUBBIhTfeueizGC2s+eMWSoz4c/0tS24/HUUnUIg2VtNMlqTpCJoF/BvPeqgot/LqXilKRp1c5YAwmUKUmqgLTN4bX9W7/CHAtvSVJqBY4fCGHWD2DVY42PifYgp2Nth93ld9U2pYW8szlHlD5UQ9Jaf6nQlLWOtg+4RF09Idoib97UqzsABCg11XKsXJ9M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(36840700001)(40470700004)(46966006)(36756003)(2906002)(40480700001)(47076005)(40460700003)(4326008)(70206006)(70586007)(8936002)(54906003)(316002)(5660300002)(478600001)(8676002)(6486002)(33656002)(6862004)(86362001)(81166007)(36860700001)(41300700001)(2616005)(53546011)(6506007)(83380400001)(356005)(6512007)(336012)(26005)(82740400003)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 01:15:27.8822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c47089-5c46-48b4-8873-08dbd10a0bb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392

Hi Stefano,

> On Oct 20, 2023, at 00:13, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Thu, 19 Oct 2023, Henry Wang wrote:
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> CHANGELOG.md | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 165c5caf9b..47e98f036f 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -33,6 +33,7 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>>    nodes using a device tree overlay binary (.dtbo).
>>  - Introduce two new hypercalls to map the vCPU runstate and time areas =
by
>>    physical rather than linear/virtual addresses.
>> + - The project has now officially adopted 72 rules of MISRA-C.
>=20
> I counted them again, they are 71 today. We have accepted 3 more
> recently but for the CHANGELOG.md I would stick with what is on
> docs/misra/rules.rst

lol I will send a v2.

>=20
> Assuming 72 is changed to 71 on commit:
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

Kind regards,
Henry




