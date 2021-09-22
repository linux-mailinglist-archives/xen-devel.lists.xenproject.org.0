Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577AC414479
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192292.342669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyB3-0004ys-Pq; Wed, 22 Sep 2021 09:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192292.342669; Wed, 22 Sep 2021 09:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyB3-0004x3-L6; Wed, 22 Sep 2021 09:04:29 +0000
Received: by outflank-mailman (input) for mailman id 192292;
 Wed, 22 Sep 2021 09:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btef=OM=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mSyB1-0004wx-S7
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:04:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 157d4284-1b84-11ec-b966-12813bfff9fa;
 Wed, 22 Sep 2021 09:04:25 +0000 (UTC)
Received: from AS8PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:20b:331::33)
 by VE1PR08MB4767.eurprd08.prod.outlook.com (2603:10a6:802:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Wed, 22 Sep
 2021 09:04:22 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::5f) by AS8PR04CA0178.outlook.office365.com
 (2603:10a6:20b:331::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 22 Sep 2021 09:04:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 09:04:21 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Wed, 22 Sep 2021 09:03:46 +0000
Received: from b5498b7ae3eb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6C19471-31C3-469C-B847-DF878F39C896.1; 
 Wed, 22 Sep 2021 09:03:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5498b7ae3eb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Sep 2021 09:03:34 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6719.eurprd08.prod.outlook.com (2603:10a6:102:137::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 09:03:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 09:03:32 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 09:03:32 +0000
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
X-Inumbo-ID: 157d4284-1b84-11ec-b966-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RQglqc++WdG6G3/Aa49Tp5rLAbbmw/GSFFX4GGk4nc=;
 b=jCBa64H5zexRA/T1po+3yHOCwH1atD8hTGqZoOqPFaBapj+JQ0fcuXdcE5eb8lVR6qQCtRUrCXd+943wA0B4bi/ojekPOtRM4w24fepJqkTTkQeRmku0ioE612RX2oGMprmBY0fnsufQufs9aiTW/NRFV35eNCGvIyOSKKH5XKk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5bc6b47a4f41cfa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctVoS2m8LdiaqKaj3tp1ELdu7ftiuBBWriGPB70Ry4XwRew3pIQR+z9JGUrDs1d2ez74RdesmYfusz4YI9eHv6kcMJtukhWXmEw4oGVeQ0A5nYQjjXSWAi1UAZeJnLG1eQvYMGFwPbnxJCj0wl1EmoQ9JpiMtLLjbl4p4EbzS9XNg3mTYjv//30Ji83Ghj8RTl7OhKdyxZ3jLFrrnB/6Iuq8DihBGktM1ioNXFS2yUupoy2iYB5oV2W/2sWWPDIaE/acQ8hX/2bViWNBRpB5tNlpkJ9ZEaaJpVvvw9BmlW5Z+EFEYI0HqOTxG4tev8SYSGq2BVONcl+x/YmJITQHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3RQglqc++WdG6G3/Aa49Tp5rLAbbmw/GSFFX4GGk4nc=;
 b=Wu/IWWN0eIzNx4qLC/2TGXEojXgQPUsx1DOjUzVhO01H52avN2QeZ83ybQ/trlbLqXGXcWfYe6cxzHyuJ9SFYTyU31ooS+MY3sVFUo9TI/Stayl9ygal4v+FVzkXCBaN4hqR/Mdpboh8Xe0Rrhgfiiz9zmEv9fftaiDlpA7dfU7B4CxOT90mmXG0SuUV/89hoxGiSrrQ2fvzoTw2ZP2IUgHapUtaQRQ57t3bWYOTUd021dDii9STMdhCV0e8HK2AWCygheU+hUID950BQMcIfyc6/+cJSxB5wbTIIzsObxlrPwFgVrTaeaZKXgoPbAsMdMsFiq9JnujYAcmYY0o5TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RQglqc++WdG6G3/Aa49Tp5rLAbbmw/GSFFX4GGk4nc=;
 b=jCBa64H5zexRA/T1po+3yHOCwH1atD8hTGqZoOqPFaBapj+JQ0fcuXdcE5eb8lVR6qQCtRUrCXd+943wA0B4bi/ojekPOtRM4w24fepJqkTTkQeRmku0ioE612RX2oGMprmBY0fnsufQufs9aiTW/NRFV35eNCGvIyOSKKH5XKk=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109211357280.17979@sstabellini-ThinkPad-T480s>
Date: Wed, 22 Sep 2021 10:03:23 +0100
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D171A1CD-ED8E-45F6-A311-92809158415F@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
 <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
 <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
 <29091674-DCAE-4289-901E-9158FD029D96@arm.com>
 <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com>
 <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s>
 <28787ACF-F70E-49C8-B3E2-CFCE8E9B6AA7@arm.com>
 <alpine.DEB.2.21.2109171516270.21985@sstabellini-ThinkPad-T480s>
 <18531A94-ECF7-4840-A515-B161A4ABDEF4@arm.com>
 <alpine.DEB.2.21.2109211357280.17979@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::28) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62459d39-1037-4de6-29a9-08d97da7f7c2
X-MS-TrafficTypeDiagnostic: PAXPR08MB6719:|VE1PR08MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB476788BBBA2CD94BB917BFAAE4A29@VE1PR08MB4767.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D/MlVKPRt7YKjBoUgFQbt/VyCf7ZcklQQ7GZj4Bb49IWT/EEfT1+b6IYEn55UvsrWAfkii2NFSegB75VnHb26SWv0Zh6DtunFlqgpEjBowj23BGmA32lByRo6OilQ2tjj74eKGpjaWXHNYs6USR0/UC2Y88GsbNvlQiN6rR6nQOe4PCjB0RQXTuKL2ASwEQiq+8kU8JSuMp3GlnmTH1pPTzsaYtHbj++Jm/kmDw1gw5ud+1KTD07gaWhSLfykYiJ8yAeKlFkYK0Ouc+W53FvDUZRawqZku6rBvAvq6n7fyeDLmalivDn7yvYIM0uVywIqFLcdCydhUK6MfYKhD9sKKjtPqJMT9weBB79dsQ9d+AqL8cSC/VOofgIP3nG1MvBCgri4f7/n5jpVOz4lxq1wa9zIR+1QrgvGy2mCaP0egJ2zfqB6Q0AVpph3IGX8vQwknbItLZKzqGr5T7CXIHqtCWXa2QvhW67G9ON3BokoJEorjLwn2sJ001TrC+pZdrhV6gNV+/hRG6cdepZYHbYfsLGue3fFO9+IeHRzXSf3aVKJMPxjDUwviZVMS7OfoZj1sXDV8Bjw2UXsY+q41muXu3CtLBEmaOwPjy4oR6Nol9lgZ0+M69pu7fiH4gQEazWVwoc0SNJyojy/ZQWRhKMAXio32MWfhSvZZm4BBaEOu2vOCV7ZM5HWjih51oOy+2RCXemCWn3CCSU9CZ28Ssg58jcqKvchyX233zwynmt+i+qdHIB9IfBDhHxwxHCEUNbNovbM6PqxdkGSYPZGBpeHsXky8VQ5rCCZYVQ2lz+ftzifv2DSev1D4hSnAMnDCNoEgmmgPLFtgEsMFIDBJ0qkw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6666004)(52116002)(54906003)(2616005)(36756003)(44832011)(956004)(26005)(53546011)(5660300002)(66476007)(33656002)(4326008)(316002)(8676002)(66946007)(6486002)(66556008)(38100700002)(966005)(8936002)(508600001)(83380400001)(6512007)(6916009)(186003)(86362001)(6506007)(30864003)(38350700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6719
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39a97e73-d111-47a0-dd14-08d97da7da4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ixj3tOjMU3OWQ0kWAtP70k1gjpy/mT4THfu/3O/xf65r9wdVtdaq5X+AC9lOm6qtBeuw40ZM/re5Lazsq00c4yKKq+SoJa+ClVGweWKku64UZyllylkDCNO6v7qWrkBRcRb0l8pceGHrYquLXAjZ46TkL8ACEzR8PMs6lFWJjS0V9RkLtuSRDDGGqC1OOfs3/x8vIKkDVJGtM/kDXZ5e6HEICh4SAPi+0yjzkHm50x1vO0Djhn3zZGNhRw49FkYBY+gUAOGt2bEfuz1W/ONxUrihOytVcfwArv7bD/8hqGF0PZyDiJfC2vrC3AqNsTvavOspbG7cqqALFyVff4OfKmchYkz00fcTcCAy4vSls5C2mdISA/PIFs52dRgpjR6Y0PENeVCWIpMsdJBhsVFtby9+JCLQ4GYUH9/rrmwuotwmlNpj4h8xKTP9NJhHJf8GQVcdmERmfWFDNJrN9IyyZAGwiEIgbNpKsRv6f4Mbs9g/crufv2RHSvW5R2YHoWlJtRz6V0y9JSz+4szU5jP1nxkluHVsJYqd8QcoeSEofbYzBhk6Ktc49gjLRdcvdJsYeAPfRhPUHA5Yx9XjJQPEPdVPEKiM3VPWRnu09uK/gMJ4YvF7pOa6cyQ+GeL+P5CbHX2qXjPyq8Bdow/smn+s2zB8I+ksXp/iE+XmyYwuxJRvVir9mF0hoiMPyouNG2Lk38/0eovtFwxspYIAda+ehBXbKOikkaBmz9+APDSj8VlopAmOGWX7Pkztk9vysmsBKPyWMJCojFezJ8CcfD4p0QKsBbB9rTderzhaAvkvy7DtBu4VLYrTu+yWy0kRllLH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(36756003)(966005)(36860700001)(53546011)(356005)(30864003)(33656002)(6666004)(6512007)(2906002)(8676002)(6486002)(6506007)(8936002)(82310400003)(83380400001)(186003)(26005)(2616005)(956004)(316002)(70206006)(336012)(86362001)(44832011)(54906003)(81166007)(4326008)(70586007)(47076005)(6862004)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:04:21.8513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62459d39-1037-4de6-29a9-08d97da7f7c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4767



> On 21 Sep 2021, at 22:34, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Tue, 21 Sep 2021, Luca Fancellu wrote:
>>> On 17 Sep 2021, at 23:33, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>> On Fri, 17 Sep 2021, Luca Fancellu wrote:
>>>>> On 16 Sep 2021, at 21:16, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>>>>>=20
>>>>> On Thu, 16 Sep 2021, Jan Beulich wrote:
>>>>>> On 16.09.2021 17:07, Luca Fancellu wrote:
>>>>>>> I explain here my understanding on dom0less, this feature is used t=
o start domUs at
>>>>>>> Xen boot in parallel, the name is misleading but it doesn=E2=80=99t=
 require dom0 to be absent.
>>>>>>>=20
>>>>>>> So if you have a dom0 kernel embed in the image, it's completely fi=
ne to start it and it=20
>>>>>>> doesn=E2=80=99t have to be skipped.
>>>>>>>=20
>>>>>>> Here the possible user cases:
>>>>>>> 1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen imag=
e]
>>>>>>> 2) start only domUs, true dom0less [no dom0 modules on xen.cfg or e=
mbedded in Xen image, domUs on DT]
>>>>>>> 3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xe=
n image) and domUs on DT]
>>>>>>=20
>>>>>> If that's the intention - fine. Stefano?
>>>>>=20
>>>>=20
>>>> Hi Stefano,
>>>>=20
>>>>> What do you mean by dom0 modules embedded in the Xen image? I am not
>>>>> familiar with it, but I imagine it doesn't involve any multiboot,modu=
le
>>>>> nodes in device tree, right?
>>>>>=20
>>>>> Putting aside "dom0 modules embedded in Xen image" that I didn't full=
y
>>>>> understand, there are three ways to load Dom0:
>>>>>=20
>>>>> - dom0 kernel (and ramdisk, optional) on xen.cfg
>>>>> - dom0 kernel (and ramdisk, optional) on device tree using the "reg" =
property
>>>>> - dom0 kernel (and ramdisk, optional) on device tree using the "uefi,=
binary" property
>>>>=20
>>>> True for the #1 and #2, the last one is not implemented. The uefi,bina=
ry property
>>>> for now is only used to load domU modules.
>>>=20
>>> Yeah, it is no problem that is not currently implemented, but from a
>>> device tree binding / efi interface perspective it should be possible.
>>>=20
>>>=20
>>>>> Then, the other use cases are:
>>>>>=20
>>>>> - true dom0less, domUs on device tree using the "reg" property
>>>>> - true dom0less, domUs on device tree using the "uefi,binary" propert=
y
>>>>>=20
>>>>> And of course all the possible combinations between Dom0 and DomU
>>>>> loading.
>>>>>=20
>>>>>=20
>>>>> Currently, patch #1 checks for the presence of a Dom0 kernel node and=
, if
>>>>> present, it decides not to proceed with xen.cfg. So if the Dom0 kerne=
l
>>>>> node is *not* present, efi_arch_use_config_file returns true.
>>>>>=20
>>>>> However, this could be a true dom0less configuration without any Dom0
>>>>> kernel. If so, you might not want to load xen.cfg at all because it i=
s
>>>>> not needed. In a true dom0less configuration, we probably want
>>>>> efi_arch_use_config_file to return false.
>>>>=20
>>>> In a true dom0less configuration we might need to read xen.cfg to retr=
ieve the
>>>> Xen command line,=20
>>>=20
>>> The Xen command line could also be on device tree
>>> (/chosen/xen,xen-bootargs).
>>>=20
>>>=20
>>>> but following the actual implementation of the common code
>>>> there is more. I=E2=80=99m going to explain.
>>>>=20
>>>> What efi_arch_use_config_file really does is not only choosing to read=
 xen.cfg
