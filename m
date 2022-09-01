Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E75A9A29
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 16:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396678.636924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTl6F-0006Yw-G4; Thu, 01 Sep 2022 14:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396678.636924; Thu, 01 Sep 2022 14:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTl6F-0006Va-Cg; Thu, 01 Sep 2022 14:23:19 +0000
Received: by outflank-mailman (input) for mailman id 396678;
 Thu, 01 Sep 2022 14:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzPc=ZE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oTl6E-0006VQ-LA
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 14:23:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20046.outbound.protection.outlook.com [40.107.2.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f264bd9-2a01-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 16:23:17 +0200 (CEST)
Received: from AS8PR04CA0142.eurprd04.prod.outlook.com (2603:10a6:20b:127::27)
 by DU0PR08MB7788.eurprd08.prod.outlook.com (2603:10a6:10:3b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 14:23:15 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::27) by AS8PR04CA0142.outlook.office365.com
 (2603:10a6:20b:127::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Thu, 1 Sep 2022 14:23:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 14:23:14 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 01 Sep 2022 14:23:13 +0000
Received: from 760ab40789d8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 261AD0B5-5ED1-4697-8726-82BA02569921.1; 
 Thu, 01 Sep 2022 14:23:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 760ab40789d8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 14:23:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9403.eurprd08.prod.outlook.com (2603:10a6:102:300::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 1 Sep
 2022 14:23:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 14:23:05 +0000
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
X-Inumbo-ID: 9f264bd9-2a01-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=k7N1gQVJGJsLQDlab716RFb8jDCqwAgdlYBDyXLaER2LFSqUluS4EY6Wv2pcF2GIDk99EtrAZPK9HwjsfbBd7NzZ4QkylLM3rihfCp+PiLm4V/inzxG9VanLX7BmP05u2l3apLK9PNUl4lUvSe7e9GU48N4GpiHP6zHt0C9fT2fEDqDlk1emkMrxldjyRBlPXNgMNZEJiZnS5d3Oc1eNySkU1tU9nAEshdVbG1GSUQzfQQ6/9uWOE3Au77IikIWQ52Zh71Y3zufQg8YxCTwYHV/pa5hoM9JfFGZJX1RjpYCpjhxA0FToYWl3Zv950sGPkWgZfovv2f3QsY4Tuakgrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8STocPzQAsp/QtFbLD3tT4iT/1jCPMQUajeWWkRb4Ck=;
 b=dhfbSS5dW40eh61vMf3WuZhxueNX7aaZBZkbPJf+tAFVdVxLDFYfPX/sf/u9LzLVU/8l3p/ZpYJYKPdb5AIzBFniabilD9W02EGtOVWXIUL9aMkShfLsV9K7JajizrYoH/5b4DS24b6BwxfmHycxEgZ+/NR5AxkLQxWezt9BbXme8rDfn/7AvCY9m/rFhrRimx03WoBDUyb8VFx5HYmCYAvPYdWR/gGXVHjVB9pnCrwdjEpzYHzrsJ5autcwmUbOdAImc/pq3v8xsmx7d9tkqm8KnaPztCU7t7pCLtAcLXGsuiN8PmjvAHqjxvFridR+xBC4raryCcNENCJWjMj3jw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=timeout (key query timeout) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8STocPzQAsp/QtFbLD3tT4iT/1jCPMQUajeWWkRb4Ck=;
 b=9ZkgH+KidC3ftaYMcbCea33ZkkhKOfmZKEHdoGItOhf+NR1ziPsBvthClLnir1ydXxeHKkKmzegTJa7hS2VSIExF+RQ4knijqcU2flBNOIr+N7m+oe3y4wQJM75NcOEKWfq1NsdeheLdaM6hBx7DtAB9As0VlUjPDJDHXVlEyGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=timeout (key query timeout)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3883857637e5dcb3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Usgk69EHp/rI4cQdWOH4+PjDT3D+MuPmux1jIaKTwmeJx3d4jvnIBMD5TNqjli+UgjqVNC+3u+Yni2YaxR3LTReaVSi5NGB3bhVlkuGQQuaQgKeo7KuXyZ26LTXe7CjEcKuxvIEMXECL+WajNlNGj1PG6vbl4NAM2Aipl+G7cEUBn2zsf+T32ksj/VkB3PTbTTjwoN9VvudpY0DxufDgJUT1maqhGF5Ru8OLKs5GQmy7VswpQKa7TBWFfuAMQhWztbONhjUZHtvfJV2GsQjD2F8NCxD8KWGggi/ATHTTEGeRxnd8/xxVcA528SsyUMWgisKYfjsjR0LUl+gs1TUfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8STocPzQAsp/QtFbLD3tT4iT/1jCPMQUajeWWkRb4Ck=;
 b=Zt/2yoRVcGQP9hGTl6NI1VcLlSvD/NCFJSexTSq/FN2tyF+eDP7hCDgdMAZTmLyNV1E2+6ITNMmc2Mf0bg9+2NBOmW9Mm7YQRhfWjA572zdXdmQmgyQwqXUVVpHx1a7DrUMYOam0mkDoTALd+j0NOcvuesqzSxwU2a3y5xBABak8bcAKHNWlqyQAKVPLnaSckI6es4L+J5tuCzUXYoQsXOUwx4tT4zt6ullEhpzMUgatSnhqaqMT8eTumZk34Bd5YtwDNeUH2tKpfE3XYzOi0G4JaNc5+ypUa4BOBS06zX/I3DgyWFXqewIpeD0ORS95+JcQfTcoWXEtYYPHEgvhHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8STocPzQAsp/QtFbLD3tT4iT/1jCPMQUajeWWkRb4Ck=;
 b=9ZkgH+KidC3ftaYMcbCea33ZkkhKOfmZKEHdoGItOhf+NR1ziPsBvthClLnir1ydXxeHKkKmzegTJa7hS2VSIExF+RQ4knijqcU2flBNOIr+N7m+oe3y4wQJM75NcOEKWfq1NsdeheLdaM6hBx7DtAB9As0VlUjPDJDHXVlEyGs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
Thread-Topic: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
Thread-Index: AQHYroB9tR3Qy3uVT06PvIm0QNgWhK3Kv7KA
Date: Thu, 1 Sep 2022 14:23:05 +0000
Message-ID: <42AC631E-BC9F-4581-8983-37D765BAF537@arm.com>
References: <20220812191930.34494-1-julien@xen.org>
In-Reply-To: <20220812191930.34494-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e85dea6e-168f-4910-700d-08da8c258182
x-ms-traffictypediagnostic:
	PAVPR08MB9403:EE_|AM7EUR03FT008:EE_|DU0PR08MB7788:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G+/fnvfgu0wkNi4OpXMkrSWPSj0PTlCXSGema6/W08KqZdkz2u3FLxF9r5mQIo48ffrqA61XN54YkoPZq2bnDQD+c9gFWvxJnASH4rsDJRiLDhpEQT9mpiZp85t4wPkKZtH+JYFJWUlIdwaOaa6x6byQGt3HdX6jg8sgiwf+xEl4KOOs/v8fs/FWKI5f+dvQXhjdt3GrO8955bWJVxb73VSpDVt8+yr6ygHMYAYRE0TBP3krdRFw8cvQUfR92YGY2v6Vmvour4mWPUZlPdGVGdj0TClN9nPAvQHth2IAVNcbw7FK5MKGUlOHqRx0nkaseLLS8mAPkGOzTi2HFi3pCNAzd1KuFAyg0QCpLU2949wnVV733vA65o7kG4PuLRFkPv9DdX96Eix3zXvSCL3RwqCr6i5gdyF3UABsctAM68W7NcHQ06pWjRzkw1gXOUq2++XrmwpALBE/9FnPuB5W0KLWtWxGs0zLbBbpZVMZ4VpgDEAXL5yW4Hcosa68D56sa/vb/wrO3slAOJNIbLzABRfB7Osivdpy15IvFIUdjUPsyq3nnd69Oj7HJUjJSlCsIFK49vF7zdP0nLW8vbGJEIY6VegUuSemcvSYek1ObZ57adCB5HNLu3hSoIe13iuSX0dSsauji1T7SQCEXJAIW7jRjoLFn3NDB0T4eVv28l34MMm5PcBMQz6X2L02zcw/KwhsKwYpqKaj36jtjszlgiC+8Hn2AU4A9Y0T4TUV5LpG0s26AryHMLKr6am+fY7/emWTn6eWVbikvGXc9tj5OTjJL55R8lyOgYbpblQ+ru/n84xdUOtn9VvFOS/AznqRU45onF1IL2yM0enrrixpgw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(41300700001)(53546011)(66446008)(64756008)(66476007)(2906002)(4744005)(91956017)(6506007)(8676002)(6486002)(8936002)(76116006)(5660300002)(2616005)(66946007)(86362001)(478600001)(66556008)(4326008)(186003)(33656002)(6512007)(26005)(122000001)(71200400001)(316002)(38100700002)(38070700005)(6916009)(36756003)(54906003)(142923001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3DFB4764090B0E47B5D4384F80DEF576@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9403
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	456ae11c-9241-4385-d985-08da8c257c6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zr68zhLj9oiCcjBawrsA1zpfx0eFiXZre1Ao99PMmH9yBUJj4vahmxnHftVc9W2HSDEAP9gxLVzRJKCQ8Rh0Iomo17lPV98Rv1IaNlOYzn4SOwmeiFu815j6F+QXvNMudnmSXRAz5EYvNNgXYyfUAL2MNDRz2Fq6/wcgsRmlro/Cs6KoZqJ3f0OIBYEzAAkM1X9ReGB/qlLIl1+Nc2agSlHoZm/yiJK1dS1neoDE8olTKigjFx3dTkBIkV1ii9AtGGLu3/BWGhqi/5uBsSYqJpEbyEihDLYfqgLxOP4RCWKguoDU6sbBt+Vk0zNA0YO0wVMXWGHjagR1YGyD6hecRiJolClKtwVLxYoNG7GufZngnn/bQVifCj2xdMhVret3WkhjEW/kwa/5iIoHg55QliHluWFGXuZ7nmYdMU5bvr7MFG+MUS4onBjsyP7ls2aBlO7xGUg1kAfZoGMkkmKlaDcG6MPFnHBuO0t1f5w3v2bnEFwCyrSFY2jHBlvHbEOVQs8XnnQuuKo18KJ66yH1iOQERmyB/twpIg39qvxxpUroULLYzbvRdf81O/aY4Nv6VDllNYbtNi7o+vHm4yfmpb8SrWbh98N4uD000SBvqCEyBOK+s36sNOw5jtZySWL5C2ao/ANmxTR0/t9PYal6nddSMMA+rb52EyhjhrHWPW7eo4FX6PxL2LWBtjJ17xcBsb8aF9FYwy8XcKYw/gmGsgF7DOK/YvBVBUGu1emJThVqv+sjSo8TLFs9TMVdh5C7K0Wzkzz330rWroqyqJDKUxIzD7uv8TLnlQTuNtjSOYE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(40470700004)(46966006)(478600001)(6506007)(33656002)(4326008)(8676002)(41300700001)(316002)(36756003)(6486002)(54906003)(82310400005)(6512007)(26005)(53546011)(86362001)(2616005)(81166007)(36860700001)(336012)(47076005)(186003)(2906002)(8936002)(40480700001)(6862004)(5660300002)(70586007)(4744005)(70206006)(356005)(40460700003)(82740400003)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 14:23:14.0209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e85dea6e-168f-4910-700d-08da8c258182
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7788

Hi Julien,

This one passed through my filtering, sorry for that.

> On 12 Aug 2022, at 20:19, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Xen build system the symbolic link xen/arch/arm/efi/stub.c. So we want
> to ignore it.
>=20
> Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> .gitignore | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index ed7bd8bdc76c..0d53eb304993 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -295,6 +295,7 @@ xen/.config
> xen/.config.old
> xen/.xen.elf32
> xen/System.map
> +xen/arch/arm/efi/stub.c
> xen/arch/x86/boot/mkelf32
> xen/arch/x86/boot/cmdline.S
> xen/arch/x86/boot/reloc.S
> --=20
> 2.37.1
>=20


