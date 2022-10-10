Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901885F9D2E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 12:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419216.663990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqUf-0006XZ-PV; Mon, 10 Oct 2022 10:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419216.663990; Mon, 10 Oct 2022 10:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqUf-0006UN-Lx; Mon, 10 Oct 2022 10:58:45 +0000
Received: by outflank-mailman (input) for mailman id 419216;
 Mon, 10 Oct 2022 10:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ELN4=2L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ohqUe-0006UH-7N
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 10:58:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813f5cf4-488a-11ed-964a-05401a9f4f97;
 Mon, 10 Oct 2022 12:58:43 +0200 (CEST)
Received: from AS4P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::15)
 by PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:341::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Mon, 10 Oct
 2022 10:58:26 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d7:cafe::e3) by AS4P189CA0012.outlook.office365.com
 (2603:10a6:20b:5d7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 10:58:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 10:58:25 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Mon, 10 Oct 2022 10:58:25 +0000
Received: from ca465dd21652.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE545B81-A71F-4838-B664-BCED90E17D9A.1; 
 Mon, 10 Oct 2022 10:58:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca465dd21652.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 10 Oct 2022 10:58:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8316.eurprd08.prod.outlook.com (2603:10a6:10:3dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 10 Oct
 2022 10:58:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 10:58:16 +0000
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
X-Inumbo-ID: 813f5cf4-488a-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VCGuEW+eXtPcfi6Npt0M0vQc4kQifrC4G+nzB/ihPAh9VTmFIoS3tlkjdXC7+ZPipluMu75ONVs0K78WexpJPm9RsrWYqg4OE//UvnXGcMgrXT2xRYpKpTu++J87a7S+2GP3tQTX9jmtkpDDHM/CIfijHjz3wQE5UriNc2ZGysZmDsSg1ykBByndjrtihAmvruB5BRQAXnM5V7FZyqN8+Yd08bOxMn7UJi9YWnmRbTvKPnukzNlLMrDJsCJjDxDA0EfG4QayESpIsILvW4Ty2IKkE9WLn/YjStrU6qAHsZD5K6VNJIRU1MbFvo52uJFbG9jqeK6hQiYGShoP/gf1ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqyKgq6V0Ht3/clpAcGjbaZ8K0mBwk9PP5HdqHA3juU=;
 b=Ry3FaMGzh/WsSV5R4qsbNHEdho0FceSV8iAbTV/HS6weKyIkFJT+JqMrvhFK0frf7SSbnBcvg07GQKAJFjMVcsC76gJSMwJ0JPLSV3B+Gu0eUi3xJ/Myl3KULJ2u+lSyWm7+pTYNIV3jgioQ2U8+dP407nyOFB1rA1qI+Fy4uRXnWJPjelkwDiQnvKRbtuKecbEmoqf7syH6BJx+4avDL8SSKr0WEfHad3BOQN8smbJ6xFiCjUX/8ncgUkuynrpnqizlNkb1GcENhw1kxaaaQ/ziJju4z4Locb4NfsGpLN0aC/6ZBx7RxN8BoMvxP+7IixjuAz+Et7KOew8y88pzVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqyKgq6V0Ht3/clpAcGjbaZ8K0mBwk9PP5HdqHA3juU=;
 b=oEgEshByIDuD1lkxp7hb69RnuwTPobcd9GAFj14i69wbQaBxTOvNcjzakNayDrrtLcMao/YbcX9O6gohbVG3vBnbPVRpwkt/OQVCsZdaXOqKOUObCdhfZoO6kD+/yAi2Cirrd30Ok151KhCUJxp7BqbXe7WHgGfccKx1hOLruXk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65a13d9994d6c2d3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grgpor5JOKq9mCk6exaAtD8ArmDNGJMFex9xnYw1Gf/t9qtP5/PyjHZjKYjtAaaem9a2vlF7W3/93UmlLsa7IZkzwypMI9frNkeJvjY8r2KsT2fIv8e9JJnP3bfaIXpleHf5R/yCOmOHMS7AuIk2Qeld0T52bpLJmSuSBNRr/2hpAbtVwbl+NY2lUa8f4zU8tCgT3Px9ZsZ2BVIcgQWuijubz0oq1gTf5UnvO8kptVI48mp7aw7RQ6YdSEHSRPKUMnhwezxP55a0STfEi+L69RHV7zv6p8iU3h5jw5+n4PviZVvI/gaVJiquwyO5CEkYBmaFoOQYwFXcbjUxbJURRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqyKgq6V0Ht3/clpAcGjbaZ8K0mBwk9PP5HdqHA3juU=;
 b=YtYpGodtlmJ6oLqXMN+JhoXdRehCRQNDGE2X4kV7F35XQpKqFBbn/ReaKzPUtUdjpJIQMjTPus7bcAM8AzqECF5N07mPmC7OJxmyt7A3io0NQnf4c/KxVO3TKv3/WbAirV+kRU3Vw6PYQKJaExcMYMy+/QkJLLb/XF2P4WDblt7UhENNdHQRuHYU+pbBJmZ9WdtoCGKUiWbFV/7TbUxzk/azoRTrwiPm4D9wP4SWexl2gdskvDhWEjFPCSJ/1kg+6DxyT/z+jrvaloC9YdKE3bt0+mWBlwXhy57NGR/atLSfDyNqa+Jc9pHsJguX4p88SSEk5EP7amMspf7XLuaBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqyKgq6V0Ht3/clpAcGjbaZ8K0mBwk9PP5HdqHA3juU=;
 b=oEgEshByIDuD1lkxp7hb69RnuwTPobcd9GAFj14i69wbQaBxTOvNcjzakNayDrrtLcMao/YbcX9O6gohbVG3vBnbPVRpwkt/OQVCsZdaXOqKOUObCdhfZoO6kD+/yAi2Cirrd30Ok151KhCUJxp7BqbXe7WHgGfccKx1hOLruXk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>
Subject: Re: [PATCH v1 0/4] Yocto Gitlab CI
Thread-Topic: [PATCH v1 0/4] Yocto Gitlab CI
Thread-Index: AQHYt8nlVEDeUTiM20ag9zvPCK1jqa4D28+AgAPjAYA=
Date: Mon, 10 Oct 2022 10:58:16 +0000
Message-ID: <524BB739-088F-4F82-A312-BC660C34BD10@arm.com>
References: <cover.1661352827.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2210071618300.3690179@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210071618300.3690179@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8316:EE_|AM7EUR03FT053:EE_|PAWPR08MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b0938a-47b1-41a8-9786-08daaaae5b1f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CKAg96okt6GuMm23JOfS1DoORIwshWxLDMr3jvY+W31JS+Lan9F31KCMGycu8GCvsY1qf8mO5WLPH5X9kaga1topqKg6W5Jb+66DvWmzaTTpkg1x2GWYvtzPZcGx9l/6jQBWxX1vVWHJrKUXwvO30Gj4X/XcOReg4cGG03Cx2jChW6tXNIzm7M2x+MT+RTR5uViOCbAXfBIR4Pv0Zc0Nim+l90j4MTYU0UFff50xUcQndMvXVQY9Hg27SM9YeEuvwaJ5wamNkUWqFkPaaX7uOAV4muG9hpnuzMqycQCFwZClkrPUJLhwPPPwErDIFM7OyFH9kwHNqYIz2CfEN9owhJNu4e1pv+cOz31GrqkFLbxCKwqUP2OAFM5MGjPv7AC/g43Yy3e6r6MUjA4pcEs5oBTIvyhi4HqbGuKQsZGDRrXc9lAYumwtW3rNFO4acOrW9k7kGC9AmOfzIJb89meE990qeav39kVRjh35DmDdE7ybpnCxh7MT9mhPU4hbb5WGs18EG93pRlRNXMKjigoA3pp+K0xSIkOaQ6X7mWhNM+l/sZ0M2W/kxJV6FnbBDS560FcPNo3wM1tkM47W2VGddo9ncgSSkjWlztJwkzaa6xQDmoLvGwhrxNSmCa4k6hEEy+JJKKy6ezv4aWhcf6FjMPnj81RxFr2JKmgMZ3b77JqjY5Ac7dSxEVsIu9mNYT+EPErSRalQn+Jf4lzWp2r+9VaNtvySuUKzEUhO2N12K8PLv7CE26qhSAoBPHFtSZu0MQ/qmcjTQIoNcKV0tWdXWBPNa4FjqdMWvCGSRWoy1Y4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199015)(6486002)(36756003)(33656002)(38100700002)(122000001)(8676002)(91956017)(38070700005)(66446008)(66476007)(66556008)(64756008)(66946007)(4326008)(316002)(76116006)(86362001)(6916009)(2906002)(54906003)(41300700001)(5660300002)(6506007)(2616005)(186003)(71200400001)(6512007)(26005)(83380400001)(53546011)(8936002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2A87BC778EE11449AC15325D3C32E6A9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8316
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	318630ed-ea23-4e79-a737-08daaaae5567
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VNw7tsYnDzMX1AGNOycXOCFbIuRcOlzeGAnJJMlI8dZeVL0krkcm2fq3n3WzV2lfL6eVUQgEvLyvGqC8LdOdomGfCsnZhbJOT4bV8pWcWBgKJK//jPuErHCnPSkE7ZJQ7LhrUfngR/pRH4qb6OpHCJaX90+RKc+UzU5sHAZdHo5Bi7oSLm2NnCb23VYYy8qcUJdh6GhkYWFqX1zgSMDX6VLR3UWKAz1X//LOkL/nBCozkoJiakIeCUaOeg2r+7d3dTXBNDkEEC4w23MDFmAE0QexjNd7wY2cDJ0C8fnRcWA53eiintGYF1rlE/qWRNFmx/Xbtly2FHabaxOn51JxX+ri+v4miw1Jq94TQOxG+4GixP2OBesE0TPunhYFn00w+2T+2o5IdRUk1sStTIlgGv7RRxSJv8yQdThUYX+hxyGGZheNHmFNkbIbIQ4QgAK/UJXhqeY1ILjkDm2KOdpIVG/n+04sDHE3x81t04Gsb+4LsxO3uFz9dPvztMVVGgOM+ADLgtEuLIg1UNoFpPmrXlLFpA3aZ0y7IqYoJyBQphzWVIEPQV6kC8vPSLMgpY4dZIijcnYDMc4cVtVeUbj15Umx1/3ed1uk/DPRcM+XUFWmohUBQv40wWXMC9vThVpOKPK29sbF0bVychrhDdRpfYfIQ1eO16IwIoytezrlbzeuMyHG55k4SMpeRi/EtynuNmkD0DGIiw42s5p0yspYUT5vqLXk1joaXL+eLxjFUDplsryXOZ/xWDgEJee1gu/EgZFkjtI5pRHzcpZzYTtBYw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(356005)(316002)(478600001)(82740400003)(6486002)(40480700001)(6506007)(53546011)(26005)(6862004)(186003)(336012)(6512007)(83380400001)(40460700003)(36756003)(5660300002)(2616005)(8936002)(41300700001)(54906003)(2906002)(70206006)(82310400005)(8676002)(86362001)(36860700001)(4326008)(81166007)(70586007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 10:58:25.5706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b0938a-47b1-41a8-9786-08daaaae5b1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032

HI Stefano,

> On 8 Oct 2022, at 00:36, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 24 Aug 2022, Bertrand Marquis wrote:
>> This patch series is a first attempt to check if we could use Yocto in
>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>=20
>> The first patch is making sure build-yocto.sh is not catched by
>> gitignore.
>>=20
>> The second patch is creating a container with all elements required to
>> build Yocto, a checkout of the yocto layers required and an helper
>> script to build and run xen on qemu with yocto.
>>=20
>> The third patch is creating containers with a first build of yocto done
>> so that susbsequent build with those containers would only rebuild what
>> was changed and take the rest from the cache.
>>=20
>> The fourth patch is adding a way to easily clean locally created
>> containers.
>>=20
>> This is is mainly for discussion and sharing as there are still some
>> issues/problem to solve:
>> - building the qemu* containers can take several hours depending on the
>>  network bandwith and computing power of the machine where those are
>>  created
>> - produced containers containing the cache have a size between 8 and
>>  12GB depending on the architecture. We might need to store the build
>>  cache somewhere else to reduce the size. If we choose to have one
>>  single image, the needed size is around 20GB and we need up to 40GB
>>  during the build, which is why I splitted them.
>> - during the build and run, we use a bit more then 20GB of disk which is
>>  over the allowed size in gitlab
>>=20
>=20
> So I tried to build one of the build containers on my x86 workstation
> with the following:
>=20
>  make yocto/kirkstone-qemuarm64
>=20
> but I get an error from the build:
>=20
>  21:30:20 build qemuarm64: Error
>  22:00:38 run qemuarm64: Error
>  22:00:41 Build Complete (2 errors)
>  The command '/bin/sh -c /home/$USER_NAME/bin/build-yocto.sh $target' ret=
urned a non-zero code: 2
>=20
> Anyone else is having a better luck than me?

I will relaunch an image creation test locally and come back to you.
It could be that Yocto has been updated since I last tested that.

>=20
>=20
> I don't think it is a problem if it takes a long time to build the build
> containers because they are not built often and they are not built as
> part of the gitlab-ci runs.
>=20
> The issue could be the resulting container size. I wasn't aware of a
> limit in gitlab -- I would like to try if there is a way around the
> limit (either by changing a setting, or potentially switching to a
> premium account.) However I need to be able to complete a container
> build first :-)
>=20
> How did you find out about the 20 GB limit? I couldn't find it in the
> docs. The only info I could find states that there is no hard limit on
> registry.gitlab.com.

This came after discussions internally with our internal gitlab and I found
some forum discussions saying something like that.
But it could be that Xen Project does not have this limitation hence the
need to test.

Cheers
Bertrand

>=20
> Cheers,
>=20
> Stefano