>>>> or not. Following the common code (xen/common/efi/boot.c) and what its=
 result activate
>>>> along the path, it basically decides if the UEFI stub is used as a loa=
der from filesystem
>>>> or not. We need the UEFI stub as a loader to be 100% UEFI and load our=
 modules.
>>>>=20
>>>> The original check basically says =E2=80=9Cif there are multiboot,modu=
le in the DT, then some
>>>> bootloader has loaded in memory the required modules so I=E2=80=99m no=
t gonna load anything
>>>> from the filesystem because I assume it puts everything in place for m=
e to boot.=E2=80=9D
>>>=20
>>> OK, I am following. It looks like this is the source of the issue.
>>>=20
>>>=20
>>>>> From misc/efi.txt:
>>>> When booted as an EFI application, Xen requires a configuration file a=
s described below unless a bootloader,
>>>> such as GRUB, has loaded the modules and describes them in the device =
tree provided to Xen. If a bootloader
>>>> provides a device tree containing modules then any configuration files=
 are ignored, and the bootloader is
>>>> responsible for populating all relevant device tree nodes.
>>>>=20
>>>> What I=E2=80=99m doing in patch #1 is restricting that check to just t=
he multiboot,module that are
>>>> Dom0 module, why? Because with the introduction of dom0less we need to=
 specify
