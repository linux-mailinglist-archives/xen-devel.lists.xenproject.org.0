Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F231957C69C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 10:40:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372572.604376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERjY-0004kE-81; Thu, 21 Jul 2022 08:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372572.604376; Thu, 21 Jul 2022 08:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERjY-0004hN-4t; Thu, 21 Jul 2022 08:40:36 +0000
Received: by outflank-mailman (input) for mailman id 372572;
 Thu, 21 Jul 2022 08:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTDz=X2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oERjW-0004hG-9H
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 08:40:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8be861f-08d0-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 10:40:33 +0200 (CEST)
Received: from AS9PR06CA0247.eurprd06.prod.outlook.com (2603:10a6:20b:45f::14)
 by VI1PR08MB4349.eurprd08.prod.outlook.com (2603:10a6:803:101::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 08:40:29 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::76) by AS9PR06CA0247.outlook.office365.com
 (2603:10a6:20b:45f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Thu, 21 Jul 2022 08:40:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Thu, 21 Jul 2022 08:40:28 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 21 Jul 2022 08:40:28 +0000
Received: from 0dc55d3e3aae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04B66DE1-D025-41D4-B868-AD0D6D510FB7.1; 
 Thu, 21 Jul 2022 08:40:21 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0dc55d3e3aae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 08:40:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0802MB2565.eurprd08.prod.outlook.com (2603:10a6:4:a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 08:40:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 08:40:19 +0000
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
X-Inumbo-ID: c8be861f-08d0-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Xfd+V7xTO+Rgyi0iU6IzK8NQSlCYIhoMBQaktgja++e02ajZq8nOTldZK7ZPpFjV8I8lNwd0fs9PA0aRR4FWkPb5BkFhbGSON+0ekF3OhVFFm/A+v02vmnfDaXI8EfSonnQJj97DISqA4WXL07c3D+CJPuTM3anyXf9vWx4F+9Sa+KSpKLu+4agKN5ur/5X//GSlSALQasW/CQoup9G0apKgEo3R0//kYMM+GsWxDkQwYNLtFonFA32TZNAkI/LPF1ANQdKX3JXKe12VpD37TbzmMVBicnNt1ZcHfXa2TTRalXmLWgMMg8NJwENHwnUNXGLdvoFz8zfEp8WISHwMxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdlNcI4fVnMTHFKCh1VtIFDmB9cGDOb3vX7/ehxnR+E=;
 b=Lxz84nC62mZfEO3bs0ZNllIe+zsFPPeRLJBvVjd7FcGhuaZlABeUJKly4ocwUy7hNUGcErK7ZAW2aCdM1mZG4xjP9mo7A9BWR9yCxPV5K7x3Vzb35SyAktX4d1reKIOGCvl6gC233SLKYgWAXVoICxf24SRuWh4vhB4ohGx0+rifeQtr5Tgyzz1Wuc91IIBGxxfJO52EAe4l/0aLkNJu5VIXyfG0PJAU8SqursZh9b/MBXCiM4oUGC/+ujb6MCdtEkwsilFw7tytx9gJzOar2e1RwhKz2E02sfgGesSf48gjYY7gF9KW7oN/+Z0b+rR2rfSv+nSDpEZreOKppPQlzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdlNcI4fVnMTHFKCh1VtIFDmB9cGDOb3vX7/ehxnR+E=;
 b=ynihlbv8l55oUQ+2Wun8HxxMTkWbz+LGE9Y4rXdHiBijTYPBygiZdNhS35Y6I3z8z2LpCnZ5KarkuqqfsOsZIQUVE783mYKYLEPn51F9vm3ayPdcyBagsBeUbdoCbI76QNFfM++cnHHR7Nx7b0j8Q5yhtSAFb4JMKgYOlfgl80k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97dd903050827620
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayBcJRV6YeENLunZ8F9wc5Qh47LExRo0o1DxulcBH8gMWJwBbLcxETRhQgQHiC5qNZNExBN2SQvCBAEUJPQ9exULbZRAmwZsc6FbpyHgI7OitHvsp4VimwrHOML9/4nGPHKi8GVR7Dl/SfLR25UOfErWVxBZkdM9D1AI6hZhCg26bXjB1AMTmy9+kn3W7KKWRhhUP1uJ4wnr0PEd843Oifo9vEt1SzFpP3tx/tkxIUZl080M2s1LqoNNx4jpEyD1XIDqBkCJfOJ/W0P3t3Kotibbgf3ttFwxXzx5Uhzzi//PXyJhPQPFCocFTT+IztykMcU87m7zpeMqMqdK3dUzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdlNcI4fVnMTHFKCh1VtIFDmB9cGDOb3vX7/ehxnR+E=;
 b=lEeeDQK8Sq/6hSwWclmgNOjq2WkhVg9cVPRKzNxSBFrWAbwCnb9sZJ81e37ilucXdaI5EY0AR2cR1ubygyHbbzh9jOA9Gi/dJ2CMTE93gW3DJrX6gh7x8askkO7Rnwb5o0MirXYRx8te2xqzoztCAu84IUd3QYqesQzTNQXDYhZ1nN3gZkY7b4Xadb1QdPdK/t648fA3EEVhNtDb08t5bB7CL3Oy++Zsb0Fez6X2CPpE8bfB4nfeJQBoM8AJ/n8JTdJmLc80YHLibviHOscNbuEj0xaihJDdKqU5c9Z0ERYQPOzV+ugnGCUwTu1G2fJT8RRz6eWe53AOPWs//Ong+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdlNcI4fVnMTHFKCh1VtIFDmB9cGDOb3vX7/ehxnR+E=;
 b=ynihlbv8l55oUQ+2Wun8HxxMTkWbz+LGE9Y4rXdHiBijTYPBygiZdNhS35Y6I3z8z2LpCnZ5KarkuqqfsOsZIQUVE783mYKYLEPn51F9vm3ayPdcyBagsBeUbdoCbI76QNFfM++cnHHR7Nx7b0j8Q5yhtSAFb4JMKgYOlfgl80k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/5] xen: Rename CONFIG_DOMAIN_PAGE to
 CONFIG_ARCH_MAP_DOMAIN_PAGE and...
Thread-Topic: [PATCH v2 3/5] xen: Rename CONFIG_DOMAIN_PAGE to
 CONFIG_ARCH_MAP_DOMAIN_PAGE and...
Thread-Index: AQHYnGjcNxK9N3xUAEK+BzEmL8ISta2IgjKA
Date: Thu, 21 Jul 2022 08:40:19 +0000
Message-ID: <36782478-2EF8-45C6-A1CC-1E299704F33B@arm.com>
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-4-julien@xen.org>
In-Reply-To: <20220720184459.51582-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 219a6269-7cd6-498e-30a9-08da6af4aa74
x-ms-traffictypediagnostic:
	DB6PR0802MB2565:EE_|VE1EUR03FT042:EE_|VI1PR08MB4349:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WuVJyznm8xz+RUqy7i9/vIgQOi3Opm5bRkTqITgXRjufKNV+cPkIHKUBgdA5M1gb65lJ5bA6ajSbv0WSLtxVyYwoYIUO0OEsvWhAVF8oZb0J/hl1fkMOorO9ONTHP/XXZBLLFUQOIeQVuyNQuh0Ihs43Ltd3m16emaoJ89qkBtfq1Xjxb6WnF19PcQEkExy8Ul9R3+zwBHadWJsvs4j657yIeiot7PmamhjbbcSZDb4qeOFgiX/Qb5Tfhzh/JQfpL5SRSybopU8e3S5m4sBcGQu8KckUtmfcV4okVJNV7EY8JPMIfkq1aVKpdT+dL2dSZkHu8ccCtxz8+xxY7NgUCf+kABVY9c1JlD9WijhOgdOoOwpdXyGz1QbhoQeX3lsJKC5TMt6MqiHt56zkfAzutAUh9ftq9LWa6DLvquKeorf2bli3L2hubHkOl4eR3BlIJbj8YmkXZEXO/mTc7dM3r7fsrDPVJQ8NANNqm/8R+utDJqH8Z0RYyyFkhNf6NPf9vMYXLGjm0LAXYuCERGbZp/2udQNCacJfL9M9m2xROedsrS9QQV6E3yLzY/gcZfztNFjBjE2Nl0pPuX7yibR+p3ZWH4kJ7r5ZJwXMTnE5KRfvMdKDqIVQSLYGf5AgDrCIVtg48vpHCDkZgiFNHDbEqmRopL+jzTHhcq77Wx3du+Uz/HtjEzwxM+iIKokybmDml/i/bviugedZWuLcScMXmNgeJ9kPrQwkSPFkFDShe9A+pYARAn+yBfaMFCi+Qblq31bADYSEqyK7BE3S3TcbtSded69OT+kMK96pVKMY7krDwIuuQak+/KGGWKeVkHMbTjyuvoiUIKc/e92J32HW+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(4326008)(5660300002)(8936002)(7416002)(76116006)(91956017)(66946007)(64756008)(66446008)(66476007)(66556008)(8676002)(54906003)(2906002)(83380400001)(38070700005)(33656002)(86362001)(122000001)(38100700002)(36756003)(71200400001)(6512007)(26005)(6486002)(316002)(6916009)(53546011)(2616005)(478600001)(41300700001)(6506007)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C476A83EB465141971C742117816A1A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2565
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b50f3197-f1e3-4823-c47a-08da6af4a49b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PodVsvsUq6rWty3ZZcas74LVVLlZ9F3CWUtP94uUQOrD/fwNNxkIIf5Sy0mk1Ur08bf2zo0cpikjySFeN2BsGyrCvic4z0x/SN0Bz/zbpWQUu0W8NoZLWUe01GYe6di150a6nuvYz5ZYWMeIYQkXjukglUPyPBv+FlZxQYTQ5n64b6fnTVsTIaAekSmcElgT+atCwiPR+Swwrbwjucxft4ZrruvFxN5cUwtQS02qfpU0b6hnmnNCEWF4xVkRg4uD+x/tkHxQTgPixY0sCI/umxOZlxR5y8cSOKNz32t9/SsRhq2xu6Yd5owJnEjWMZfvUagjvg6Lu0jv0TMsZuHosGPh2vKf67etyhbR87Pun9pDgDhD9nHxTldQA1NY8WZ4gnAUm012dgguorrPf9/BPKeKJXO/wUWSYT3jKL4nPVMhGWxeCRuNIC4TXkXeH34tvz7hTFbPGXV0k2BObJL/QAw6Ko6Xy0x8Q3c1785wwkePQ4ukfnLcCiXVrebAaGF3fN+odQtgZvWKRlZaBBDTO/KJc0wPLMtsaTTnmT68QpdKS95/BtIerDVQyLORNXkaYkr0/XzCreGBB5Ql64dlLEHh1ZBjQJDpwFwBcNmK1gp9efgpinQZDY3odsxb1PROf5rYm5EClUD9d5hJ/b+0ngg87yFqbU9uMLbVM0Le1yxivJeOmHYXY1ZHsg8qiPM81fx4iYDT5m+6kahYYkT75/Qor+28k7O9mYgGnxuhkG5nsgVOrMSsEooNiBVnmB1ZJM/dXEBfojSvajUUar45W5YulKrjahPCf527BjAxDk4xls1pDHbSAuBKY5IlAOTt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(46966006)(36840700001)(6512007)(316002)(356005)(81166007)(82740400003)(54906003)(82310400005)(36860700001)(4326008)(40480700001)(8676002)(70586007)(41300700001)(2906002)(33656002)(40460700003)(478600001)(83380400001)(70206006)(86362001)(336012)(2616005)(8936002)(107886003)(186003)(6862004)(36756003)(26005)(6506007)(53546011)(5660300002)(47076005)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 08:40:28.9246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 219a6269-7cd6-498e-30a9-08da6af4aa74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4349

SGkgSnVsaWVuLA0KDQoNCj4gT24gMjAgSnVsIDIwMjIsIGF0IDE5OjQ0LCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxs
QGFtYXpvbi5jb20+DQo+IA0KPiBtb3ZlIGl0IHRvIEtjb25maWcuDQo+IA0KPiBUaGUgZGVmaW5l
IENPTkZJR19ET01BSU5fUEFHRSBpbmRpY2F0ZXMgd2hldGhlciB0aGUgYXJjaGl0ZWN0dXJlIHBy
b3ZpZGUNCj4gaGVscGVycyB0byBtYXAvdW5tYXAgYSBkb21haW4gcGFnZS4gUmVuYW1lIGl0IHRv
IHRoZSBkZWZpbmUgdG8NCg0KTWF5YmUg4oCcdGhlIGRlZmluZSB0b+KAnSBjYW4gYmUgcmVtb3Zl
ZCBpbiB0aGlzIHNlbnRlbmNlIG9yIGl0IG5lZWRzIHNvbWUgcmVwaHJhc2luZy4NCg0KPiBDT05G
SUdfQVJDSF9NQVBfRE9NQUlOX1BBR0Ugc28gaXQgaXMgY2xlYXJlciB0aGF0IHRoaXMgd2lsbCBu
b3QgcmVtb3ZlDQo+IHN1cHBvcnQgZm9yIGRvbWFpbiBwYWdlICh0aGlzIGlzIG5vdCBhIGNvbmNl
cHQgdGhhdCBYZW4gY2FuJ3QgZ2V0DQo+IGF3YXkgd2l0aCkuDQo+IA0KPiBUYWtlIHRoZSBvcHBv
cnR1bml0eSB0byBtb3ZlIENPTkZJR19NQVBfRE9NQUlOX1BBR0UgdG8gS2NvbmZpZyBhcyB0aGlz
DQo+IHdpbGwgc29vbiBiZSBuZWNlc3NhcnkgdG8gdXNlIGl0IGluIHRoZSBNYWtlZmlsZS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQoNCldp
dGggdGhpcyBmaXhlZDoNClJldmlld2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5t
YXJxdWlzQGFybS5jb20+ICNhcm0gcGFydA0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IC0t
LS0NCj4gICAgQ2hhbmdlcyBpbiB2MjoNCj4gICAgICAgIC0gTmV3IHBhdGNoDQo+IC0tLQ0KPiB4
ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAxICsNCj4geGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2NvbmZpZy5oIHwgMSAtDQo+IHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgICAg
ICAgICB8IDIgKy0NCj4geGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgIHwgMSArDQo+
IHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jb25maWcuaCB8IDEgLQ0KPiB4ZW4vY29tbW9uL0tj
b25maWcgICAgICAgICAgICAgICAgfCAzICsrKw0KPiB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3Bh
Z2UuaCAgICAgfCA2ICsrKy0tLQ0KPiA3IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBi
L3hlbi9hcmNoL2FybS9LY29uZmlnDQo+IGluZGV4IGJlOWVmZjAxNDEyMC4uMzNlMDA0ZDcwMmJm
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiArKysgYi94ZW4vYXJjaC9h
cm0vS2NvbmZpZw0KPiBAQCAtMSw2ICsxLDcgQEANCj4gY29uZmlnIEFSTV8zMg0KPiAJZGVmX2Jv
b2wgeQ0KPiAJZGVwZW5kcyBvbiAiJChBUkNIKSIgPSAiYXJtMzIiDQo+ICsJc2VsZWN0IEFSQ0hf
TUFQX0RPTUFJTl9QQUdFDQo+IA0KPiBjb25maWcgQVJNXzY0DQo+IAlkZWZfYm9vbCB5DQo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmggYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gaW5kZXggNjZkYjYxOGIzNGU3Li4yZmFmYjlmMjI4
M2MgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWcuaA0KPiAr
KysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gQEAgLTEyMiw3ICsxMjIs
NiBAQA0KPiANCj4gI2lmZGVmIENPTkZJR19BUk1fMzINCj4gDQo+IC0jZGVmaW5lIENPTkZJR19E
T01BSU5fUEFHRSAxDQo+ICNkZWZpbmUgQ09ORklHX1NFUEFSQVRFX1hFTkhFQVAgMQ0KPiANCj4g
I2RlZmluZSBGUkFNRVRBQkxFX1ZJUlRfU1RBUlQgIF9BVCh2YWRkcl90LDB4MDIwMDAwMDApDQo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+IGlu
ZGV4IDkzMTFmMzUzMDA2Ni4uN2E3MjJkNmM4NmM2IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9h
cm0vbW0uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPiBAQCAtMzcxLDcgKzM3MSw3IEBA
IHZvaWQgY2xlYXJfZml4bWFwKHVuc2lnbmVkIGludCBtYXApDQo+ICAgICBCVUdfT04ocmVzICE9
IDApOw0KPiB9DQo+IA0KPiAtI2lmZGVmIENPTkZJR19ET01BSU5fUEFHRQ0KPiArI2lmZGVmIENP
TkZJR19BUkNIX01BUF9ET01BSU5fUEFHRQ0KPiAvKg0KPiAgKiBQcmVwYXJlIHRoZSBhcmVhIHRo
YXQgd2lsbCBiZSB1c2VkIHRvIG1hcCBkb21oZWFwIHBhZ2VzLiBUaGV5IGFyZQ0KPiAgKiBtYXBw
ZWQgaW4gMk1CIGNodW5rcywgc28gd2UgbmVlZCB0byBhbGxvY2F0ZSB0aGUgcGFnZS10YWJsZXMg
dXAgdG8NCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2
L0tjb25maWcNCj4gaW5kZXggNmJlZDcyYjc5MTQxLi42YTc4MjVmNGJhM2MgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+
IEBAIC04LDYgKzgsNyBAQCBjb25maWcgWDg2DQo+IAlzZWxlY3QgQUNQSV9MRUdBQ1lfVEFCTEVT
X0xPT0tVUA0KPiAJc2VsZWN0IEFDUElfTlVNQQ0KPiAJc2VsZWN0IEFMVEVSTkFUSVZFX0NBTEwN
Cj4gKwlzZWxlY3QgQVJDSF9NQVBfRE9NQUlOX1BBR0UNCj4gCXNlbGVjdCBBUkNIX1NVUFBPUlRT
X0lOVDEyOA0KPiAJc2VsZWN0IENPUkVfUEFSS0lORw0KPiAJc2VsZWN0IEhBU19BTFRFUk5BVElW
RQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2NvbmZpZy5oIGIveGVu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+IGluZGV4IDA3YmNkMTU4MzE0Yi4uZmJj
NGJiMzQxNmJkIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vY29uZmln
LmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+IEBAIC0yMiw3
ICsyMiw2IEBADQo+ICNkZWZpbmUgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NF
U1MgMQ0KPiAjZGVmaW5lIENPTkZJR19ESVNDT05USUdNRU0gMQ0KPiAjZGVmaW5lIENPTkZJR19O
VU1BX0VNVSAxDQo+IC0jZGVmaW5lIENPTkZJR19ET01BSU5fUEFHRSAxDQo+IA0KPiAjZGVmaW5l
IENPTkZJR19QQUdFQUxMT0NfTUFYX09SREVSICgyICogUEFHRVRBQkxFX09SREVSKQ0KPiAjZGVm
aW5lIENPTkZJR19ET01VX01BWF9PUkRFUiAgICAgIFBBR0VUQUJMRV9PUkRFUg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+IGluZGV4IDQx
YTY3ODkxYmNjOC4uZjFlYTMxOTljOGViIDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL0tjb25m
aWcNCj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+IEBAIC0yNSw2ICsyNSw5IEBAIGNvbmZp
ZyBHUkFOVF9UQUJMRQ0KPiBjb25maWcgQUxURVJOQVRJVkVfQ0FMTA0KPiAJYm9vbA0KPiANCj4g
K2NvbmZpZyBBUkNIX01BUF9ET01BSU5fUEFHRQ0KPiArCWJvb2wNCj4gKw0KPiBjb25maWcgSEFT
X0FMVEVSTkFUSVZFDQo+IAlib29sDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L2RvbWFpbl9wYWdlLmggYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaA0KPiBpbmRleCBh
MTgyZDMzYjY3MDEuLjE0OWIyMTdiOTYxOSAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L2RvbWFpbl9wYWdlLmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmgNCj4g
QEAgLTE3LDcgKzE3LDcgQEANCj4gdm9pZCBjbGVhcl9kb21haW5fcGFnZShtZm5fdCBtZm4pOw0K
PiB2b2lkIGNvcHlfZG9tYWluX3BhZ2UobWZuX3QgZHN0LCBjb25zdCBtZm5fdCBzcmMpOw0KPiAN
Cj4gLSNpZmRlZiBDT05GSUdfRE9NQUlOX1BBR0UNCj4gKyNpZmRlZiBDT05GSUdfQVJDSF9NQVBf
RE9NQUlOX1BBR0UNCj4gDQo+IC8qDQo+ICAqIE1hcCBhIGdpdmVuIHBhZ2UgZnJhbWUsIHJldHVy
bmluZyB0aGUgbWFwcGVkIHZpcnR1YWwgYWRkcmVzcy4gVGhlIHBhZ2UgaXMNCj4gQEAgLTUxLDcg
KzUxLDcgQEAgc3RhdGljIGlubGluZSB2b2lkICpfX21hcF9kb21haW5fcGFnZV9nbG9iYWwoY29u
c3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGcpDQo+ICAgICByZXR1cm4gbWFwX2RvbWFpbl9wYWdlX2ds
b2JhbChwYWdlX3RvX21mbihwZykpOw0KPiB9DQo+IA0KPiAtI2Vsc2UgLyogIUNPTkZJR19ET01B
SU5fUEFHRSAqLw0KPiArI2Vsc2UgLyogIUNPTkZJR19BUkNIX01BUF9ET01BSU5fUEFHRSAqLw0K
PiANCj4gI2RlZmluZSBtYXBfZG9tYWluX3BhZ2UobWZuKSAgICAgICAgICAgICAgICBfX21mbl90
b192aXJ0KG1mbl94KG1mbikpDQo+ICNkZWZpbmUgX19tYXBfZG9tYWluX3BhZ2UocGcpICAgICAg
ICAgICAgICAgcGFnZV90b192aXJ0KHBnKQ0KPiBAQCAtNzAsNyArNzAsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgKl9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChjb25zdCBzdHJ1Y3QgcGFnZV9pbmZv
ICpwZykNCj4gDQo+IHN0YXRpYyBpbmxpbmUgdm9pZCB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwo
Y29uc3Qgdm9pZCAqdmEpIHt9Ow0KPiANCj4gLSNlbmRpZiAvKiAhQ09ORklHX0RPTUFJTl9QQUdF
ICovDQo+ICsjZW5kaWYgLyogIUNPTkZJR19BUkNIX01BUF9ET01BSU5fUEFHRSAqLw0KPiANCj4g
I2RlZmluZSBVTk1BUF9ET01BSU5fUEFHRShwKSBkbyB7ICAgXA0KPiAgICAgdW5tYXBfZG9tYWlu
X3BhZ2UocCk7ICAgICAgICAgICBcDQo+IC0tIA0KPiAyLjMyLjANCj4gDQoNCg==

