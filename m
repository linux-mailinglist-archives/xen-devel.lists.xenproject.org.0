Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A36079CE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 16:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427717.677046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oltCU-0001sE-HW; Fri, 21 Oct 2022 14:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427717.677046; Fri, 21 Oct 2022 14:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oltCU-0001qM-Di; Fri, 21 Oct 2022 14:40:42 +0000
Received: by outflank-mailman (input) for mailman id 427717;
 Fri, 21 Oct 2022 14:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gujA=2W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oltCS-0001qG-Uf
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 14:40:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060.outbound.protection.outlook.com [40.107.104.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc7289e-514e-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 16:40:24 +0200 (CEST)
Received: from AS9PR06CA0123.eurprd06.prod.outlook.com (2603:10a6:20b:467::14)
 by AM0PR08MB5347.eurprd08.prod.outlook.com (2603:10a6:208:17f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 14:40:35 +0000
Received: from VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::8) by AS9PR06CA0123.outlook.office365.com
 (2603:10a6:20b:467::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36 via Frontend
 Transport; Fri, 21 Oct 2022 14:40:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT062.mail.protection.outlook.com (100.127.145.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Fri, 21 Oct 2022 14:40:35 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 21 Oct 2022 14:40:34 +0000
Received: from f8afb7375ed1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ADB9B166-C4A2-421F-915F-8315FF6B510D.1; 
 Fri, 21 Oct 2022 14:40:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8afb7375ed1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 14:40:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8304.eurprd08.prod.outlook.com (2603:10a6:10:40c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 14:40:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 14:40:19 +0000
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
X-Inumbo-ID: 4bc7289e-514e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f/NbYJsJ2COhpMjsdce9OdOr8mhBFN/+YhKFkYRSJDUbxuGgT+0vjOO461i6I7/mythHre8DVPXb4VntQr4mfxybXJLsIDsDR2BFQpqWWre7rVMWhowriITLjkniGh7uGDlA4B/6Bs8VDT5NFDZclGrQjmWyleGoV7idoSIlSklhcVgPv63bZLTxH3BMlzhKFKW1cQfN9301JwDKsecq+KdWzf+64XIhWqfA/ZZX8OOi6tB4uKF/uwlO1MsPgAJq9j4dBMeDavCONOglmy8s2l1Uv+glKbSP5M3THsnh8QN1x5KxCJ6gaU5O8LympH+U0nUiCEc9OerFJBqk1zWrEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DhfaRwzrj7R7Idn7agp7jd2sNNMTdVmTJhcXH2ttPE=;
 b=CbcNj9c8ArRo7gVXzg4U0v8xQ3qijF9VK61RH+ZgOn80XUGccj6clM8DX9zVhqN5yFMF2jqkYeUSH0CErFXQyyh/mhgn7E6gAkzi5QRlr2hy79w7QlHgbOz6gm/fKq/gciONX2cZMThxuAVG3//fqFhkBRyPhfFsLLldW5QwPPOzRRQ3sbJX0uj5a9ALUP/FwDkaC5SyO6CD6tjCLrGo0sXCSh1r+B823x/IkFyo+NHJxAjakXJdjBGmy8SfbyZtKw67du5tmpVt7rUoJlaYnR8j6XqnO8YYB2uyuX4pbG4d2V7awxLGTRbGnq7nOZ4I+/jx00HQMosv4kNT41HOxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DhfaRwzrj7R7Idn7agp7jd2sNNMTdVmTJhcXH2ttPE=;
 b=ESrqdY7cOpuHC4g3Cq5rwM0TfjJrpBEw5abDFgp+84YuB+ixki+PDqF9qgO7U9P7oIfzpj3G+RlCEQBwNztvawHpi+FjLE3otRf98SCnkUlXx/HW/tGdGVB3gDdQKH3JbhLBpvFFLt3Cd/vUgkwITyWk5aellIGDEaJI2n/mlvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kh84EcLqflwr+t9203NG7zwCpfVrDUGfmX45RTxj0CGee/FOCevGYX4sI2jDmzAotwDtYiKIoVBnd0qA4fuoMeFDJvH/tyYDqyLhUlBo2GodwxitXmrjtlwsK0/MPg3jAQqSOAQY8kQQaLTT8HxiVBga/nQZeKnOVUXcwRkUY9O2tNx8aNQEq63vEIi2i5n5wVltEGAqg1w/lCnk79PET681ogTLDCFEm9bTwL40CbDYiS2RhFAFWjFU3nuo+8rwUkUvmpx5BTbxp6jlPBgoDD8vZm8GjEBPJpoWa54xBGtWYoKG89g8EHpaYe/UNtpEVcMoeBT4S0AsgLDYsixQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DhfaRwzrj7R7Idn7agp7jd2sNNMTdVmTJhcXH2ttPE=;
 b=Dg4+TJUl9/nWFgAqStYmpRVcMC4hwii/kQSZGLH008hx03jmKDjftnta+REuEUtJ48KSgGtaCv+1sdr2uQiCMcPSWQupOmiQWT69UY7NJWtQTIiQ+rDHVkzu/L6P5ff7kMEE2T66eAHFSv02O6Sg7Qp/X5/nESq8vlIyqSif9eeURUE0QvIUeXVfVrPoWOeyabD7LMfJ+jQahPf0GiYobkQbpas435QJDwmOvGH8HsbL6jVtakF8Yo+nprT9sMD3OZ6HDtdvVlzITagzQ+m0wAAaPhz/d8u61TiYa2OV94UiG5sMykXAUf0BEmz4hMd+ieMT+YEoYysKX6HHSFfbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DhfaRwzrj7R7Idn7agp7jd2sNNMTdVmTJhcXH2ttPE=;
 b=ESrqdY7cOpuHC4g3Cq5rwM0TfjJrpBEw5abDFgp+84YuB+ixki+PDqF9qgO7U9P7oIfzpj3G+RlCEQBwNztvawHpi+FjLE3otRf98SCnkUlXx/HW/tGdGVB3gDdQKH3JbhLBpvFFLt3Cd/vUgkwITyWk5aellIGDEaJI2n/mlvc=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Topic: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Index: AQHYmuuJ09LC1x/2uEWs942YY/fNVK2FNeCAgABJdQCAAALGgICT+/QAgAAA3ZA=
Date: Fri, 21 Oct 2022 14:40:19 +0000
Message-ID:
 <AS8PR08MB7991C3933F253BE49BA61B76922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
 <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com> <87ilntgzpj.fsf@epam.com>
 <3aa941de-3dab-0265-02af-38ad1cc3a4f3@suse.com>
 <e9120354-e72e-2774-c382-45ab0cb76220@gmail.com>
In-Reply-To: <e9120354-e72e-2774-c382-45ab0cb76220@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: ED7BD6521A943E47A6C3B30FF2FFF8EF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8304:EE_|VI1EUR03FT062:EE_|AM0PR08MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 84dc4cfb-3d9b-456d-2843-08dab37236d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Zf8EGicFl9X2qbk/inrmsLQjw6mAfKl2eY0N8mP1sW5dcXc15Ffe6kD6r7TCB5ullL2zAHYjDaIFSrGXctAU59TL5b0J8huMTs8eFzrgwPKUaSQ1bY1oSDqFRb/xH8kLuIX8r3MBnV932SRdtXFGxgWG122MTs5ezhIsFVd4fopWHSF1liaxdNDTJvExmoGH3K4n+rGj+Pqk49IbCngRgnNAQKWSTzroN+B6yg6eGBJYnochFLGahH8SRQ3u9WMCeo+jQm9m46GnvGtOo6MoK198pE3s6enhByjZKPbm4WgfknzOoq4/XVdqbt9ZPuAi5EMJo15QiQD6Jo1Sg00eJGp0ThHsLMUlB9NO5tMonRZMRiQtyK89edweYWlqRMmoxGhmvv37DIlU73LbA1wuxJoy66L0DhjWjXqIF6p1t7scKB+JnrAi0NnvcUvYBTepKLQai87ynEINZxGyKP3yYnvDmuNz7Ik3iDFnyamVch7cbqHt3Ol/9QVWs3WDOZnz/7iP4laf9v/0jS9EZhEuu3+gThyDsQ8kkPPDb6Q8J84B9KsLfyGSq76Zj6nOpKyIbnFNSX5v7pxdIJfWSpNTqdnOl6+FzTlhOJw2diSRYjVbQXq11dfFCqw/hjCjlwv+uFQe1RKMRwhdI5nRcd06IwfqJo7huGCeMZ1A0VfYBQIzgQqYgrjj2FdWKGZwT1jIHIGB4RGIO3TxP0OT12j+dhgnFyswsWUZ6wUWyKaSjClm+68AF0Ce+HUi0WtFQZ0esgo/fOlEcNWmj+VD18/5lA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(8676002)(186003)(38070700005)(83380400001)(38100700002)(86362001)(122000001)(7696005)(2906002)(41300700001)(5660300002)(52536014)(71200400001)(55016003)(8936002)(64756008)(26005)(316002)(6506007)(9686003)(53546011)(76116006)(66556008)(66476007)(66446008)(4326008)(6916009)(66946007)(478600001)(54906003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8304
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba0b3a81-02af-4ea0-108c-08dab3722d29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/XrhTC1WibxMS9Mtb8J9YScwy18hFUzz8qMOBwyNAgCSXlA3uABy19NaHoYqv2LMHJlNHUchPVDEd3ecQRV21Mqyw6lYm+DuP2rrp4hp7YhZCDDxS6gsMtS4fxhuv1K900q+Ad0ZiOin7ng0ZiYhXxSUY5Ri72pOfU6t+3TzkoeDHQVZerkIdBq8P0q3u00APUfJ2HWYggWH3eS9m75H5epTXQ6tEjRvZgU0kflL72UnthwbviXKZsuP/ZtdHKY2Ax4c8Y+nAF+TsQYoP4HsdJ4shZAm5y5NtqPfM8efOsHobNQBkIJ4tvnRQONIh28VkDASSaBU1jP8nqRBU+xphz+Vf/lAjT7oUrhqhC6+fgHbq79vcvWHFvIv59kw6mxbJj7h/EWG18m9sVPXMm/+SSiymKg+d+bO2Hk/FJuOULgQLCxy5G/hKZFzHXXnrczCiWhYprMigR/+NWzC1R7XKPo015vftZouhw4xhPfWUNlnKLv6mLLXVTvvHsOuwonc1ogNbqPtoXtaCbCl26ZUZgOsgpcrTAJOHWBTzU669ZGfoRkXtajDm5QpaM3vACXrWdtlytLbmC9AAJZGSh5zgpCEQQnBOSdzpJ7HLfMP0/XmA81ZPe0XFd0LUSC7UdNe5q1Y4u4H+S4K0zUm6M20PHG/XMGI2j65uN8MFpIyG3eE0R2A9fihThLCXflPtLX4ObAKYiC2loHoGnDifOKmm9Cbpyk6D0K7hdKWeqWsr2/Y870bwsvO8A09279Zj9InmOa7i9AW4GyIMY50sWwFDQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(33656002)(2906002)(36860700001)(6862004)(47076005)(356005)(82740400003)(5660300002)(8676002)(81166007)(54906003)(186003)(336012)(4326008)(83380400001)(7696005)(53546011)(478600001)(6506007)(9686003)(82310400005)(86362001)(70206006)(70586007)(26005)(55016003)(41300700001)(52536014)(316002)(8936002)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 14:40:35.2770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dc4cfb-3d9b-456d-2843-08dab37236d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5347

KCsgQXJtIG1haW50YWluZXJzKQ0KDQpIaSBPbGVrc2FuZHIsDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogT2xla3NhbmRyIDxvbGVrc3R5c2hAZ21haWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNF0gdnBjaTogaW5jbHVkZSB4ZW4vdm1hcC5oIHRvIGZp
eCBidWlsZCBvbiBBUk0NCj4gSGVsbG8gYWxsLg0KPiBPbiAxOS4wNy4yMiAxMzo0MCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+ID4gT24gMTkuMDcuMjAyMiAxMjozMiwgVm9sb2R5bXlyIEJhYmNodWsg
d3JvdGU6DQo+ID4+IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JpdGVzOg0KPiA+
Pg0KPiA+Pj4gT24gMTguMDcuMjAyMiAyMzoxNSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+
ID4+Pj4gUGF0Y2ggYjRmMjExNjA2MDExICgidnBjaS9tc2l4OiBmaXggUEJBIGFjY2Vzc2VzIikg
aW50cm9kdWNlZCBjYWxsIHRvDQo+ID4+Pj4gaW91bm1hcCgpLCBidXQgbm90IGFkZGVkIGNvcnJl
c3BvbmRpbmcgaW5jbHVkZS4NCj4gPj4+Pg0KPiA+Pj4+IEZpeGVzOiBiNGYyMTE2MDYwMTEgKCJ2
cGNpL21zaXg6IGZpeCBQQkEgYWNjZXNzZXMiKQ0KPiA+Pj4gSSBkb24ndCB0aGluayB0aGVyZSdz
IGFueSBhY3RpdmUgaXNzdWUgd2l0aCB0aGUgIm1pc3NpbmciIGluY2x1ZGU6DQo+ID4+PiBUaGF0
J3Mgb25seSBhIHByb2JsZW0gb25jZSBBcm0gaGFzIHZQQ0kgY29kZSBlbmFibGVkPyBJbiB3aGlj
aA0KPiA+Pj4gY2FzZSBJIGRvbid0IHRoaW5rIGEgRml4ZXM6IHRhZyBpcyB3YXJyYW50ZWQuDQo+
ID4+IEZhaXIgZW5vdWdoLiBNYXkgSSBhc2sgY29tbWl0dGVyIHRvIGRyb3AgdGhpcyB0YWc/DQo+
ID4gSSBoYWQgdGFrZW4gcmVzcGVjdGl2ZSBub3RlIGFscmVhZHksIGluIGNhc2UgSSBlbmQgdXAg
Y29tbWl0dGluZyB0aGlzLg0KPiA+IEJ1dCB0aGlzIGlzIHRoZSBsYXN0IHBhdGNoIG9mIHRoZSBz
ZXJpZXMsIHNvIEkgY2FuIG9ubHkgZ3Vlc3Mgd2hldGhlcg0KPiA+IGl0IG1pZ2h0IGJlIG9rYXkg
dG8gZ28gaW4gYWhlYWQgb2YgdGhlIG90aGVyIHRocmVlIHBhdGNoZXMuDQo+ID4NCj4gPiBKYW4N
Cj4gDQo+IA0KPiBJIGFtIHdvbmRlcmluZywgd2hlcmUgdGhpcyBwYXRjaCBjb3VsZCBiZSA0LjE3
IG1hdGVyaWFsPw0KPiANCj4gVGhlIHBhdGNoIHNlcmllcyBzZWVtIHRvIGdldCBzdHVjaywgYnV0
IHRoZSBjdXJyZW50IHBhdGNoIGp1c3QgYWRkcyBhDQo+IG1pc3NpbmcgaW5jbHVkZSB0byBmaXgg
YSBidWlsZCBvbiBBcm0sIHNvIGl0IGlzIGNvbXBsZXRlbHkgaW5kZXBlbmRlbnQuDQo+IEkgYWdy
ZWUsIHRoZXJlIGlzIG5vIGlzc3VlIHdpdGggdGhlIGN1cnJlbnQgY29kZSBiYXNlIGFzIHZQQ0kg
aXMNCj4gZGlzYWJsZWQgb24gQXJtLCBzbyBub3RoaW5nIHRvIGZpeCByaWdodCBub3cuIEJ1dCBh
cyBQQ0kNCj4gcGFzc3Rocm91Z2gvdlBDSSBvbiBBcm0gaXMgaW4gdGhlIGRldmVsb3BtZW50IHN0
YWdlLCB0aGUgZGV2ZWxvcGVycw0KPiBlbmFibGUgdGhhdCBzdXBwb3J0IGluIHRoZWlyIGJ1aWxk
cy4gSSB0aGluayB0aGUgcmlzayBpcyByYXRoZXIgbG93IHRoYW4NCj4gaGlnaC4NCg0KSXQgc2Vl
bXMgcmVhc29uYWJsZSB0byBtZSwgYnV0IEkgYW0gY3VyaW91cyBhYm91dCB3aGF0IEFybSBtYWlu
dGFpbmVycw0KYW5kIFBDSSBtYWludGFpbmVycyB0aGluay4gRnJvbSB0aGUgaGlzdG9yeSBkaXNj
dXNzaW9uIGluIHRoaXMgdGhyZWFkIEkNCnRoaW5rIGl0IGlzIHByZXR0eSBzYWZlIHRvIGluY2x1
ZGUgdGhpcyBpbiA0LjE3LiBUaGFua3MgZm9yIHRoZSBwaW5nLg0KDQpLaW5kIHJlZ2FyZHMsDQpI
ZW5yeQ0KDQoNCj4gDQo+IA0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IE9sZWtzYW5kciBU
eXNoY2hlbmtvDQoNCg==