>>>> multiboot,modules for domUs, but the presence or not of dom0 modules i=
s the only
>>>> Information we need to understand if the user decided to start Xen wit=
h everything
>>>> in places (modules in memory, xen command line, dtb) or if the job is =
demanded to the
>>>> UEFI stub and its configuration file.
>>>=20
>>> I don't think so. Imagine a case where the user has everything in devic=
e
>>> tree, doesn't need xen.cfg, but dom0 and domUs are specified as
>>> uefi,binary.
>>>=20
>>> We don't want xen.cfg but we do want to be able to load files from the
>>> filesystem. This might not be currently implemented but from an binding=
s
>>> perspective it should be possible.
>>>=20
>>>=20
>>>> By the configuration file you can also load in memory the Xen dtb, so =
Xen can
>>>> be started as an EFI application without the DTB and then load it usin=
g the EFI stub.
>>>=20
>>> This can be very useful but it would follow the !fdt check and return
>>> true from efi_arch_use_config_file. So it doesn't really conflict with
>>> anything we would around multiboot,module and xen,cfg-loading.
>>>=20
>>>=20
>>>> I=E2=80=99m not against this new property =E2=80=9Cxen,cfg-loading=E2=
=80=9D, I just think it is not needed because
>>>> we have all the information we need without it and in any case we need=
 to read the
