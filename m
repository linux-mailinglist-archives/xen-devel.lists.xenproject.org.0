Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F85ACE9A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398632.639521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Az-0002iM-KF; Mon, 05 Sep 2022 09:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398632.639521; Mon, 05 Sep 2022 09:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Az-0002fk-Go; Mon, 05 Sep 2022 09:13:53 +0000
Received: by outflank-mailman (input) for mailman id 398632;
 Mon, 05 Sep 2022 09:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oV8Ay-00027Y-6O
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 09:13:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10050.outbound.protection.outlook.com [40.107.1.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e84796f-2cfb-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 11:13:51 +0200 (CEST)
Received: from FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::19)
 by DBBPR08MB5995.eurprd08.prod.outlook.com (2603:10a6:10:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 09:13:47 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::c4) by FR3P281CA0078.outlook.office365.com
 (2603:10a6:d10:1f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.11 via Frontend
 Transport; Mon, 5 Sep 2022 09:13:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 09:13:46 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 05 Sep 2022 09:13:46 +0000
Received: from c1accd49a49c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A1F87D9-480B-4A04-85A1-AF86C5352FB4.1; 
 Mon, 05 Sep 2022 09:13:35 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1accd49a49c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 09:13:35 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7380.eurprd08.prod.outlook.com (2603:10a6:150:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 09:13:33 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:13:33 +0000
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
X-Inumbo-ID: 0e84796f-2cfb-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RPZP91eSjyPJw8MGQV0ZkDhW//nL4DEsUnvyUnGc5mgVrYUix0r5ECz2i/wscsR6frbqm9TO9rO83ALOvfsBxBDZdTPRB0H/TULLNu2cS4Y8bR/vRbj2byjKfIz5Rvkep3CUdVX92Wx+MCiexv37YBgF6jqAAiGGkRX1+1F59NtNI7QdAQYAPw9/v3LSJb1LDzTM5hnb3hc2+ag13yBDUm0sJpenCHMw770VGKsVPQnGioifX7JnRyh8Q94prULqXYFooprBPDrnxUYSmDkrOO3twuCROwVuLvhRJLdA14NTk1CJDHX/E6C0TjH3wH7wPB4/ob75Ujfogxr+hNb+Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHCWcaXMERe3FXd6gIa8H2PVDggSzZSrakc57PwMIME=;
 b=kdLxXMbTmAY4EGI/Rj7UKEqvbELjTBAWOjuxscBIHKbiqBXbLNmyVhJrWGozwM+kVZdNdeS6xUv3RvahkSl7CZF5JtfR+g2hW5bCuXyDdYSmZjvwlg/22JwHGik+o8zyaCXEU9TLsI4HXpCiNLkV3hkxcwADjgwZjumxJTeDNxhaw8z4uN+9JuGS0cknCaIVmmChOV2U6BrM7YLprgaUKIlNu9DpzM6rrf6f26GJEnM1/FC0DqxOI3EtEZlGq4vMKsjYb6n7C97ZDMg3qYGzykW+7+/Lw4hoqJNjjQhzj6AP3A92rzVBoLnSFs5wNhinpUrY0TQgw8j2R3ahjpXK3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHCWcaXMERe3FXd6gIa8H2PVDggSzZSrakc57PwMIME=;
 b=Du55bZaqTpSXB1UNDmEdqFu33vUm0YQgT4A5kw6E6i9OgsnZrGeXPo9SmBzyjBk2P/SsE9UuladfhIGIWr0JZB/harKABzZjDOozGboVy6KFhrI+xXEACf555WNU/dNS2WWEwkK3AL69EjXghe2e4xYpAp6XoVCLPkDktkywwtY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: df63ac3dd498b0be
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKhFAFLjVm3llQURixmhBELy8C9mGTXWoEQ6AnUZ6H2U76o7Ag3iJaNlIlJe0ktXXI0XzEFRDPrrnb8eZGLffGmlVaFSPXaRufDyCj1fG8VK8yIhKzkCKWi2/Apesjv8UqtQNtJI91IITTbP7khgBMHPJ5csh9WCOjBqu0Iqgq03Y1KLMF6Z2XZig4n+e+0feO86ZpP36pOhOYXb2MN5vFybs3QkHeYKIvEWx4WlLPGF9a16o6y6/m0gZCAAhkLRpTJcJJ7cscrCR89kjd1bYHwDphFDwh/0hw0FOeHxRK0fkQchsADs0ozkfy9GQhs0UOy9XU6vnoB9ibImWxw+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHCWcaXMERe3FXd6gIa8H2PVDggSzZSrakc57PwMIME=;
 b=aBEFzQwtctzEtKC44HZB99CXYMrwVjniE1w1rdPSfTUrKqbLuez07lwmV+OxlAJYtjBSE7B7RfvEMxP9eE+yReY+prx8GoFjS5WKy5ozmp8RS+VHdPg3gWc0L8+FzhI7SepHKdQMQmR4YVtDxH2mJKfKA5NnAZ3nYyXVeJ8EnFu5EISggON2OYD/hhIcomF/Z9C059b1ahbqFezACdMB3/kY2j5NSOSmyIZEuWIouMgz1JrcFic8KlknpaqSEJHceHFOj8FWa1WM+b/QLgZls3iJRcDCMOSlcqX1x+3F9vlWxgkepLIaWbVdR1Bqi56GmSHXb4fr2Api7spTfxVOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHCWcaXMERe3FXd6gIa8H2PVDggSzZSrakc57PwMIME=;
 b=Du55bZaqTpSXB1UNDmEdqFu33vUm0YQgT4A5kw6E6i9OgsnZrGeXPo9SmBzyjBk2P/SsE9UuladfhIGIWr0JZB/harKABzZjDOozGboVy6KFhrI+xXEACf555WNU/dNS2WWEwkK3AL69EjXghe2e4xYpAp6XoVCLPkDktkywwtY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Robin Murphy <Robin.Murphy@arm.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Will Deacon
	<will@kernel.org>
Subject: Re: [PATCH v2 05/10] xen/arm: smmuv3: Remove the page 1 fixup
Thread-Topic: [PATCH v2 05/10] xen/arm: smmuv3: Remove the page 1 fixup
Thread-Index: AQHYvtEkIpWQpxSsvEmAc2g+NtYY8q3MxpiAgAPLTwA=
Date: Mon, 5 Sep 2022 09:13:32 +0000
Message-ID: <6FAAE725-9372-4A7F-BE3B-A61907EF3088@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
 <5f6f8233ee5c27082aec27dfc06c6f600f0c5d55.1662123432.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021616560.3931@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209021616560.3931@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3a769242-ea3d-4c95-0712-08da8f1ef033
x-ms-traffictypediagnostic:
	GV1PR08MB7380:EE_|VE1EUR03FT029:EE_|DBBPR08MB5995:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z84+DbJ1OHFna2Qaf8AzDYp9KD9wCE71UcqJ/lcc27URDBIIWI7bMDpFfdGHUJ04Pq9ouxM45TXemGBN70UXLn9FlO30onh+Op47u08PFNYm3YebYHhTkrkhBwHog6JuWrTrF8WTa84cQ+G/g7nesi85AQzag9ECCR4IfAIAy2adV3QNGmhG1WNZvJoEGw8p3GfN0Q6PYFzJeQNnw6ufHOJyadTsZU0czIwge5n3rzSNgvYeiLQGTGllAnrFhhJGJWpfbXw1KNBTPuLxEKUqMnj3fzUWMpH3MoXgZSmEIY3SfOXlJCGo8vu/7gtE41DncghxZR4KvUGFR1iU57sHRl2VseQFDd//avtDhzEDlq+pHgOz+W1m1IY81OIBOqJvnMF5nEHTpPqYSx/yrQqeb2dpSV/XQDGOZwAg0TW+cLs+UWr/fgjfkRGG9Js0o38UmTVWBtAtTmXR/9gS6EBq2J1I14GbcOaNqLQenNHhWsoEn1eEP2QeNdqTba4eXpsKFo0ZK3DApZeGHh43CyPqJiV/WSg+nxWsfT9mxp3eK3zF2t9p6GWJUQ7oHEW36Yd17gAkxqr8OfrBFUbSax/8YzCs/tZb3S5bxPMY7lxm+6tRUifF87uhN2wawi7zxCx6ZqA5psvB4itJ1XFiMJiuZdbQazEPnrTRgzxbXQxiA6uynI+fwziehyP68ngvEmMHxfparXM8zOwARdVUE/06EZs805tV7Tce9ssoL28uKoVYzdG2DiXqTechvx83RNNO5QBxQZeGxwZ5urzp4ZMH00WXssRSs0tp7N7qlWcnu08=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(122000001)(66556008)(8676002)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(91956017)(2616005)(38100700002)(6486002)(41300700001)(71200400001)(186003)(26005)(6506007)(53546011)(54906003)(6512007)(6916009)(316002)(83380400001)(36756003)(2906002)(86362001)(33656002)(5660300002)(8936002)(478600001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <115CA7EE4AA58F42B478A21708AD0164@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7901fba8-fe78-43c8-96e6-08da8f1ee7ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4si/JyIVShrU470buEJM50ewP1YWXE+2KJzmMq9ZtQzdGpFre5Yd99+EKBLV4ZTABBXuSNk3c8Dc4WT7ojwAYjFN7A4jm/mJ4vmjU744HT2Qujn5ITCOWD8I52xwOiRgT3jTnWiMgLS/YNgLihkSjDZ4MqvTxn+3OJXzHmblPDcyQ1zgx1HffiJQ347nN6h/IMrj4YlVA1ETKdkU4MX4jjyY1+rDUGHXNv1JXOgPvKclgpQgKUD4811GGRBrI7keTHeI0Guq8nUT8QPvoUq4g0pkwZS16ep9IyXlvumnzkgHr9KkpAVVougjOZolLKYAxDXExw5GzdRDNAYhUFLvZhi4R8Be18G1+ZmuE5G6297V3VOuJEPo0NlxAOnd80BV7G6wdDUz5rBW+lGHwzKD9NnYs83ePzjvxJjqkoO7OODPWqTZKzuAThTh8awQOPWXWlric4C4nvTBgLcnvJrYF+HzGMk3AW6mjyDkZXdVOuIIQlX8f2dh27rRmrTg5ODqtwzUgmdFMUt1UG9KAt52X9N5qekV2eclYRD6gOrQQKOEsW4oEN3zv4r5+97+vvyCez28t+OlRX74hUM8ISL2kMitQ5LndRKPwjmeFPHUUzJltpPYPsi5m5yPgaw2Y3q6vZt9CB/FBU7ueDnFh9l9mX67iGh7up9DtrJbJNIKvVsJ7OevM8DzwiIfYcrakyj+Cr8qVvQyRk4qXAR0RDgrRWhQ/FX1WuEhe2AgQjkm0oaUra1+JYByU0wwflAN35nlHH2j6VX6LxsNK5/dqF+rPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(40470700004)(46966006)(83380400001)(4326008)(8676002)(336012)(47076005)(70586007)(70206006)(36860700001)(8936002)(6862004)(33656002)(5660300002)(107886003)(6506007)(53546011)(478600001)(26005)(6486002)(41300700001)(186003)(2616005)(86362001)(316002)(54906003)(82310400005)(40480700001)(40460700003)(6512007)(36756003)(81166007)(82740400003)(2906002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:13:46.6919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a769242-ea3d-4c95-0712-08da8f1ef033
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5995

Hi Stefano,

> On 3 Sep 2022, at 12:17 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Fri, 2 Sep 2022, Rahul Singh wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>=20
>> Backport Linux commit 86d2d9214880. This is the clean backport without
>> any changes.
>>=20
>> Since we now keep track of page 1 via a separate pointer that
>> already encapsulates aliasing to page 0 as necessary, we can remove
>> the clunky fixup routine and simply use the relevant bases directly.
>> The current architecture spec (IHI0070D.a) defines
>> SMMU_{EVENTQ,PRIQ}_{PROD,CONS} as offsets relative to page 1, so the
>> cleanup represents a little bit of convergence as well as just
>> lines of code saved.
>>=20
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Will Deacon <will@kernel.org>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 86d2d9214880
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v2:
>> - fix commit msg.
>> ---
>> xen/drivers/passthrough/arm/smmu-v3.c | 42 ++++++++++-----------------
>> xen/drivers/passthrough/arm/smmu-v3.h |  8 ++---
>> 2 files changed, 20 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 85ad066266..f5485a8a1c 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -235,15 +235,6 @@ static struct arm_smmu_option_prop arm_smmu_options=
[] =3D {
>> 	{ 0, NULL},
>> };
>>=20
>> -static inline void __iomem *arm_smmu_page1_fixup(unsigned long offset,
>> -						 struct arm_smmu_device *smmu)
>> -{
>> -	if (offset > SZ_64K)
>> -		return smmu->page1 + offset - SZ_64K;
>> -
>> -	return smmu->base + offset;
>> -}
>> -
>> static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>> {
>> 	return container_of(dom, struct arm_smmu_domain, domain);
>> @@ -1578,6 +1569,7 @@ static int arm_smmu_dt_xlate(struct device *dev,
>> /* Probing and initialisation functions */
>> static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>> 				   struct arm_smmu_queue *q,
>> +				   void __iomem *page,
>> 				   unsigned long prod_off,
>> 				   unsigned long cons_off,
>> 				   size_t dwords, const char *name)
>> @@ -1606,8 +1598,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu=
_device *smmu,
>> 			 1 << q->llq.max_n_shift, name);
>> 	}
>>=20
>> -	q->prod_reg	=3D arm_smmu_page1_fixup(prod_off, smmu);
>> -	q->cons_reg	=3D arm_smmu_page1_fixup(cons_off, smmu);
>> +	q->prod_reg	=3D page + prod_off;
>> +	q->cons_reg	=3D page + prod_off;
>=20
> In the original patch it was:
>=20
> -	q->prod_reg	=3D arm_smmu_page1_fixup(prod_off, smmu);
> -	q->cons_reg	=3D arm_smmu_page1_fixup(cons_off, smmu);
> +	q->prod_reg	=3D page + prod_off;
> +	q->cons_reg	=3D page + cons_off;
>=20
> Specifically the second line seems to be wrong here?

Yes you are right I somehow miss that . I will fix that.

Regards.
Rahul


