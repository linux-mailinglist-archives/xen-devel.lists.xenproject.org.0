Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77A7A2B48
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 02:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603466.940475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhIuE-0003UO-0c; Sat, 16 Sep 2023 00:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603466.940475; Sat, 16 Sep 2023 00:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhIuD-0003Rl-Sz; Sat, 16 Sep 2023 00:11:25 +0000
Received: by outflank-mailman (input) for mailman id 603466;
 Sat, 16 Sep 2023 00:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aGgT=FA=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qhIuC-0003Rf-DC
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 00:11:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e45008-5425-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 02:11:23 +0200 (CEST)
Received: from AS9PR06CA0430.eurprd06.prod.outlook.com (2603:10a6:20b:49e::21)
 by PAVPR08MB9233.eurprd08.prod.outlook.com (2603:10a6:102:30a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Sat, 16 Sep
 2023 00:11:16 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49e:cafe::90) by AS9PR06CA0430.outlook.office365.com
 (2603:10a6:20b:49e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23 via Frontend
 Transport; Sat, 16 Sep 2023 00:11:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.12 via Frontend Transport; Sat, 16 Sep 2023 00:11:15 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Sat, 16 Sep 2023 00:11:15 +0000
Received: from 0103d60c841a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66F1C8F4-D853-4DA4-8803-3D6DDD1AC75E.1; 
 Sat, 16 Sep 2023 00:11:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0103d60c841a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 16 Sep 2023 00:11:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8696.eurprd08.prod.outlook.com (2603:10a6:20b:55f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Sat, 16 Sep
 2023 00:11:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6792.021; Sat, 16 Sep 2023
 00:11:07 +0000
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
X-Inumbo-ID: 91e45008-5425-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM67iHv0IKbrWuZH9RGW5LwXFiTmFPB3F3UtyiNqnbY=;
 b=pM0g1CncXPcTR5f/vMlS7Z0m/3xj4FAGQluQzFGPtwhMLT/KMi7jBx3M97M1KSrybzqFjcPF3CgVCdliG5HLAbhHAB7zy5aS5qK3S1ifK22wyXJ/6HEPs+4AwBXFaLRjECUuspaFf+ExSvHEVp6+mZLEPuwTGDKVSveSpawO93M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90f146efb61cd68f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYYmju2HrmdrnGSmA1CUlwIoxDHFapCQIYfrBPnGYSq1FYAPLvsxKHDrEXftlduqv7SuYtpOp7xuDR1jEFe/VkIvJZDq5M2yQKCUakVsD5+B1/0UFxDsy+6Jrg6+YsnRm0Peq+nX72kEXKw5ke7HLOkeMChmABHyC0RB20wapFFCmfZ2MASfzswFz2XoWb7c+3LiNiidfBK6wuFTLKcwmJcaRiwAtmaomOZH1D/vf/RIzryZhOZLQLqKtk2VXvzdMWC6L7xTAlzWl1PlBMyncQAhHQ/IXdm8fwBZZGg8m82OOQOt5wCz8kbDQnBLQrz055eE8Z5tuU8Aqe7GHK30cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM67iHv0IKbrWuZH9RGW5LwXFiTmFPB3F3UtyiNqnbY=;
 b=R8cKIVzgiS4M77IWAlDyi3DWS8IK17RxgSRqD8YFWzxEGWyTKGBhB8qMSrraQ3Ul4sKdIx0SYi8KKyxlKU9dIrvP+vaIpzsRoGTVQwwQeL5MHxmbCdlRsD+GJLKO8FBuGw6IfyZJ2mGQp7pQSfm7b10QsOjWEufw+QpZVeKwk141QKb5EeclnLW5ACLkA7fzIvXZbE30o8c+HLMOCHRh9Zzp8Pz4WeDX4Yv0MUePDWY9tfq6eRu7z3NPLVWWVEUt5bdnd+oYHAQxGEb+POtfignTXez/ytYSdC/gKTxrEvTXu5gVug0iQw9f4qRcNx9j/S8Ctxoi6RkF4efpdxZsiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM67iHv0IKbrWuZH9RGW5LwXFiTmFPB3F3UtyiNqnbY=;
 b=pM0g1CncXPcTR5f/vMlS7Z0m/3xj4FAGQluQzFGPtwhMLT/KMi7jBx3M97M1KSrybzqFjcPF3CgVCdliG5HLAbhHAB7zy5aS5qK3S1ifK22wyXJ/6HEPs+4AwBXFaLRjECUuspaFf+ExSvHEVp6+mZLEPuwTGDKVSveSpawO93M=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.18 v2] tools/light: Revoke permissions when a PCI
 detach for HVM domain
Thread-Topic: [PATCH for-4.18 v2] tools/light: Revoke permissions when a PCI
 detach for HVM domain
Thread-Index: AQHZ59N2VPLX7/ND60C+IG0RkhZBdLAclN0A
Date: Sat, 16 Sep 2023 00:11:04 +0000
Message-ID: <B61F59E5-C5E5-482E-8F03-3472F976ACDC@arm.com>
References: <20230915125204.22719-1-julien@xen.org>
In-Reply-To: <20230915125204.22719-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8696:EE_|AM7EUR03FT031:EE_|PAVPR08MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 49baf7cf-e8f1-4500-0c4e-08dbb6497195
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2/shq51WKVZEMF/ZeimaTCUMX1qPZnkpfszsWJBKLShZNXq0MOFAUs/TYBmDe4C2NzUb/xpVpb/S52isaIiHfGyaVrDSmbWbKvAu6z2bGs4C9+r7D/m0dO1afZambj5zasEyb8kpZQ4xNv/gP+gF8v2yAEPCb4vBbkdjmUS3u4FAmcndzygsf77X2jUxaJ991i9gwDGawaDF+FyWlJfmV9/DzcIIiIma88yDvfhm6MTV3lEB0H1d9ngB6wvDSCRpE8Y1G/rZwTobEG+3aw3S35FuIzqwnWtFauZ3XHTuMwF9JOr83MIJ5hd8fqFAcUTwCim14KzyctjUhq5/F29yaiWig55/5vTdx+x6HWT/rhEiKB0pvDMtlNouf0UeLQh5Blu8AwjF5ORBU5/dkx85an3WFcB+Qx+L3A6RdnZ2c7KfQAlpQFl23nwvu4+/QsIaUFqQsPOA+MNIO9WxX29Tz3Jx2RPtthvRzM2hk9lHW9HvKpq8cPBrOuYxc740ZBdOekVO9XOpLy8rCHylrY7yRmJ/R97a9Ux1Ch6y8VoFOeaKKIq6iDbJCywpt1exP/ATnSBHte8z+K4atgYV9bUPVym/rm9z3VjeTK5zztkfYJnsb8tTMTpSfirDIENV6GNimkrJwUt1Khajamm1k2hMfg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199024)(1800799009)(186009)(66446008)(2906002)(38100700002)(122000001)(38070700005)(2616005)(26005)(86362001)(4326008)(33656002)(8936002)(8676002)(66476007)(41300700001)(76116006)(36756003)(71200400001)(5660300002)(316002)(54906003)(6916009)(64756008)(66946007)(66556008)(91956017)(83380400001)(6512007)(6506007)(6486002)(53546011)(6666004)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D2EDD15D71BACB45ACB2B0FD2545EBE9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8696
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a996fec-1530-4d1e-e83b-08dbb6496b0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZnWeMNE9AOcrnUPLCS0AwOeyqp5jmvdy51//mFYwe5iVaEJxAcGDKUmagUbCmyGhw/A5/y839Z64piSawI69DXmm3G4icmZKasE9LZk8nuNRtZmf6OSTLH3LeNHIhkMK6omZXwkMWaoF8xGJvpeVTQtnHtrKB313uGp+/9wSlOszK4rbpP886RaIUj0RBtMLfPiHgrNgVcnIs2dz9U7wNy8hzXqakWB/ek7MsP5AZVPmWlsZH3JE/MpZu9NQojZcSRkWh5xJHfyQX61QkQBXPzMu4KpZaSIFZ1ZpDG0UC1C3XTSUJEKCzynQ662ecmvulYPmedWJEAOQ4v+j1YmXNilDe2yvb87eFOJVnzYTAvLlojlrAqR9hdBrm8E1VBKL6uqa5pQoOlPsTrb5+PNKG15vuiMLPIh+JtcnW9zSKIVgs32XE3anRf0PM8uNOVHYvZHJZJ0lHqFiiCIpqbdvay5AHr5052SsoTmyYsukm4zaY/02zf4xJdcNaQWgY7pxx4ub1/a/AW5Fv5N2cpzDthwInGHnskz+nTQaD9owShXuhIUchbCE0EDEyiNcr21o55s3pExmGU9LSxElK/aDwW+uoxvDZtMUEYCLXwd1o9zM0LlDWk7LNonqmzU/NF7uJe5nVch0Ke8KhbIRjyuH9XA0XfsUet3jGjHZuXZyEMQlCS08UIkLkaO0ykDE+TSRBqLaBmOewgSWYVQr5BJGJX1h9hKFkfonYVAdRbpBE1ROxt3W9Th7IDBRAI/3jq0c
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(186009)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(316002)(336012)(54906003)(70206006)(83380400001)(26005)(70586007)(82740400003)(36756003)(107886003)(6506007)(53546011)(33656002)(6666004)(6486002)(81166007)(40480700001)(356005)(6512007)(36860700001)(47076005)(86362001)(40460700003)(478600001)(2616005)(8676002)(6862004)(4326008)(2906002)(41300700001)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2023 00:11:15.6893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49baf7cf-e8f1-4500-0c4e-08dbb6497195
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9233