>>>> configuration file because otherwise we won=E2=80=99t have access to t=
he Xen command line.
>>>=20
>>> We don't necessarely need to read the Xen command line from xen.cfg :-)
>>>=20
>>>=20
>>>> Now I=E2=80=99m going to show you examples of all use cases that are v=
alid with the introduction
>>>> of this serie:
>>>>=20
>>>> 1) Start Xen as EFI application and load only Dom0
>>>>=20
>>>>   Xen.cfg:
>>>>   [global]
>>>>   default=3Dxen_dom0
>>>>=20
>>>>   [xen_dom0]
>>>>   options=3D<Xen command line>
>>>>   kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>>>>   ramdisk=3Dinitrd-3.0.31-0.4-xen
>>>>   dtb=3D<xen DTB>
>>>>=20
>>>>   DT:
>>>>   {no modification}
>>>>=20
>>>> 2) Start Xen as EFI application to load a true dom0less setup
>>>>=20
>>>>   Xen.cfg:
>>>>   [global]
>>>>   default=3Dxen_true_dom0less
>>>>=20
>>>>   [xen_true_dom0less]
>>>>   options=3D<Xen command line>
>>>>   dtb=3D<xen DTB>
>>>>=20
>>>>   DT:
>>>>   chosen {
>>>>       #size-cells =3D <0x1>;
>>>> 	#address-cells =3D <0x1>;
>>>>=20
>>>> 	domU1 {
>>>>           #size-cells =3D <0x1>;=20
>>>>           #address-cells =3D <0x1>;
>>>>           compatible =3D "xen,domain=E2=80=9D;
>>>>           cpus =3D <1>;
>>>>           memory =3D <0 0xC0000>;
>>>>=20
>>>>           module@1 {
>>>>               compatible =3D "multiboot,kernel", "multiboot,module=E2=
=80=9D;
>>>>               bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=
=80=9D;
>>>>               uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
>>>>           };
>>>>=20
>>>>           module@2 {
>>>>               compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,m=
odule=E2=80=9D;
>>>>               uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
>>>>           };
>>>>=20
>>>>           module@3 {
>>>>               compatible =3D "multiboot,device-tree", "multiboot,modul=
e=E2=80=9D;
>>>>               uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
>>>>           };=20
>>>>       };
>>>>=20
>>>>       domU2 { <as above> };
>>>>   }
>>>>=20
>>>> 3) Start Xen as EFI application to load Dom0 and DomUs
>>>>=20
>>>>   Xen.cfg:
>>>>   [global]
>>>>   default=3Dxen_dom0_domUs
>>>>=20
>>>>   [xen_dom0_domUs]
>>>>   options=3D<Xen command line>
>>>>   kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>>>>   ramdisk=3Dinitrd-3.0.31-0.4-xen
>>>>   dtb=3D<xen DTB>
>>>>=20
>>>>   DT:
>>>>   chosen {
>>>>       #size-cells =3D <0x1>;
>>>> 	#address-cells =3D <0x1>;
>>>>=20
>>>> 	domU1 {
>>>>           #size-cells =3D <0x1>;=20
>>>>           #address-cells =3D <0x1>;
>>>>           compatible =3D "xen,domain=E2=80=9D;
>>>>           cpus =3D <1>;
>>>>           memory =3D <0 0xC0000>;
>>>>=20
>>>>           module@1 {
>>>>               compatible =3D "multiboot,kernel", "multiboot,module=E2=
=80=9D;
>>>>               bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=
=80=9D;
>>>>               uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
>>>>           };
>>>>=20
>>>>           module@2 {
>>>>               compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,m=
odule=E2=80=9D;
>>>>               uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
>>>>           };
>>>>=20
>>>>           module@3 {
>>>>               compatible =3D "multiboot,device-tree", "multiboot,modul=
e=E2=80=9D;
>>>>               uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
>>>>           };=20
>>>>       };
>>>>=20
>>>>       domU2 { <as above> };
>>>>   }
>>>>=20
>>>> So as you see every case is covered without the introduction of the
>>>> property.
>>>>=20
>>>> Please let me know what do you think.
>>>=20
>>=20
>> Hi Stefano,
>>=20
>>> I think that from an interface perspective (not a code perspective) we
>>> need to be able to account for cases like:
>>>=20
>>> 4) Start Xen as EFI application and load only Dom0
>>> no Xen.cfg
>>> DT:
>>> xen,xen-bootargs
>>> dom0/uefi,binary
>>> domUs/uefi,binary
>>>=20
>>>=20
>>> But in any case, even disregarding this case, past experience has taugh=
t
>>> me that it is always better to have an explicit flag to trigger a new
>>> behavior, rather than relying on "guesswork". If we introduce
>>> "xen,cfg-loading", we are going to be a lot more future-proof that if w=
e
>>> don't introduce it in terms of backward and forward compatibility in
>>> case we need to change anything.
>>=20
>> I see your point, for sure the DT is a more powerful tool than the simpl=
e
>> text configuration file and it would be the best interface.
>> However I think we are moving into the direction where x86 and arm
>> are going to diverge even if we can have a common interface for them
>> (the configuration file).
>=20
> Consider that the configuration file is not the only interface to Xen
> any longer. There is also HyperLaunch and I was trying to align to it:
> https://marc.info/?l=3Dxen-devel&m=3D162096368626246 The DT-based approac=
hed
> would be very well aligned with HyperLaunch.
>=20
>=20
>> For that reason I=E2=80=99m asking if you would be willing to accept a s=
olution
>> where we introduce a new keyword in the configuration file:
>>=20
>> dom0less=3D<dtb> OR domu_guests=3D<dtb> OR I=E2=80=99m open to suggestio=
n.
>>=20
>> Where the pointed dtb contains the domU domains:
>>=20
>> /dts-v1/;
>>=20
>> / {
>>    /* #*cells are here to keep DTC happy */
>>    #address-cells =3D <2>;
>>    #size-cells =3D <2>;
>>=20
>>    domU1 {
>>           #size-cells =3D <0x1>;=20
>>           #address-cells =3D <0x1>;
>>           compatible =3D "xen,domain=E2=80=9D;
>>           cpus =3D <1>;
>>           memory =3D <0 0xC0000>;
>>=20
>>           module@1 {
>>               compatible =3D "multiboot,kernel", "multiboot,module=E2=80=
=9D;
>>               bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=80=
=9D;
>>               uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
>>           };
>>=20
>>           module@2 {
>>               compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,mod=
ule=E2=80=9D;
>>               uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
>>           };
>>=20
>>           module@3 {
>>               compatible =3D "multiboot,device-tree", "multiboot,module=
=E2=80=9D;
>>               uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
>>           };=20
>>    };
>>=20
>>    domU2 { <as above> };
>>=20
>> };
>>=20
>>=20
>> So that the user cases we discussed are valid:
>>=20
>> 1) Start Xen and load Dom0:
>>=20
>>   Xen.cfg:
>>   [global]
>>   default=3Dxen
>>=20
>>   [xen]
>>   options=3D<Xen command line>
>>   kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>>   ramdisk=3Dinitrd-3.0.31-0.4-xen
>>   dtb=3D<xen DTB>
>>=20
>> 2) Start Xen and load only domUs (true dom0less)
>>=20
>>   Xen.cfg:
>>   [global]
>>   default=3Dxen
>>=20
>>   [xen]
>>   options=3D<Xen command line>
>>   dom0less=3D<dom0less DTB>
>>   dtb=3D<xen DTB>
>>=20
>> 3) Start Xen and load Dom0 and DomUs
>>=20
>>   Xen.cfg:
>>   [global]
>>   default=3Dxen
>>=20
>>   [xen]
>>   options=3D<Xen command line>
>>   kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>>   ramdisk=3Dinitrd-3.0.31-0.4-xen
>>   dom0less=3D<dom0less DTB>
>>   dtb=3D<xen DTB>
>>=20
>>=20
>> With this change we will be consistent across x86 and arm UEFI boot
>> start procedure, we won=E2=80=99t touch the current check on multiboot,m=
odules
>> because it will be valid, we will have a way to boot dom0less and it
>> requires less testing for the changing in the common code.
>>=20
>> Please let me know what do you think about that.
>=20

