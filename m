Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A646E651E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522843.812475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poktV-0004pk-0w; Tue, 18 Apr 2023 12:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522843.812475; Tue, 18 Apr 2023 12:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poktU-0004n2-UK; Tue, 18 Apr 2023 12:57:12 +0000
Received: by outflank-mailman (input) for mailman id 522843;
 Tue, 18 Apr 2023 12:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1poktU-0004mu-1m
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:57:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 886efcef-dde8-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 14:57:11 +0200 (CEST)
Received: from AS9PR06CA0297.eurprd06.prod.outlook.com (2603:10a6:20b:45a::35)
 by PA4PR08MB7458.eurprd08.prod.outlook.com (2603:10a6:102:2a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:57:09 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::a) by AS9PR06CA0297.outlook.office365.com
 (2603:10a6:20b:45a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 12:57:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.21 via Frontend Transport; Tue, 18 Apr 2023 12:57:08 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 18 Apr 2023 12:57:08 +0000
Received: from 456185edfabf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82ABA9C7-6FD8-4569-B3D3-5DB79EA50F2F.1; 
 Tue, 18 Apr 2023 12:56:57 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 456185edfabf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 12:56:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7889.eurprd08.prod.outlook.com (2603:10a6:10:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:56:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:56:54 +0000
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
X-Inumbo-ID: 886efcef-dde8-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOuwxyJBtLtaiSrci+hIe2SzH93EPi6tYpi44x7/Uuc=;
 b=bThBtTdrr9icMiQD4l4TBNqzHsXslnZ8SVolur9lxMuLS42VYS710UQOQuNOdUoPc9o+4X1j71lWdz//X9kyR4QiRbKhDTkkpy7TS0RFDso+G4vZk3bu0Vjmcyay0O/oN99ZGs4J+zUfz6EG6bGOgvu5zGzK6gmDeWbgJ0yrC00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c48f50a5554029e8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCv3YF5nxtjWS59i3TE1ylOYZqQUi/uvPRkjGxjYJFu6X6CkgTIxS4kIUKOMAsGRRAljXM6J3TyIN1ActRfbHfvO+bnrS+qvC2PlB3hc8kwP6/FKk4uFCoNUvlwLp5MP2Ts0Nma59z4lyarQVLaRdg3eMv7vHUt+u248ddYrTVG7LD3zhy/53fBYXAv23rPB6+ngUskuX5SD15mhtOBPxRlXrp99OPtbX1mrYD0pEq6qktQ59mKkNl5OsoRf851NN8vs84PhhsuWokV+4CInS/JtaX1TlT5RwzMzzfCu4xpcx100X2q43punkiP16PMeWPA9/1CtHwsx45WjzIx9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOuwxyJBtLtaiSrci+hIe2SzH93EPi6tYpi44x7/Uuc=;
 b=Oq82pTD/lKwLD4kGvBeptam+4cVB3infL7lr7sM9PsDjy+AXUyOZ2eQXkM8g3iDwWSkTPNZlXUeUnnh9Fqhh5iq8LrgNhKRTpzugPxMXUVoyMG4GrkI7jEDN0Tii7jXdtuFEutDHqM3b/shtzKsI8gDCMjxgPnDXx2TR+xvXvrJNdaMNobbTmrQ2oLAhB0NZS4S7zu7BWrnkI9RMqPor50giI2pMPg0yjSBRuM7kZUsuvduSJZV9NHntPfcC359IyPtQ2FW5Bsrup3IEJra0uxJEgGZ1wSG0yuR7gOZlJ5f6/AmLCtk6+0dCxf3bMXZfXXPCvvJM7NIlEDExspNhkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOuwxyJBtLtaiSrci+hIe2SzH93EPi6tYpi44x7/Uuc=;
 b=bThBtTdrr9icMiQD4l4TBNqzHsXslnZ8SVolur9lxMuLS42VYS710UQOQuNOdUoPc9o+4X1j71lWdz//X9kyR4QiRbKhDTkkpy7TS0RFDso+G4vZk3bu0Vjmcyay0O/oN99ZGs4J+zUfz6EG6bGOgvu5zGzK6gmDeWbgJ0yrC00=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to the
 changelog for Arm
Thread-Topic: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to
 the changelog for Arm
Thread-Index: AQHZbSQvB461HU2dmk2buv9fQooVPa8xECsA
Date: Tue, 18 Apr 2023 12:56:54 +0000
Message-ID: <20BBA7B1-AF5B-49D0-BA79-17B90893C3CC@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-13-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-13-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB7889:EE_|AM7EUR03FT004:EE_|PA4PR08MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 0575205c-dc08-427f-c37d-08db400c6b48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BsIAKZZ0p+96WtGrnMjP9VGNzoUO9b0CJoCDhn4OlAjh5RDyR2Iwf/9WPz7LWPNklQDcFU+JoRsIGXXKVznoOd0RN3g4cRKNXGH8y3hgb8jq05w8xCG811Ou92TywgvZ31EAhsfc71OYapfpq3+CdlzaSKTlQbRWAB0ulOAytSCgOQIoV5vvIfwy+P6ibI6+/dmRqJ15+pm7OoZI+MFJ/43cC7jrnobz5c6ltwgWqBrRF/e/QSKMmZcAxn7tLIohC2kRuzg22ct/oiLl6cn9DHIYbx1sKvYUDX0MtFslKFXk/Oy4R+2TVK2bpXxyiQeK5RijVjyNYlUU5MV8xSGZvRHgv5/MzCHJ7v98AzrwukVzpPheXiAkmxBVUlyxMYJ3TYtR2jw2VfQZxDQapBRHziQvBKPvgbawTZ9E01nvhStqRKNECNr8jUgswo7IsErzdvqtxw0kaVR4+YKLvL2yw2Y28KuLcXd38xuAi5RcqxJrUzVWXB/DNMFH44yH+17viHmMZ633quRug/zswSkUYCFQDOsbV6a5fE23mMollueOYnQhbladce8Xv7kMx0DgKojpAPeDi5KkbNf+WnyHQSeyWBUzD3ma5E3Cs56Z809xs7C1i2WJyeuTB+umjvHgEcj9bGDDciPQwINlf0WmHysKQT/nvL0G4p6U832O1LbTdMNj5RIKKs631AzGgEXmhJ4Ys4t+iomV5HbY9x4PJ53zIlS3XWEOBA8uDntxTy0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(4326008)(37006003)(54906003)(6636002)(316002)(66446008)(91956017)(66556008)(66476007)(64756008)(76116006)(66946007)(478600001)(71200400001)(6486002)(8936002)(5660300002)(41300700001)(6862004)(8676002)(2906002)(4001150100001)(122000001)(86362001)(38070700005)(36756003)(33656002)(38100700002)(2616005)(6506007)(6512007)(186003)(53546011)(83380400001)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0EFA6AB05C93F540BA7543068B1685F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57732175-04b4-497c-9fc0-08db400c6308
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VcGYJHGDn0+D7sYazDIcb5k25XYyR5pkQP3wbde9onV7D4mIVGhawmDYDS+4uKzIqFk8A07YNuiZk3RGS/m3qXKHnTeCf86dRauav7hpBMXUrV/9w4ulZQvLaMZ1gmEvJNv4QKYMV3LuPPCGsDQMRU1du3BJ0rvHtfuPjog1RczyP18gVXjKVukLKIbqWmIn8whkTHdXn+JwSSd7+giMG3SVrMpev5em2Eboju+PAoA1Pnoatj1MrOnWt8Hk4O0lXF5f/g9CssvOSX25outkBeKtGUxgVEiEp1pNBvytbx/QlTTLYB9gJzLSAuZH+wTdVl0EoDwJ/+v3ibU6hVd5Yb4NcZBSslE1+2oHwra6eJP327lDzLQZMGk2/se1AMXfjYtllvM0qT+YVNM/J3kG/RkuYyP/nVebiHhDFX140cQeATWl/wp/4/f7FtrmWAPcUAlNz8mI6m3iqND9M/h9PKU4rCSrAOWdgi/B42eDXClCx+okZ8zm6gzTc3UzpS4kS2BBHs4daRWKKq3ra/mWCGEN6wwNmtSLXmjdPfUXv1WvpDUlfZ+DYJBn3eLHWBkmTBBCoQ4n16uO3r2ehLc91ASlSVcs6WaCP79Lw/DsXFppPkmx9YNryYp4iqdY1KDqK2qfUOxwy6ynpjgBO2SwBVLk5e8xDZoHmChnX2I7UPnGRcGrmDiYz8VYHVENqfhXffOAOd87fHe6huR5j/1bneoYlPJ+uYZh+LQmEUWenMdqj0zXU024lVdDmQoKM3U4hpNpdSiMQOeyvOLS7n8+e3DjWGuX9NbJ8AT279iSKt4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(37006003)(478600001)(8936002)(6862004)(8676002)(316002)(41300700001)(82740400003)(4326008)(6636002)(70586007)(70206006)(40480700001)(81166007)(54906003)(356005)(40460700003)(186003)(4001150100001)(2906002)(53546011)(6512007)(336012)(26005)(6506007)(86362001)(83380400001)(36756003)(47076005)(82310400005)(33656002)(2616005)(36860700001)(5660300002)(6486002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:57:08.6148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0575205c-dc08-427f-c37d-08db400c6b48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Arm now can use the "dom0=3D" Xen command line option and the support
> for guests running SVE instructions is added, put entries in the
> changelog.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v4:
> - No changes
> Change from v3:
> - new patch
> ---
> CHANGELOG.md | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c978cfd9b68f..a24951603359 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,10 @@ The format is based on [Keep a Changelog](https://keepac=
hangelog.com/en/1.0.0/)
>=20
> ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
shortlog;h=3Dstaging) - TBD
>=20
> +### Changed
> +- The "dom0" option is now supported on Arm and "sve=3D" sub-option can =
be used
> +  to enable dom0 guest to use SVE/SVE2 instructions.
> +
> ### Added
>  - On x86, support for features new in Intel Sapphire Rapids CPUs:
>    - PKS (Protection Key Supervisor) available to HVM/PVH guests.
> @@ -14,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the s=
ystem
>      wide impact of a guest misusing atomic instructions.
>  - xl/libxl can customize SMBIOS strings for HVM guests.
> + - On Arm, Xen supports guests running SVE/SVE2 instructions.

Might be a good idea to mention that this is a tech preview ?

Cheers
Bertrand

>=20
> ## [4.17.0](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3D=
RELEASE-4.17.0) - 2022-12-12
>=20
> --=20
> 2.34.1
>=20