Hi Julien,

> On Sep 15, 2023, at 20:52, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
> a PCI is attached (see pci_add_dm_done()) for all domain types. However,
> the permissions are only revoked for non-HVM domain (see do_pci_remove())=
.
>=20
> This means that HVM domains will be left with extra permissions. While
> this look bad on the paper, the IRQ permissions should be revoked
> when the Device Model call xc_physdev_unmap_pirq() and such domain
> cannot directly mapped I/O port and IOMEM regions. Instead, this has to
> be done by a Device Model.
>=20
> The Device Model can only run in dom0 or PV stubdomain (upstream libxl
> doesn't have support for HVM/PVH stubdomain).
>=20
> For PV/PVH stubdomain, the permission are properly revoked, so there is
> no security concern.
>=20
> This leaves dom0. There are two cases:
>  1) Privileged: Anyone gaining access to the Device Model would already
>     have large control on the host.
>  2) Deprivileged: PCI passthrough require PHYSDEV operations which
>     are not accessible when the Device Model is restricted.
>=20
> So overall, it is believed that the extra permissions cannot be exploited=
.
>=20
> Rework the code so the permissions are all removed for HVM domains.
> This needs to happen after the QEMU has detached the device. So
> the revocation is now moved to pci_remove_detached().
>=20
> Also add a comment on top of the error message when the PIRQ cannot
> be unbind to explain this could be a spurious error as QEMU may have
> already done it.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

As in discussion in v1, it is agreed that this patch should be included in
4.18, although technically my release-ack tag should be effective after
code freeze, I am still providing the tag to avoid possible confusion:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