Hi Stefano,

> My order of preference from best to worst is:
> 1) my previous suggestion, e.g. xen,cfg-loading

Thank you now I have the big picture, I will introduce the xen,cfg-load
In the v2 serie.

Cheers,
Luca

> 2) your previous suggestion, e.g. change the multiboot,modules check
>   without adding xen,cfg-loading
> 3) this proposal
>=20
>=20
> Let me explain the reason behind this. This proposal still requires a
> device tree but it has to be loaded from the config file, which is
> limiting compared to the other approaches. From a user perspective is
> just as complex (just as difficult to write) but less flexible because
> it prevents using the device tree alone for UEFI booting in the future.
> Given that with the two other alternatives the config file could still
> be used anyway, I don't think that adding the "dom0less" parameters to
> the config file buys us much in terms of alignment with x86. This is
> why this is my least favorite option.
>=20
> Your previous approach is actually quite good. Same complexity but much
> more flexible. Similar alignment with x86 in my view. The only
> correction I suggested is the addition of xen,cfg-loading to make the
> efi_arch_use_config_file check more robust. However, I still prefer your
> prevous approach even without xen,cfg-loading.
>=20
>=20
> Let me make one more suggestion based on your previous approach (I mean
> this version of the patch series):
>=20
> - You have already removed the panic for ARM in case a dom0 kernel is
>  not specifid in patch #2. We can go farther than that and make the
>  absence of xen.cfg not a fatal failure on ARM because it is fine not
>  to have dom0 in true dom0less configurations and the xen cmdline is
>  optional anyway.
>=20
> - If the absence of xen.cfg is not a fatal failure, then we don't need
>  efi_arch_use_config_file anymore. Let's try to load xen.cfg always. We
>  error out if xen.cfg specifies a dom0 kernel and we already have a
>  dom0 kernel in DT.
>=20
> - In the future a "don't load xen.cfg" option (the opposite of
>  xen,cfg-loading) could be added but it is not necessary now
>=20
>=20
> This should be a minimal change compared to this version of the patch
> series, enable all the use-cases you care about, and also be more
> flexible for the future.


