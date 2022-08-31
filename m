Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE35A736E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 03:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395252.634791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTCfO-0004jm-Ia; Wed, 31 Aug 2022 01:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395252.634791; Wed, 31 Aug 2022 01:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTCfO-0004gs-F1; Wed, 31 Aug 2022 01:37:18 +0000
Received: by outflank-mailman (input) for mailman id 395252;
 Wed, 31 Aug 2022 01:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zBhm=ZD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTCfM-0004gc-L0
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 01:37:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706564eb-28cd-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 03:37:14 +0200 (CEST)
Received: from AS9PR06CA0498.eurprd06.prod.outlook.com (2603:10a6:20b:49b::24)
 by DB4PR08MB8031.eurprd08.prod.outlook.com (2603:10a6:10:389::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Wed, 31 Aug
 2022 01:37:12 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::5d) by AS9PR06CA0498.outlook.office365.com
 (2603:10a6:20b:49b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 31 Aug 2022 01:37:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 31 Aug 2022 01:37:11 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 31 Aug 2022 01:37:10 +0000
Received: from 172c9b2d2c3c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8B3BE13-42B5-44F0-B6B2-6D8BB93E4AC0.1; 
 Wed, 31 Aug 2022 01:37:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 172c9b2d2c3c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 31 Aug 2022 01:37:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5685.eurprd08.prod.outlook.com (2603:10a6:10:1ad::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 01:36:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 01:36:53 +0000
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
X-Inumbo-ID: 706564eb-28cd-11ed-a60c-1f1ba7de4fb0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P9Bq2ww+XICTlh74Fr1jS90Bkc/iUGE5FT3Gf8kvQNpnhuw1wRyYMDgy6M3gsPXo6Q9rknlkywGICGVT27AP+Ty6n6uC1LfLpqz/O+u0izwo5/s7EYj7HmJ1TBReIky1sMKjGxVPppVtvA1GvYayRtbMn/xq5EjLWArJ5YmzINMPVGqR9rtvfP7gxxuyh8HqnmXUEiAY0GbfWkqCQBMzxcMAby54UOKlIR7uDp4fpgyHdU4UeimNC97T8rIzaZ2PM4sP68NRUfxHKVHJbowxpzdPg8wQOVC/HCT0onNLqqLu6heCuzinOfi9kAjkgvBHG+dXy83xhKFDezjFNmR53A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edq4u2FkrHdb++OclwVOmwF7+BE/+T/T0nTduWVCH4U=;
 b=QAivcqETvMhK6E99dTnWixWnvuwbj0W2VNL7SurRY5dxedRx1JZiKIcfK5O2+OlbjX5YXLbqMn+V30MNdIz/BEmkQP2JAdDT8Z2SgAAa8/75Z5k+77OMGUnXEXwxtEpfieOpyeC1y/TYcGP4MYEeB5COef8BA/ajV7n4uttVf4O1un7c7bvMAe9X6jbOX5Hp5Rj5IK5rlbOeBO7q+EBd6Ny+Fzj2PMtqbSrrvuPfudHfGUeF3LZl7V4SIFo0iwa2XvQ8YJl08Ymt7Oqax3nAkdtRjZ1aHxbUgb55z3jnf6W8efE4BH2MOez1ZAcbdN1iv6QLT9fnj5lPrW7opXiXOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edq4u2FkrHdb++OclwVOmwF7+BE/+T/T0nTduWVCH4U=;
 b=lDv19b282BrlTZySDRrbpGnLZYj1nyYAAUDMTJ34zayPL+W3+d9t8Q1Lvq618F/Ru7DNH+3YvWz9Y/XU0iu/v9HfjtqzMepJOfMmLim7Yrvc7xFWQE/0f7fzZBxrYDbDB515UQtFTzyvbsHYiZzick03+kD6CdzPm+G808M1JeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8gFlxFiiSGZAz++zfWhhNw/peUgu1qhYna3hwdbymoFi2AA0kwXz1aWubqN9TskQrj3+b78BH96628X2NbvQ65Wi6SbznYvkAhXh/q47DlPi/YiNxNUK51yfW6b32P28Eew0hZA5uR6sKF6dOUfo/RQppsXZ0nCPWOasHmNvjMobmALEJP+fy2rZmzlg44N7bYhp8IbcWCb5u0hBooDTTY7wF+bFaQrlSXcX6wDNi8RK619TpBAtaYTWkD9FezdL7l0RURdbPuiE7zLn/oJwuRbufngKMzG+o1rC8D9XRqJ/5N4o0qUMoaN02fY6qXNjUIAJtAimd7rf/F65jw3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edq4u2FkrHdb++OclwVOmwF7+BE/+T/T0nTduWVCH4U=;
 b=VCN7SENLSbV4eh2uROJvd3cn7PbYQPZ/M83gGU7/zDZavGwWYqAybiKTPQfynLNjvtZZbhdzqdAUPjDZnlWInZgk5tGAuo0993XUOxjiOPBZHTA9fwEd1DcIxhj8rors0qWqYB+gPscIrKCUVMHAKkZHqpgNSq4pbbyD3RBJFGJHAsfrCn12S3UMiUJ9xAGmA/DthHZHUX1gD0jZtYIRurm7HESE2R3JJradEyWWSBlUiAtAowZXbnxU//IvlVmGI7Af6Pe91DGXyKITP5OHfWD/peH/oWgyus2a9jugOHFLKA4JxiD0OJTNxeyRoCV6Qdx5qYubqnMupBTZodqYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edq4u2FkrHdb++OclwVOmwF7+BE/+T/T0nTduWVCH4U=;
 b=lDv19b282BrlTZySDRrbpGnLZYj1nyYAAUDMTJ34zayPL+W3+d9t8Q1Lvq618F/Ru7DNH+3YvWz9Y/XU0iu/v9HfjtqzMepJOfMmLim7Yrvc7xFWQE/0f7fzZBxrYDbDB515UQtFTzyvbsHYiZzick03+kD6CdzPm+G808M1JeQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugTfbCAM/WyEil7pMplK0r3q2/e0SAgAeAsxCAABaogIAAAyrggAAVl4CAAAH9oIAADu+AgAABegCAAH7kAIAAiGiQ
Date: Wed, 31 Aug 2022 01:36:53 +0000
Message-ID:
 <AS8PR08MB7991D08DE0A6B2C5D1CA715592789@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <536cad9e-53b5-2eae-0cd4-06f899229470@amd.com>
 <AS8PR08MB7991C3859BA3BAF913D50E1C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c749e3aa-39a2-a4a8-9a21-77a65881dca5@amd.com>
 <AS8PR08MB7991780D566C3EEEAD7F5BF092799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208301026420.1134492@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208301026420.1134492@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4264BBB93D7CA94E9138B0E1CA4DB44E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 22448179-5e2b-4e92-9048-08da8af1534e
x-ms-traffictypediagnostic:
	DBAPR08MB5685:EE_|VE1EUR03FT041:EE_|DB4PR08MB8031:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T35DhqoH1Yv4mNX8gFaRWNreGtWK1XHUHuqh1fXSMMvdPbrgmpHkpSuHfJTynGfe8C7Wio9qLeIBHvtu7UM2F3jMMNhRgzObWfuIgnEzsGNQyMpL3FwDZ8MLuxVvMmdVSDkWxSL9I5GHn7ou42VnrJG7P9VfHw8R2XGHqCi1PfVk9ciMZXlPC6b+9ujEArd+oFrik6OYR0YB64gGkTmeZ2Ads9tlGEXw72N4SwCIEL+U6Sy5yv7m6hJp2EE6KeA8sTKAgE0mY+7/usIeaPeStxhKSWDAUWjHr1PkB9oTvt3fgAiTlpc645u2gmj423dv+DMI0cVOmEY10fcMh7Ab8BmgpWcEexCEUgSXtsXM7N+mNryEp8GD7PaiIhEOoangNu3nGeHGKWwy7kzXqs8SYnCIVmQP85kdldKCIKP7e1ppN/EMsz6MJmd7/OrAmt+H/mA29fVCazuQtdvjgYrwuBz+lHBTP1s6TFVUVNkW51hXMNhY2hWMylHXeedX2KxkA/wycyB/NL9H8u3rOx5FWs6GDQrtg/4S/3sMvUUkBB/0ZnX7p7NaNuL4PRnu2kPQI/nG281S5s2qz2CGznDl8uUSdnck7q6UsLn8D7tK4HlIsKm/nmr0bi7norILc5zeBaCjCMQXNEYgtdqFTGpsi0IzIom1k6Hyk29zJLhKQpkVV9/V1EzSrB2Lvdn82CQrZsSzUEqR/bAaCSvUlx/dO+rXUWoOG/iPSWO4pUsD2rSn/9rkda2Up9ygtOTBacH+Ep0iDlE9Dw4OHpy6W4fDjg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(38070700005)(186003)(83380400001)(5660300002)(478600001)(33656002)(55016003)(2906002)(8936002)(7696005)(6506007)(76116006)(6916009)(54906003)(41300700001)(26005)(38100700002)(52536014)(86362001)(316002)(9686003)(122000001)(71200400001)(8676002)(4326008)(66476007)(66446008)(66556008)(64756008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e011103-0c16-40a9-1e2c-08da8af148aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b3Ox8hnON1lHXZlBShuhr3RMy/eAT9ZCQXZH/xe3AJCRYiF6lDOLUfaH5gEyzM/H/DL/5u6ZuVr0Db616exUeS2PzI6hh2Ofd/uRzmoNjPVZyvRE0hPJujL2UKs0mtuotxCtHGyAYUZncggmXHFIENOjymBVWhWb5acTb+jTMrpuBlQUckeKKuSKLBGsjk9ExkJsNMUyjZEIIUSyfCfb7/s50Q5w+QqJqvtWSZl5zhiWnwRTsmLAhaBue/pKpZRjRnSHtm8W/EhaP5rV7iimifjQDUgQzJ2HrahsDhIGnkZs7kec9e1wKyhaavcKFWCaJT/1+g9YihUB4QgfUas7aLDm9x3z+7NvgH1DdbWJvBkoQ8Y3PSsGMzhjfI/EMu9CcySfTA8MPwbgQKGg/t/HZCOKbJFFg8+j3xuVE11WuaoB758BYN0RGFEoLhZaXapD8xwlSd5PqvvxSwyn680kSVWLQpU/kQak2LT3dIUo8s4wLkcZwCRYk4GcbpMJ8HUI/L2QCro8cu4Dq4DiEklHEcreZ1X2GZaROozQBOGDy/BzOXEFKoms/crcGf2IDc2+EfqfMw4XoF+QstQ1cMVxHvoE+5jZQ+ObAY12ozqfaqFoX6lXGnuCjF9dFSpX+3V+SO3u8yYHKQqHiYk9FZMeYwufOrshoo7TbsJoDZ+YvHwbqt/c0jHLxUR77cbWlOiVvVSHuYHoN6GNJaYOUTXicxr1DG6sjntLmrWRTnhphBqCeyojpIhJdin5DiVcTPJggvQDG20E1//YJRyXmz4k7w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(107886003)(26005)(2906002)(82740400003)(82310400005)(6506007)(55016003)(7696005)(33656002)(40480700001)(186003)(47076005)(83380400001)(336012)(36860700001)(40460700003)(54906003)(5660300002)(70586007)(70206006)(4326008)(316002)(8676002)(81166007)(52536014)(356005)(41300700001)(6862004)(86362001)(9686003)(8936002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 01:37:11.4447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22448179-5e2b-4e92-9048-08da8af1534e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8031

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and
> heap allocator
>=20
> On Tue, 30 Aug 2022, Henry Wang wrote:
> > > -----Original Message-----
> > > From: Michal Orzel <michal.orzel@amd.com>
> > > >
> > > > Oh I think get your point. Let me try to explain myself and thanks =
for
> your
> > > > patience :))
> > > >
> > > > The reserved heap region defined in the device tree should be used =
for
> > > both
> > > > Xenheap and domain heap, so if we reserved a too small region (<32M=
),
> > > > an error should pop because the reserved region is not enough for
> > > xenheap,
> > > > and user should reserve more.
> > > > [...]
> > > >
> > > >> But your check is against heap being to small (less than 32M).
> > > >> So basically if the following check fails:
> > > >> "( reserved_heap && reserved_heap_pages < 32<<(20-
> PAGE_SHIFT) ) )"
> > > >> it means that the heap region defined by a user is too small (not =
too
> large),
> > > >> because according to requirements it should be at least 32M.
> > > >
> > > > [...]
> > > > So in that case, printing "Not enough space for xenheap" means the
> > > reserved
> > > > region cannot satisfy the minimal requirement of the space of xenhe=
ap
> (at
> > > least
> > > > 32M), and this is in consistent with the check.
> > >
> > > Ok, it clearly depends on the way someone understands this sentence.
> > > Currently this panic can be triggered if the heap size is too large a=
nd
> > > should be read as "heap is too large to fit in because there is not e=
nough
> > > space
> > > within RAM considering modules (e - s < size)". Usually (and also in =
this
> case)
> > > space refers to a region to contain another one.
> > >
> > > You are reusing the same message for different meaning, that is "user
> > > defined too
> > > small heap and this space (read as size) is not enough".
> >
> > Yes, thanks for the explanation. I think maybe rewording the message
> > to "Not enough memory for allocating xenheap" would remove the
> ambiguity
> > to some extent? Because the user-defined heap region should cover both
> > xenheap and domain heap at the same time, the small user-defined heap
> > means "xenheap is too large to fit in the user-defined heap region", wh=
ich
> is
> > in consistent with your interpretation of the current "xenheap is too l=
arge
> to fit
> > in because there is not enough space within RAM considering modules"
>=20
> I think we should have a separate check specific for the device tree
> input parameters to make sure the region is correct, that way we can
> have a specific error message, such as:
>=20
> "xen,static-heap address needs to be 32MB aligned and the size a
> multiple of 32MB."

Sure, will follow this.

Kind regards,
Henry


