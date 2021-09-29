Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B48441C21F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198982.352764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVWLA-00074I-7V; Wed, 29 Sep 2021 09:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198982.352764; Wed, 29 Sep 2021 09:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVWLA-00072V-4L; Wed, 29 Sep 2021 09:57:28 +0000
Received: by outflank-mailman (input) for mailman id 198982;
 Wed, 29 Sep 2021 09:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzIg=OT=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVWL8-00072P-9v
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:57:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 134cf356-c946-425e-b1f1-27305a21cba1;
 Wed, 29 Sep 2021 09:57:23 +0000 (UTC)
Received: from AS9PR06CA0125.eurprd06.prod.outlook.com (2603:10a6:20b:467::21)
 by AM6PR08MB4534.eurprd08.prod.outlook.com (2603:10a6:20b:ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 09:57:22 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::fa) by AS9PR06CA0125.outlook.office365.com
 (2603:10a6:20b:467::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 09:57:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 09:57:21 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Wed, 29 Sep 2021 09:57:18 +0000
Received: from 07b611582d59.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40E3DC09-E419-4D77-93F2-C58DF2994371.1; 
 Wed, 29 Sep 2021 09:57:05 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07b611582d59.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 09:57:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4716.eurprd08.prod.outlook.com (2603:10a6:101:28::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 29 Sep
 2021 09:57:03 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 09:57:03 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 09:57:02 +0000
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
X-Inumbo-ID: 134cf356-c946-425e-b1f1-27305a21cba1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPlE21yHvhQGy9bHY5vx0+F3mBZzPuTgUiQXsij4Bsw=;
 b=ZAESu1wlDK+fAxVxNQWCBsyp/uov8oV5X0CKkaGdg+B88+EyQQyeQohlANskX8TqWKVbRtfHgiTTHP4fhfrXUe8FAw+Gytqyvrr0HAPyBwVEWqkp9ScDsMpfpdnZU6fJAyRgWTuWGntyGQm5SiVGUnwNT5tBRH3BmhHrbE7vHjo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa68625dfd9d0556
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzph+zflLcgsNr7hCJSi2P/O+VtygZVPtoDrzXHdlp9QPm+9fW0meLjSuWlFYC9HfjUeMlbxrTyjvJEnG+1uOYYC5/oNAzXcRvInylcVl7zWh5l1o2Y+hyTw1ibWyO+S0V1vXVztKcpZCvQqPlKk0QIeXCnLUNyiImUsdO4CsJTF/TS3UBha/WKUXa9lqLu+uCs8EOvwmyO/dtB1eYsT0L724mlqJc3EnGQQkfNmeNpZXT/8NOYP4yLtA0c+Q2b/OXbu8KbwU6XTDhs7l+d/oJBx+2t2OgZS2YYTdlj4WdK+s+SNc2BLvmgQd4X3P8MRJpHBpwZu79tOHhdrzfrfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nPlE21yHvhQGy9bHY5vx0+F3mBZzPuTgUiQXsij4Bsw=;
 b=iOZqRt9a9+sge7tsKv5kzLndd0S1XMNFiwsFVlNxchtAlQP1XUf+VK2shq9w9Mt7CbZwS0GL2qzgNpwfecf4WCk6XAOC654vvEBCZy9NuurBQyid2sJmkKaxt0sVWe9/am26xKPaaNUS8MJ4iG7fOY+vr3UM5JMvLuY1joZ/3T+7Ff5uL9XIoSFOIJVPcPPM3+vrXoycV3+tqaeZFnz/pIa5YRJuCfrp1zqWs4fiZStAMZu0sROdSfpcKmoON7V2F8S0gxkxRsH9hqqQBivf4Jxjh1OWdQyYxUrK4vgvvFajE80KZJPq9hG6z9Qg6IjhNPoXzMaBzBmhFGJBV/gxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPlE21yHvhQGy9bHY5vx0+F3mBZzPuTgUiQXsij4Bsw=;
 b=ZAESu1wlDK+fAxVxNQWCBsyp/uov8oV5X0CKkaGdg+B88+EyQQyeQohlANskX8TqWKVbRtfHgiTTHP4fhfrXUe8FAw+Gytqyvrr0HAPyBwVEWqkp9ScDsMpfpdnZU6fJAyRgWTuWGntyGQm5SiVGUnwNT5tBRH3BmhHrbE7vHjo=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v3 1/3] arm/efi: Introduce uefi,cfg-load DT property
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <AB8FEF63-EA1F-427F-AF2B-13C1E930F682@arm.com>
Date: Wed, 29 Sep 2021 10:56:56 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <46255EF5-17E6-41AC-A6D9-5D276056C0DA@arm.com>
References: <alpine.DEB.2.21.2109281459250.5022@sstabellini-ThinkPad-T480s>
 <AB8FEF63-EA1F-427F-AF2B-13C1E930F682@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8990b43b-f3fe-4805-cfd0-08d9832f880f
X-MS-TrafficTypeDiagnostic: PR2PR08MB4716:|AM6PR08MB4534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB45349153581CA368E2763237E4A99@AM6PR08MB4534.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GHZwp+liuNA5uLD0NN6x+kDQnE5VLyt4rlxIrT4bnH52AdmE21FOZDqD9rupOcGi9Gp3epD5puDUrZDN2qN1GqNYF0lUA9NsrfrrdjCJMxIlgk+9IPXt2Xp/oTFOV3cn5lnl1OakS3o8G+H7e/oNmQqaKaSn961UdKd+MXTiLCRNi4ijUEQIT9pSxRUKOKhcXzKUoduZGUIfNM8jnk9n/NHQ0/6riZhOFi/zOR/n/Wno3ZPFkjMPTNtpmNWPUpPx75EviVvDByX48g3ODXKrKdRpS/FyzPWnDyrd/JGJXcCRYvyuBgCxmMzrSm2puXD3fImNTeZbeZ/0R9Uv3Y7YxhQ5/TtB5vDT8eobZVAuQlhRZrUL0Tr5aWoVvsMf991dvqNrA+snEnVHP9MD7yvGcEqKneB5LF7rF2yokZXoX5QkuRdKRukGGij9MbDHJybnYjkxIBFcqGV9hpscgwq6zLFKoi23ol+1GzYJaLDXJdXaUpa5lnqZjOvEAhTseJ6QdeYlIrqrYWKPObergPTplBtplr4Tv3/TjE4AyyNOocoSozCLKGJcPpZKSB9gEwfxUZ1WJoDc+dvmTN6LJcaurkibOlKpUIi0X8y2i/d5TO1YNccV+l8s3NDyV4YcuGTP5VSHTrnDN45A1SXgNKDJe+dYU26wwXcB6WKya5U3jH5SATMTmMzpArbHik3Bv1pLHdC7Pdx9grsdFjgFMYWMgqTmhfZOVNyp20fEqE6OrxU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(508600001)(316002)(86362001)(6666004)(33656002)(6486002)(6512007)(5660300002)(6916009)(36756003)(8936002)(66556008)(2906002)(956004)(8676002)(186003)(6506007)(66476007)(4326008)(66946007)(54906003)(2616005)(38350700002)(38100700002)(52116002)(26005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4716
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	920b8cba-71bf-4a07-478d-08d9832f7cd8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/DpjiD0xhh0V88VYI9Wpi1OvrCqWNY4Lv30o2wBrSVLmgU1yoLILOZnbRm1jFpRy4TX/pI9FoyY4uUuuWFdwgGjnAthbsmKAbEQd8nt9DoJ7ghC7Ph+d+FtYEVkLG4sXeL7UE/1nEwQOANFBLrjkCi2jIBcLttMgArF1CiPfUqXBT9TEcgC4DZ0n5Wad/0FlYAtY8jZEm4XAOVeB/So6sesEHGD0v6wFL+ybssAANcbrOJsxjWDygTE4aOEEUWA0HP0QANv71/Z28S0FZN7QA72VGkSMgIL+xW0xeD6hE39jSlyR6PD7lgkJCpnlSlagpDGcvWFBs9dJfccb36lurlxavRGzO34E10tzJCA3dIaKtJRT3Dgoo0gyvCSOHJD/shoHFnFf9lkNRwwlP7Bt4QlZewOmGXGJX+7sDA2sqELrzRVUjOZZwGXELoeVwVP1RduqTMe2h2ar+FxNObS7RSUNvL7GvhPE0dGYctOSTe4H2120+aNKvI0dpbXombg4ExaXRtpNUdQCb/o52/7RDTfBpTahaLR55wI49UKqqQ9dlUxtzdmhXwVueipzeJfNmlJ+i3qeB11H8p2Jtr12YY9kZEdLeiAZDGB4tOLTxmvaKI9Zry0Q4l3eeRQ3tfOuzsCMwNIuN8hncsmPDpuRUu2RE62BEBvTheSLIalL6yX4f84HBdD/CfjvzrkU568/rzUMQZSY0OnaxdbaED65Zg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(8936002)(33656002)(86362001)(186003)(508600001)(356005)(36860700001)(336012)(5660300002)(6862004)(6506007)(316002)(47076005)(4326008)(83380400001)(70586007)(2616005)(8676002)(956004)(26005)(2906002)(70206006)(36756003)(81166007)(44832011)(82310400003)(6486002)(54906003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 09:57:21.7585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8990b43b-f3fe-4805-cfd0-08d9832f880f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4534

> On Tue, 28 Sep 2021, Luca Fancellu wrote:
>> Introduce the uefi,cfg-load DT property of /chosen
>> node for ARM whose presence decide whether to force
>> the load of the UEFI Xen configuration file.
>>=20
>> The logic is that if any multiboot,module is found in
>> the DT, then the uefi,cfg-load property is used to see
>> if the UEFI Xen configuration file is needed.
>>=20
>> Modify a comment in efi_arch_use_config_file, removing
>> the part that states "dom0 required" because it's not
>> true anymore with this commit.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> The patch looks good. Only one minor change: given that this is a Xen
> parameter that we are introducing and not a parameter defined by UEFI
> Forum, I think uefi,cfg-load should be called xen,uefi-cfg-load instead.
> Because "xen," is our prefix, while "uefi," is not.
>=20
> With that minor change:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Yes I will rename it.

>=20
>=20
> Note that the uefi,binary property is different because that property is
> for xen,domain nodes, so we are already in a Xen specific namespace when
> we are using it. Instead this property is for /chosen which is not a Xen
> specific node.

Given that uefi,binary will be used also for multiboot,module directly unde=
r /chosen
for Dom0, do you think I should rename also that to xen,uefi-binary?

Cheers,
Luca

>=20
>=20
>=20
>> ---
>> v3 changes:
>> - add documentation to misc/arm/device-tree/booting.txt
>> - Modified variable name and logic from skip_cfg_file to
>> load_cfg_file
>> - Add in the commit message that I'm modifying a comment.
>> v2 changes:
>> - Introduced uefi,cfg-load property
>> - Add documentation about the property
>> ---
>> docs/misc/arm/device-tree/booting.txt |  8 ++++++++
>> docs/misc/efi.pandoc                  |  2 ++
>> xen/arch/arm/efi/efi-boot.h           | 28 ++++++++++++++++++++++-----
>> 3 files changed, 33 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 44cd9e1a9a..cf878b478e 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -121,6 +121,14 @@ A Xen-aware bootloader would set xen,xen-bootargs f=
or Xen, xen,dom0-bootargs
>> for Dom0 and bootargs for native Linux.
>>=20
>>=20
>> +UEFI boot and DT
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +When Xen is booted using UEFI, it doesn't read the configuration file i=
f any
>> +multiboot module is specified. To force Xen to load the configuration f=
ile, the
>> +boolean property uefi,cfg-load must be declared in the /chosen node.
>> +
>> +
>> Creating Multiple Domains directly from Xen
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>> index ac3cd58cae..e289c5e7ba 100644
>> --- a/docs/misc/efi.pandoc
>> +++ b/docs/misc/efi.pandoc
>> @@ -14,6 +14,8 @@ loaded the modules and describes them in the device tr=
ee provided to Xen.  If a
>> bootloader provides a device tree containing modules then any configurat=
ion
>> files are ignored, and the bootloader is responsible for populating all
>> relevant device tree nodes.
>> +The property "uefi,cfg-load" can be specified in the /chosen node to fo=
rce Xen
>> +to load the configuration file even if multiboot modules are found.
>>=20
>> Once built, `make install-xen` will place the resulting binary directly =
into
>> the EFI boot partition, provided `EFI_VENDOR` is set in the environment =
(and
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index cf9c37153f..4f1b01757d 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LO=
ADED_IMAGE *loaded_image)
>>=20
>> static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTabl=
e)
>> {
>> +    bool load_cfg_file =3D true;
>>     /*
>>      * For arm, we may get a device tree from GRUB (or other bootloader)
>>      * that contains modules that have already been loaded into memory. =
 In
>> -     * this case, we do not use a configuration file, and rely on the
>> -     * bootloader to have loaded all required modules and appropriate
>> -     * options.
>> +     * this case, we search for the property uefi,cfg-load in the /chos=
en node
>> +     * to decide whether to skip the UEFI Xen configuration file or not=
.
>>      */
>>=20
>>     fdt =3D lookup_fdt_config_table(SystemTable);
>>     dtbfile.ptr =3D fdt;
>>     dtbfile.need_to_free =3D false; /* Config table memory can't be free=
d. */
>> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,modul=
e") < 0 )
>> +
>> +    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 =
)
>> +    {
>> +        /* Locate chosen node */
>> +        int node =3D fdt_subnode_offset(fdt, 0, "chosen");
>> +        const void *cfg_load_prop;
>> +        int cfg_load_len;
>> +
>> +        if ( node > 0 )
>> +        {
>> +            /* Check if uefi,cfg-load property exists */
>> +            cfg_load_prop =3D fdt_getprop(fdt, node, "uefi,cfg-load",
>> +                                        &cfg_load_len);
>> +            if ( !cfg_load_prop )
>> +                load_cfg_file =3D false;
>> +        }
>> +    }
>> +
>> +    if ( !fdt || load_cfg_file )
>>     {
>>         /*
>>          * We either have no FDT, or one without modules, so we must hav=
e a
>> -         * Xen EFI configuration file to specify modules.  (dom0 requir=
ed)
>> +         * Xen EFI configuration file to specify modules.
>>          */
>>         return true;
>>     }
>> --=20
>> 2.17.1
>>=20



