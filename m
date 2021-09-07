Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64154029BB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181041.328005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbC3-00028i-GY; Tue, 07 Sep 2021 13:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181041.328005; Tue, 07 Sep 2021 13:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbC3-00026m-C5; Tue, 07 Sep 2021 13:31:19 +0000
Received: by outflank-mailman (input) for mailman id 181041;
 Tue, 07 Sep 2021 13:31:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qx60=N5=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mNbC1-00026g-6z
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:31:17 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfe7ee80-0fdf-11ec-b0f3-12813bfff9fa;
 Tue, 07 Sep 2021 13:31:15 +0000 (UTC)
Received: from DB6PR1001CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::14)
 by AS8PR08MB7141.eurprd08.prod.outlook.com (2603:10a6:20b:401::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 13:31:13 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::cd) by DB6PR1001CA0004.outlook.office365.com
 (2603:10a6:4:b7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 7 Sep 2021 13:31:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 13:31:12 +0000
Received: ("Tessian outbound 620209b93b95:v105");
 Tue, 07 Sep 2021 13:31:12 +0000
Received: from a7dc6487bcbb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAF25DB4-9348-4ABC-A66F-8F4F675F57A6.1; 
 Tue, 07 Sep 2021 13:31:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7dc6487bcbb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 13:31:00 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 13:30:58 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 13:30:58 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 13:30:57 +0000
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
X-Inumbo-ID: dfe7ee80-0fdf-11ec-b0f3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHo4LrTOFjlE7FFmnLbeXvdli6Hhb31JUEvOqsq4SnM=;
 b=IMvgmKvHQesTA4cEnkAVwOSqoE3fzUeK5rvWhcl1v5IFrLu0O2A2YeUxrJwEfhJYDfH4TO02Sy896Z+2OZpTEYUIV4YuRWpZlcvpUkpbBnp5mvAOduUsdczQm0V/uO6Csp6VaZ1MiOsOHVSembYqL/XvnAiucrSycmzsdgx1AF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8183cf2115e268ed
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGWHMWRjEmBWbTm+hPJqo+sjKJoakgpceunvtbJL1JQSz2XLpRJz5aLTgqgWG74cG/TiSt2Z8GbSdRaDmMyrq4cGZq1HMxVaxyraM2kRBX7jrjA/2L/4BnueRTyW3baBYZGCufIflpD+cUq5BrRxsyG59krre1Ziei3xoo3N3TBxJEI8+QtQ+YPjU4ou0OUvd77WvcUGwOH5JkbLIB4r5PCHsvM52IbwxD0EbbljPAnMx99BAfN94dwvtnpgUa3bV55aQAuDXZs6z68ZLCOKy0XP1Ax7JpnyxmwjTOA0k+kB2IWWsdfvL5605mos4UVSlquQZNjo5JSMjd62SmBsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AHo4LrTOFjlE7FFmnLbeXvdli6Hhb31JUEvOqsq4SnM=;
 b=j7GEbzytWfyuCjAqE8uV4AeCQ1fPS1d32c/d124f6kkdWxdlpFpVKPpoKcDEWBhFu4o/+EeKbSHCtlD7PDa1MtqNHrdYMChWShFU7Xss84VPAYCqQaUTCq4ygRwebuh8MqMGUZmsZeQn0FxqlK1xSO/6Tfr/zqkJdCgnlzFbgV4gmBS6dczns/XNl5miOKekDd6xBVnaceOnDmCiYhWTGgIog9Vr4jWobYJEJS7kVeZbUdJS/MnJf6Yz6LR5PNOSIJ00/nDPM/B6iYpDhtXU8mHkfGbAiZceSQaIbetPA1UdeRI3TSewLjVgT+E3b9XzB3+hA3x8W4PSdOtR8LsvPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHo4LrTOFjlE7FFmnLbeXvdli6Hhb31JUEvOqsq4SnM=;
 b=IMvgmKvHQesTA4cEnkAVwOSqoE3fzUeK5rvWhcl1v5IFrLu0O2A2YeUxrJwEfhJYDfH4TO02Sy896Z+2OZpTEYUIV4YuRWpZlcvpUkpbBnp5mvAOduUsdczQm0V/uO6Csp6VaZ1MiOsOHVSembYqL/XvnAiucrSycmzsdgx1AF8=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1efbd9a8-232b-b267-fa8e-7f5f1af7cfed@xen.org>
Date: Tue, 7 Sep 2021 14:30:52 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5DA71CEF-0ADE-4846-A7BC-B378B95A38AD@arm.com>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
 <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
 <1efbd9a8-232b-b267-fa8e-7f5f1af7cfed@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0643375f-98da-472d-57b7-08d97203c262
X-MS-TrafficTypeDiagnostic: PAXPR08MB6969:|AS8PR08MB7141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB71419933E0E3D199A59025F4E4D39@AS8PR08MB7141.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2vB0kVeDNCTk12dH9bO0Se7/fpANSRIrd7a4cU06ohk2M8sXVdqa2YUlT26J69Iov+FdKYuZjn2MitGwexLmjPV6sg/J6Nd8doK9xwX0vO9kZsKvUpw7VBiNlL/yfiOEt2HQAjYTPsBv3oHd01OT6ngdRDwmtpP1FH5Qnf5GZ+MNER6DphS4gXOkDjUPgJsKglppjME7lVhZ8+6jNyOitum1Y8/nLfz8rZ6UGLxFkPZJIniKxV8Ecn66JCR/dM7caDFt9LxfojQY2FvD3o0kUxaY2mzR4hJw4LKr6mii5O3xl6GC5p+gPlUtJGw9mFFNSaALLVhrGJQUU1tas3fbkHHI4cfkZWOD1jtMuJ+RAZwo5oak0E+6W9p+oPC25cJa8JUy7k+hSpY7JvSGCkXnfrpPnpAxIGnyB+RwVkv+UrTSfnGrjeoksCesCbDX64IZTDYH7gtiYBtAJgChFSJdr54z497C4bPk8MNzinuLsvQK72yT+KBL2+6GqtqZ2wLjgsvWlaS4eJG6p0zib6Fqa5ylFxML21grY/l5YHOHRq86yg1Y0B7cobSW0tJgDKHrE6hb0YaCuKpDYJTpopFA0b/teLa7OmiRA3bHCoLFNhUZLTIQIsZ1754GiKN+6RtFeX9QX2vksqg3KGFqit65ZPrmtNmTFc+XmBMIo+yIP2XtKl6H05po4Ayf0RQAziuwBKQ/sWpPrkCV/Q5EK3DlPQ/yumtq0duZn2pRWA1S4hxSNEK1LlpUaDrFp8Oj8SVG8DZlg0/NzbVWeCujd2HkpA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(956004)(2616005)(86362001)(5660300002)(66556008)(54906003)(52116002)(66476007)(44832011)(186003)(6916009)(66946007)(6486002)(4326008)(478600001)(26005)(6506007)(6512007)(53546011)(33656002)(83380400001)(36756003)(8936002)(2906002)(38350700002)(6666004)(8676002)(316002)(38100700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6969
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35f4f803-6d1a-4dfd-a445-08d97203ba32
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qkckQu7eZI4UEyntSBsy5Z9ym2TBShUutExOvcOFGUZwAAHTyhTB7w7RHpbmXzq2tJbk4IH7xbzoCwyADS4BYma7J4x1SB9P/gKzr3qQ+RRHUpqK00AL9wedGth+WJGZt/Nm8giLECCikAQ1PYdYtOdDLr8i8ACTjcHDpL/worj7I9peYz02TRK+23mIDp2hywW3oPDoYUvYr6GajNOJCwjrSDGj0XIXzvjTN11bPO+uQDBtd7LH09xvfS6l9RIC6+W1RiJ/z/EM1a5HLSbmcU17Y/JXu7brscp45eFciP4CWWEky9qxKGD8tqimSpy2egF3J6WRaZnMpshLTfk+wyFAEfn9qn1zRJVn6S/uOwNAWZaQFBAi++VC/5vUmfrEG0xc5+5IMFLXglrG/nURPV2HupkzGUmeqTuus5GuMozan2gDQ56q84R69P1VmVJ5VwewYrvob5caA/B7DW/rL2/VIvR6np5SqzeZsHJ2Om5zt2v3RUGGZR7rW54BjsJ4DWVBlGnjCE3i4nrrulJWiW0AvXa61OAVCr78AqZ0vyHGWuUbWVsAW1mXZ35TVmMuBwcXALKLXCFrWkCaYpCbHgMhojmdN3aMy2SX//fQEkj5JI4jw907m+xrRbItJp0NKePRurKvwn2jscCpyDNVz5c9qUVkNWaLWubExNrV+h3LIP0swZYv03zieALeOVsZJCpOIPmV7GHAEB2p7c5vpNlV2TY41iABsp6f5Ia/ZUI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(46966006)(36840700001)(6862004)(36860700001)(53546011)(186003)(4326008)(36756003)(8936002)(70586007)(83380400001)(478600001)(6486002)(2616005)(70206006)(6512007)(6666004)(47076005)(26005)(86362001)(6506007)(956004)(82310400003)(5660300002)(336012)(8676002)(316002)(2906002)(33656002)(82740400003)(356005)(81166007)(54906003)(44832011)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:31:12.1239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0643375f-98da-472d-57b7-08d97203c262
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7141



> On 7 Sep 2021, at 13:30, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 07/09/2021 12:51, Luca Fancellu wrote:
>>> On 7 Sep 2021, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Luca,
>>>=20
>>> On 07/09/2021 07:52, Luca Fancellu wrote:
>>>> Add a design describing a proposal to improve the EFI
>>>> configuration file, adding keywords to describe domU
>>>> guests and allowing to start a dom0less system.
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>>  docs/designs/efi-arm-dom0less.md | 105 ++++++++++++++++++++++++++++++=
+
>>>>  1 file changed, 105 insertions(+)
>>>>  create mode 100644 docs/designs/efi-arm-dom0less.md
>>>> diff --git a/docs/designs/efi-arm-dom0less.md b/docs/designs/efi-arm-d=
om0less.md
>>>> new file mode 100644
>>>> index 0000000000..8d8fa2243f
>>>> --- /dev/null
>>>> +++ b/docs/designs/efi-arm-dom0less.md
>>>> @@ -0,0 +1,105 @@
>>>> +# Xen EFI configuration file
>>>> +
>>>> +The current configuration file used by Xen when it is started as an E=
FI
>>>> +application is considering only the dom0 guest and doesn't have any
>>>> +property to describe and load in memory domU guests.
>>>=20
>>> From my understanding, the problem is less about properties (we already=
 have them in the Device-Tree) but more about where are the binaries locate=
d in memory as we don't know in advance.
>> Hi Julien,
> Hi Luca,
>=20
>> I think I used the wrong word there, I meant =E2=80=9Ckeyword=E2=80=9D i=
nstead of =E2=80=9Cproperty=E2=80=9D because I was referring about the
>> lack of keywords to describe a domu guest in the Xen EFI configuration f=
ile.
>> I agree with you that on systems with static allocation, the kernel and =
ramdisk binaries must be at certain locations
>> that are out of control when we use the EFI boot services, the thing we =
can do is provide a keyword to specify the
>> addresses and then use the CopyMem() function to relocate the kernel/ram=
disk in the address we want.
>=20
> I wasn't specifically referring to static allocation here, sorry if this =
wasn't clear. I was pointing out that most of the information you create in=
 the xen.cfg is going to be similar to what we already provide in the Devic=
e-Tree.
>=20
> My main concern is everytime we add a new feature in Dom0less, a develope=
r would need to write code for the DT and UEFI. This will increase the code=
 size and maintenance.
>=20
> The same can be said for the admin as if they want to switch from plain U=
-boot to UEFI, they would also need to fully rewrite the bindings.
>=20
> AFAICT, most of the information provided in the Device-Tree are usable ev=
en when using UEFI. So I would prefer if we try to re-use what's existing. =
This is what my proposal below was about.
>=20
>>>=20
>>> So I would like to propose something that build on top of the Device-Tr=
ee work we did. Note this is early thoughts.
>>>=20
>>> The problematic nodes in the DT are:
>>>=20
>>>        module@0x4a000000 {
>>>            compatible =3D "multiboot,kernel", "multiboot,module";
>>>            reg =3D <0x0 0x4a000000 0xffffff>;
>>>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>>>        };
>>>=20
>>>        module@0x4b000000 {
>>>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>>>            reg =3D <0x0 0x4b000000 0xffffff>;
>>>        };
>>>=20
>>> In particular the property "reg" cannot be known in advance because the=
 UEFI stub will be responsible to load the binaries in memory.
>> Yes that=E2=80=99s true, the UEFI stub is using from the UEFI boot servi=
ce the AllocatePages function that is giving back an address out of our con=
trol,
>> then using another function the binary is read from the disk and copied =
at that address, finally the UEFI stub is writing the node in the device tr=
ee that
>> will be used by Xen later.
>=20
> I am not sure to follow. Are you saying the UEFI stub will create the dom=
0less node in the DT based on the xen.cfg?

Yes, in my mind the UEFI stub would have created all necessary node into th=
e chosen {} to create the system, now the stub does that
but only for the dom0 modules.

>=20
>>>=20
>>> What we could do is providing a list of binaries to load and associate =
a key for each of them. Something like:
>>>=20
>>> binary=3D<binary> <key>
>>> binary=3D<binary2> <key2>
>>> ....
>>>=20
>>> We can then replace the property "reg" with a new property "uefi,key" t=
hat will contain the name of the binary.
>>>=20
>>> What do you think?
>> Here I=E2=80=99m lost, because I don=E2=80=99t understand what we are go=
ing to do with the name of the binary.
>=20
> <binaryX> would be used by the UEFI stub to load the binary in memory. Ea=
ch binary will have a <keyX> which helps to refer them in the Device-Tree. =
To give a concrete example, let say we have two dom0less domains:
>  - DomA: 2 vCPUs, 128MB
>  - DomB: 3 vCPUs, 512MB
>=20
> DomA and DomB will be using the same kernel but a different ramdisk. xen.=
cfg, would look like:
>=20
> [global]
> default=3Dsection1
>=20
> [section1]
> options=3Dconsole=3Dvga,com1 com1=3D57600 loglvl=3Dall noreboot
> kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
> ramdisk=3Dinitrd-3.0.31-0.4-xen
> xsm=3D<filename>
> dtb=3Ddevtree.dtb
> binary=3Dvmlinuz-guest domu-kernel
> binary=3Dramdisk-domA.img domA-ramdisk
> binary=3Dramdisk-domB.img domB-ramdisk
>=20
> The chosen node in the DT would look like:
>=20
> chosen {
>    domU1 {
>        compatible =3D "xen,domain";
>        #address-cells =3D <0x2>;
>        #size-cells =3D <0x1>;
>        memory =3D <0 0x8000000>;
>        cpus =3D <2>;
>=20
>        module@1 {
>            compatible =3D "multiboot,kernel", "multiboot,module";
>            uefi,binary =3D "domu-kernel";
>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>        };
>=20
>        module@2 {
>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>            uefi,binary =3D "domA-ramdisk";
>        };
>    };
>=20
>    domU2 {
>        compatible =3D "xen,domain";
>        #address-cells =3D <0x3>;
>        #size-cells =3D <0x1>;
>        memory =3D <0 0x20000000>;
>        cpus =3D <3>;
>=20
>        module@1 {
>            compatible =3D "multiboot,kernel", "multiboot,module";
>            uefi,binary =3D "domu-kernel";
>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>        };
>=20
>        module@2 {
>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>            uefi,binary =3D "domA-ramdisk";
>        };
>    };
> };
>=20
> With this approach, the change is quite minimal to move between an classi=
c U-boot boot and EFI boot.

Ok now I see, yes this approach can work and can save some code, in the cur=
rent code we have that if
a "multiboot,module=E2=80=9D is found in the dtb, the Xen EFI configuration=
 file is skipped, but if we use the
module@XX {} without the compatible it can work, the UEFI stub will load th=
e binary and update all
the needed properties (compatible, reg).

Please let me know if we all agree on that

Cheers,

Luca


>=20
> Cheers,
>=20
> --=20
> Julien Grall


