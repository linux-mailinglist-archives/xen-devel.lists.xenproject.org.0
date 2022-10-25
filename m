Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D9460CAD0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 13:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429782.681016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onI2B-0000dV-D4; Tue, 25 Oct 2022 11:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429782.681016; Tue, 25 Oct 2022 11:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onI2B-0000b7-AB; Tue, 25 Oct 2022 11:23:51 +0000
Received: by outflank-mailman (input) for mailman id 429782;
 Tue, 25 Oct 2022 11:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBMn=22=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onI29-0000b1-LL
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 11:23:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da12196-5457-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 13:23:46 +0200 (CEST)
Received: from AS8P189CA0053.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::19)
 by DU0PR08MB8614.eurprd08.prod.outlook.com (2603:10a6:10:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 25 Oct
 2022 11:23:39 +0000
Received: from VI1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::66) by AS8P189CA0053.outlook.office365.com
 (2603:10a6:20b:458::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 11:23:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT035.mail.protection.outlook.com (100.127.145.20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 11:23:39 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Tue, 25 Oct 2022 11:23:38 +0000
Received: from 1fcf91e50f72.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A129925-BFE7-4F31-8705-7D31CA600AD0.1; 
 Tue, 25 Oct 2022 11:23:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1fcf91e50f72.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 11:23:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6080.eurprd08.prod.outlook.com (2603:10a6:102:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 11:23:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 11:23:28 +0000
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
X-Inumbo-ID: 7da12196-5457-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e8y9jDpxCYkK/CdGF8f5e68eZEunjTMUOcRjwlNmxeMptwIaHVr7IDM2ywcUjtqjHG1uGNlBbXuR2y1lZ+JeOnCkkoW5lAu9vRAc+KehNVQgjDBM/dtq9bXAGFtFu0RJgdtc2CDoMZOKNU+M4/P03W3vI/4tlHD9E7ACbNsVDLN0rKMqNI7mMGVlPRqeHenue6/VdbiP2tQzS3VsJ00uLWLKlQgnofaKGUUf08nyIkhwpD0otrTE/WaWkCFwPV9heF0YEvsVgQFh1P0wc4LkCV/+oBrhrryFvyM6Xq/tuqgKg4D9trzC9iS2Up9C73LNjR7BzMoHaNdnXKP1zQy3QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Rdag1Pi4i5kOuTFexg/BEcwsGNQ5jd36yl9qZlp3qk=;
 b=YMyk4R2kac8KGziz4GcfSVY4bWBUfvzd0aqoe2Wtg+JXIcktBoqcQb/pbwn33gYbURrvmrbR56/XcX3H75QKLXLKYeS1PO1pz+E1mRijro1BOfogd8HTE/qKHacsRUBfK4xAI8FSQH+2ENIOFfLy9rronV3c7fKlUH5/c/XInTCryZOhRFoW04aNGFu0ZTK5ia16fUAVPjqsZp6mzJ5cpFlIBAy+sAaZ/96/xOHnBqgyXrsCmrYRQJ2xh9x85mqDx2KMDws2LzGvsoaagwb2u7YgTNrnBDyBNaLH9qk/RRK1KjDcMoDtKCYdQxaqninhC9aeg8RkZiADJQq9blfO/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Rdag1Pi4i5kOuTFexg/BEcwsGNQ5jd36yl9qZlp3qk=;
 b=1ztGIVh6U9jmvjwcgLzPyFyxNB09x4IyXbSacXeWN1RLBDQGERHRyJzfLYdjEkfmz/VYhyXsvVtaHHbkeb/VjjZcqbx/OU5nEpUEgU3gAS50rxWvcvTPwoEDWiJqNb8ijM3xinqy5ZJBkWLwpQGPE4Lvy0EvSK43XJe4bzG/tDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQqvxlEcd9NmpnZcJQjp19l031mZImsy46JI/LnFkKycTOHJDGmM4tRBX+GdnJmTlrRmNXxLzCnpOPRuVRpp66E1GvbpVHBzTkh2Ek69+PafSOYW5+YgfYL2GqQw9aGAp6NJvz9xdFz6AjfqzBeUklUct7MkcrakpLhfcrUwFzpjeuMtXzXMi64oCOLaFhAKlryD4GjAVjOW+Gu/xazyUpRa2VvGM9qy5yiqmIjzmgxq+mMmaSfISrtlB22xGHKc6wxAOccwqD5Kgpd+xj7jGpTSwtiOBwp3vAeSDT7CmvXMXLfVy7qpvpnsXP6kVx4gSwF8JJPZaOz0c6DdRUWevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Rdag1Pi4i5kOuTFexg/BEcwsGNQ5jd36yl9qZlp3qk=;
 b=RCtQgt3hh5jc0ja/lYCGC7/zCGuGCgeYM9gEg5FF9yJ32iVrBJcYJTWTmOjDA3AUgdoyGxKC1CdUMzfPWWO+kkrTAUvcYG0z8hthbt3SrxGR6BN+KC6BJWraLTZKwJx+8kVdtVYFZmtLhBW/qX9zQvEcNQQPXx2/TbOec6/qe58DKHuG9lMoUm2mNMHxukATqee49kssbegOZAtix+9kDicKLkcFNKnPhFj/g4lzTLAu//JmXgQs+GBmzJQdLFH6TmVePd9PSAva3vzFipUVz7P+B7svtc4MiH6AdPK7/ilRCW/fj2dKdiNjGIpnCajHr3uO2YA/TFIvhwW/hnT7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Rdag1Pi4i5kOuTFexg/BEcwsGNQ5jd36yl9qZlp3qk=;
 b=1ztGIVh6U9jmvjwcgLzPyFyxNB09x4IyXbSacXeWN1RLBDQGERHRyJzfLYdjEkfmz/VYhyXsvVtaHHbkeb/VjjZcqbx/OU5nEpUEgU3gAS50rxWvcvTPwoEDWiJqNb8ijM3xinqy5ZJBkWLwpQGPE4Lvy0EvSK43XJe4bzG/tDY=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: RE: [XEN PATCH for-4.17] libs/light: Fix build, fix missing
 _libxl_types_json.h
Thread-Topic: [XEN PATCH for-4.17] libs/light: Fix build, fix missing
 _libxl_types_json.h
Thread-Index: AQHY6GNYDlCeKTtqLUuFb/P6KXo5A64e93Hg
Date: Tue, 25 Oct 2022 11:23:28 +0000
Message-ID:
 <AS8PR08MB7991B8AFC1A05D6206D4ABC792319@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221025111632.36286-1-anthony.perard@citrix.com>
In-Reply-To: <20221025111632.36286-1-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2140967AEDD44147B61F4F9EAA70C3EB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6080:EE_|VI1EUR03FT035:EE_|DU0PR08MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af7b2cd-6779-471d-2b12-08dab67b5d82
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7KRr1Y2liO7+qZu/mQ/NurK8iXzfTYWmqHhulFJsV2BUKjeYRjSP/EJsjNg71jzAsk7qATgrAKlYGnQYIM49bvrl6by3ygXByW1PWNTCdlqdooy+eFTcyz4oi+kiobEsGWpSHnS1adGp6mGf69sHUdvj8JwPtKJsEQgox0pnT3r79tRtfWnrgqnCuIZHR7MciLFrTWW6/gVSvV3r3w0pO6m3TjdgUldviYtWoUn0XDim6pdgp5/ZZh4uoLc3hFNoIoc/Hj+lZL2bcBZOjuKYVo78m2On1EGkHw2fsZknm4nO1JOcq0pYvGAGPI8Ix8I8M/Fp7rRpO+sm7DVHuq1AoeygkszhEO9OJkOZtSif6oksl7CY4r35s08FvEeXQ9ClcN8Qxvl4BuxTNBszbhhDGGLtg1AryAe2tUINw/yiPi/09Ev3lQY7lt+V2wBluESXtvgughQVwNOsIa4PO0mG1IajvKqFjgabF5hKh83+GhmBDYKbdhBBGCSsAE4aqAVrJCafuezNUO1gYTXO++OkxWK6pUVp8MowCW0QLVQIGJxCe62EIViE8USKAY9QHxP5VvM+4LJDcjUv6MVJKHCKHsuGw9fwdnHQLEOzsAjn8FQOQkwGc8JHBE67gyEX9YYwd7fP2QQ/BO29e7RuluP6xD6zJHdu5kAxqvJq4aHav3tjYwIYa/NcklDCrwobGSczBlFTsOWiFpFttKKb8TtTrV1CCsACS4kSHJoOpDBPvlxROnRkygc6pb3W3s5zd9wPVbkaLmn6TFwPungOdunZrg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(41300700001)(66476007)(2906002)(66556008)(52536014)(316002)(8676002)(64756008)(76116006)(66946007)(4326008)(71200400001)(5660300002)(478600001)(33656002)(110136005)(54906003)(8936002)(38100700002)(38070700005)(83380400001)(55016003)(66446008)(6506007)(7696005)(86362001)(26005)(9686003)(186003)(4744005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbf6fcbe-182d-46c0-aa42-08dab67b56f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vZQ48m+I6oBEKy1C+NX6NT7rHtBjgaso+0wi1K6QOlEFjnRI7jpjv0sKbuSbmtCUeYOgcX7rBWqvoSWNRed0XyoLC+nPdEnxeyArAAg89QOuyQi/CLaUT/cEJPY++WoDSFI4YAJ8FqaLb5ESo21+pB5c3VKiOS+cHq6IjxqAbJgDFW1U/G+7/RxjPwWBGCC/4kAMsyzI66Bfjs9fkBDJ2IqQYcSSI2wNQYdqVVPvjRFJUToMPGY30mebXw1zCTE2LEFXDQeLJs5/KidYKayGR+8AbgxeEzKeAvZym5+QHeud+WEr69rXK8k7rwUwGZ7nlrAxijYewu64iOwCli4hCMpnch8rLVMAl8/fCe2m9gdqQOwS+T2gHuuWfsz/+JapNOHX1WKuxcsVhCn0PaSN0reybwxDsUFvqdV/DzSQ9HPAcDnv0/25keVoKSGNOtIIgDBLlW5oS4jDMneCEcXERGcS+druOlG1GBWKpVZKrk1obZKDqfNXZOUgKNBUeWp4YIrMpQ246jkGY8hFgmcRQlp4t6qDg3GsVc2zxS5jBEKCfnfcJujT2xjPxc6fCgKvhLOXx4N4EAlEHHFT85icVoyCndxfmYR1NRwiZCKpQaPehEyt5yxlZpII0LF7e6jk+sySptuxOV9NI2GRki/VRDpfxhF6PpNjb8f55JG1gfqkkU9FE29dD+Ate1t7TYaq6TxwxuIW8QiIdS8bJ0OSbLQBapLYagMBDvdEHsIOcj0LuJugG80lfCleR3kIT2FqU2q7eA+iAKtDnuZj9gw5cg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(2906002)(33656002)(82740400003)(356005)(83380400001)(4744005)(5660300002)(40460700003)(186003)(6506007)(40480700001)(336012)(81166007)(7696005)(55016003)(26005)(36860700001)(107886003)(9686003)(70586007)(478600001)(54906003)(47076005)(41300700001)(110136005)(82310400005)(70206006)(4326008)(8936002)(52536014)(8676002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 11:23:39.1140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af7b2cd-6779-471d-2b12-08dab67b5d82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8614

Hi Anthony,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Subject: [XEN PATCH for-4.17] libs/light: Fix build, fix missing
> _libxl_types_json.h
>=20
> Make may not have copied "_libxl_types_json.h" into $(XEN_INCLUDE)
> before starting to build the different objects.
>=20
> Make sure that the generated headers are copied into $(XEN_INCLUDE)
> before using them. This is achieved by telling make about which
> headers are needed to use "libxl_internal.h" which use "libxl_json.h"
> which uses "_libxl_types_json.h". "libxl_internal.h" also uses
> "libxl.h" so add it to the list.
>=20
> This also prevent `gcc` from using a potentially installed headers
> from a previous version of Xen.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

