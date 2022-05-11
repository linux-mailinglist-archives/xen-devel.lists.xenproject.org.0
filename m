Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526DD522F2B
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 11:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326649.549224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noiUd-0003xY-1E; Wed, 11 May 2022 09:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326649.549224; Wed, 11 May 2022 09:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noiUc-0003vk-UK; Wed, 11 May 2022 09:18:50 +0000
Received: by outflank-mailman (input) for mailman id 326649;
 Wed, 11 May 2022 09:18:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1noiUb-0003ve-QB
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 09:18:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d6965f0-d10b-11ec-a406-831a346695d4;
 Wed, 11 May 2022 11:18:49 +0200 (CEST)
Received: from AM6P191CA0074.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::15)
 by AM6PR08MB4881.eurprd08.prod.outlook.com (2603:10a6:20b:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 09:18:38 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::a0) by AM6P191CA0074.outlook.office365.com
 (2603:10a6:209:8a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Wed, 11 May 2022 09:18:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 09:18:37 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 11 May 2022 09:18:37 +0000
Received: from 0ec2e36efa4e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E81E145-A3E0-40B5-992C-6C732D4066A8.1; 
 Wed, 11 May 2022 09:18:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ec2e36efa4e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 09:18:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 09:18:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 09:18:25 +0000
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
X-Inumbo-ID: 5d6965f0-d10b-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aQzDafCxsqlVqbVQ/V/8SCQdcoHqPW1cdxlhk8FOhhSCDTaBS9wJ8RXFJqeMaZJal5V6OPBxp3L2cIfJbP9ywRBkihDseK+wWxyeI7n5lnKAC1h+GLnG+ybLNSFZ4laNddidOs5u/GTRgSgrcDZl8LvJu59IJRMztgsMBJ6DAxQUrY1PZXwVmWLrDW7H2ovkGZTGAyzT+qkI42a6F83yOVoJp3n+p9DudSqVCRvm7bYr4qB8OeetyjPzax/b3nyFJykaACZ0UhZjmogNGfGjqwdWmFmopRBj/TRDY4O/Rjvhf2lHtl3OwJ0OA4pt4i4qBc2RekcoP3owgdzD/2xuxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePBCqNEeabGU59QAtnTCYsTsnYeubd91RiznUWsbB58=;
 b=cU5LHTG5BjAKcs/uSfftMDbnAN+yhrO7LS+v5ArIv274pzZf99aTdpT/yy6wAwEFV76lGnIC3DqzMvZOwzOUcEayI14rTT57rUG6o0De++v+6bt9gQToT+UmSz0vgu3h8Za4icdDtIpnxueTdob2ld9nkOFlbm3NoMCB6rAiMTmLXfoMa723uU5D80FiKuEyg/f8W+c1PPEkaHy77c8wA/7gzmGbzNjXAZFwRdgqa2u403zt6diBnhiD2vJDSWicp+R6ZuZgkkBkG6uz9xX2ZpoHMUJSk5zuUd24kvOrMR+Ig8YUjivp+GRJ/o/nRwBHNSVdQ4b3JTvJorNrbXKDUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePBCqNEeabGU59QAtnTCYsTsnYeubd91RiznUWsbB58=;
 b=fUJEu3zkIcB5WQ+1n9ZHZePDRFZHNyBN0ng4OWuPRbQFf4+/Y9z8D83OPb4JCbbBBVXHO1+/TDaY3LoqlVjzc8svvTy1EqP+D/oHjpwFfPoZ4l8WJgTJc7ydxNaF6UFKgOUiB2nYjmDOS2YskyVV9fdPRXHPNbtei2u9mtyI3mE=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b952033f3314267
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZY/r5DakMKwYJEXNEwLm09tDCqB199hkOO3QRiB/hDtdGQ01l/LMalzHdUn8uNa2YXxVsKe3snnGDJq88Jt2CkhCkWgZAlvS7KdHp+9UmHBWlrV11qWWJ7BMyV37KORInxL1jx2wmi97ImKtYkOJ0VuivbmSqNy274CufjHpR0toU4pvu6842c/ESdK6WvzPwS6ZS96xBFi7KMVOwczhjq1PfV48uiPfTKBH6R2xAJQbHM5hL/Qvtc6LsZNje7LtHT0dt6pHO7l+sSsVln0mhwHUQZ1dI1plhcW3OM8yTTuvkpi62LAWS5ChmZp3VFxgWtWQogIblzVLL6UylCwTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePBCqNEeabGU59QAtnTCYsTsnYeubd91RiznUWsbB58=;
 b=bbL5LIkLffVQJo+b8G2C0ZXobNT3gqWWFcbW2yJwfmUv2AnMAgTNf8OvRmlL9ISxgiSDAFO17YFtgQLV9jgi4LmXANnKqNQV/dEM0D+sHvCQ7mJLrJw09N2YCra97BkZrZCy+eHl5rfsGu5XN2pZI7/FaGeA5iDcKJY0WfZrdTY5Ff2/tdgjjjEnVn4sOKAGwbiP3PX2Cocb3YLRahaxyqaDmQE6HCnCr4EMKrgCNYieSCRgXAqsxdlazkMoXND32y0JPs+FpK4oi6eNKr1HrAKa986wO98OvdAfZkIMeZMgRj1/Qiwq8e6kCwzRWnaZ4J+Ve9tcGHeTEkzyEfIA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePBCqNEeabGU59QAtnTCYsTsnYeubd91RiznUWsbB58=;
 b=fUJEu3zkIcB5WQ+1n9ZHZePDRFZHNyBN0ng4OWuPRbQFf4+/Y9z8D83OPb4JCbbBBVXHO1+/TDaY3LoqlVjzc8svvTy1EqP+D/oHjpwFfPoZ4l8WJgTJc7ydxNaF6UFKgOUiB2nYjmDOS2YskyVV9fdPRXHPNbtei2u9mtyI3mE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Luca Miccio <lucmiccio@gmail.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Topic: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Index:
 AQHYYBV7IqUb0ECYF0+NQ9CCVyUDtq0YVm2AgAABQwCAAP62gIAADosAgAACPoCAAAaAgIAAAkaA
Date: Wed, 11 May 2022 09:18:25 +0000
Message-ID: <9707ACA4-711A-4691-BA2A-FCDDAFFD9DE8@arm.com>
References:
 <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
 <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
 <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com>
 <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
In-Reply-To: <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d516f1d3-1bf9-492e-af65-08da332f3b54
x-ms-traffictypediagnostic:
	AM6PR08MB4070:EE_|AM5EUR03FT008:EE_|AM6PR08MB4881:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4881AD03B2DE83EF6FB67EB59DC89@AM6PR08MB4881.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oOvfSd4hnwRbAosFb1yulprkJQAw93s0/Qk6eTeE7oqmqWyk6pqEex0Cb8hU/Ra9uer6oYL8IzD08HdAEmfg6Pu5X9Q59OpwIodi7Uc1yNemZrZLz3qKjwFIx5Tb3348F6sic7mbr1K8bbUp0OVJAANBCFzxCpvFi3PuazmDG2x180QQAZ4DseUPYd2aaBSP2ZWRUPBwNiXC4xC/6uJGXiky29QlIFEOpTYX5U6Patz5TDN/S6ciwHgYSji8FmdPMYqoRP6PtJtyZdqhm+cGaPuiiWQN6lhcE7fR04pAcn0+L7/zP0g1U+8MYJvfOn3g2LDFJ7KOKXUXu89TcSIFS9GKoZB/bo4Irws2E7tsRbEcM1UfIKduMSQyxkxjg02tulJfKl4dtPsyHUNtoPOtK1aAL07NPepvEaxigXjHzt7L/rts9b6hXksdelReYNSsnaCk9RThJ7Ax/FqmA/Ou2Y5O5IWM42+PDga6XRJuVajmHMhsDrYBCACcpkdlxBKfpXIhrnE9yMxFPKMjcFgQs2verriZUPa1J5uKyCnLmM+iZbxXGTlR3ANtlMhKew08Lw2lpY2YnXyNWMSji3tvLn4iplcm6PAwSYU68YUUlnHKWre3eTFiVf0LAHDcJlZA931p195hE6prgNbsj0CRxWPP9YanrEy/+oqHDpyCBLkjT/gNGfalB7GPXJ8aNl5RvnqbGut1LqpiiQF1d3RTUF18hkIsi9ETC/O8xQIVmcqorzj0Kjv/squjHrO8E44p2HvmwsK6VRGqpv7dVbhsWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(2616005)(38100700002)(122000001)(91956017)(53546011)(36756003)(5660300002)(6506007)(83380400001)(38070700005)(8936002)(26005)(66446008)(508600001)(6486002)(64756008)(66476007)(316002)(66556008)(6512007)(76116006)(66946007)(6916009)(54906003)(8676002)(4326008)(71200400001)(2906002)(186003)(86362001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <33AED799D059CB4B9BDA01743889BE38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3802b8f2-a5fa-4fdb-697e-08da332f3409
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aqL+0n9nmr2RgCJeKy8zOkQVy781NJUAQN8NSVKcWEnuv+myWDsgvIyruYu4SHp179cglstlkMjNSQAtQq8+XfEd2dGjoexXbhekq6hlQUNLDfdCrrx9ERvcxRp1ztjDlM40Uk1DC5uEad3Y9yDzDk4HqxJlO+jbSrByQp+l+B/NY15QSYw4liupDf/4tQYJUo9vCKOQAxvmtbWZByhd3nQDFNEK1aSL8lfVUOXZXoG6emFAm3fUQOmvtXWIe1ycG5I6KGlft7oc/q+DFLLn8qJdKecozCjjmCmLnhH3vtrRP8s1XmrWxDtqYjMbxmch1qzWLTwC/wDD6pQGErAewmwH4Fyl/73qjYFdRqCMHH4gngaCXDyOkAwrxWLu7sQg8vG9fe/JyPslSuI0ES3P0Datc3lNG7oXLzfSpr/honTewBs0K5v+i4/u3MX6XaIa62Ma9c/cLGjJB55PbNEmlltASaZtIA/nDuZgHR6MjsCGxfuvj5/sEsXRPdzzfJczHv0jE/BWJrEspIOKR67YdlzQE4DHiVKtDJpdzt5F8lyFvwR+TSLhwVop3S61W/cYMTkvTIf0khKCe0fFFU0e40MWpfNZJ3q/MTSxQbqMxfJYB+RorLLHlrQ6yzmsI6ysHuQFfNmArzaEKiM77b2S2czmG2gl6P3J8VVH6KKTPbObbOUhn3T9/GeG/wUB76SqudtA+VEobz9Zxy+9u2PpxQ23ppOUn/h+MCagU01JlLU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(5660300002)(63350400001)(86362001)(186003)(6512007)(107886003)(82310400005)(2616005)(8936002)(70206006)(356005)(2906002)(40460700003)(63370400001)(4326008)(8676002)(336012)(83380400001)(6862004)(81166007)(70586007)(36860700001)(6506007)(6486002)(33656002)(53546011)(54906003)(508600001)(36756003)(316002)(47076005)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 09:18:37.7762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d516f1d3-1bf9-492e-af65-08da332f3b54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4881

SGkgSnVsaWVuLA0KDQo+IE9uIDExIE1heSAyMDIyLCBhdCAxMDoxMCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDExLzA1
LzIwMjIgMDk6NDYsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTEgTWF5IDIwMjIs
IGF0IDA5OjM4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+
PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+PiBPbiAxMS8wNS8yMDIyIDA4OjQ2LCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gMTAgTWF5IDIwMjIsIGF0IDE3OjM1LCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSGkgUmFodWwsDQo+Pj4+
PiANCj4+Pj4+IE9uIDEwLzA1LzIwMjIgMTc6MzAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+
PiArIHJjID0gZXZ0Y2huX2FsbG9jX3VuYm91bmQoJmFsbG9jKTsNCj4+Pj4+Pj4gKyBpZiAoIHJj
ICkNCj4+Pj4+Pj4gKyB7DQo+Pj4+Pj4+ICsgcHJpbnRrKCJGYWlsZWQgYWxsb2NhdGluZyBldmVu
dCBjaGFubmVsIGZvciBkb21haW5cbiIpOw0KPj4+Pj4+PiArIHJldHVybiByYzsNCj4+Pj4+Pj4g
KyB9DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyBkLT5hcmNoLmh2bS5wYXJhbXNbSFZNX1BBUkFNX1NU
T1JFX0VWVENITl0gPSBhbGxvYy5wb3J0Ow0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgcmV0dXJuIDA7
DQo+Pj4+Pj4+ICt9DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gc3RhdGljIGludCBfX2luaXQgY29uc3Ry
dWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+Pj4gY29uc3Qgc3RydWN0IGR0X2Rldmlj
ZV9ub2RlICpub2RlKQ0KPj4+Pj4+PiB7DQo+Pj4+Pj4+IEBAIC0zMjE0LDYgKzMyNDMsMTQgQEAg
c3RhdGljIGludCBfX2luaXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+
Pj4gaWYgKCByYyA8IDAgKQ0KPj4+Pj4+PiByZXR1cm4gcmM7DQo+Pj4+Pj4+IA0KPj4+Pj4+PiAr
IGlmICgga2luZm8uZG9tMGxlc3NfZW5oYW5jZWQgKQ0KPj4+Pj4+IEkgdGhpbmsgd2UgbmVlZCB0
byBkbyBzb21ldGhpbmcgbGlrZSB0aGlzIHRvIGZpeCB0aGUgZXJyb3IuDQo+Pj4+Pj4gaWYgKCBo
YXJkd2FyZV9kb21haW4gJiYga2luZm8uZG9tMGxlc3NfZW5oYW5jZWQgKQ0KPj4+Pj4+IHsNCj4+
Pj4+PiB9DQo+Pj4+PiANCj4+Pj4+IElzIHRoZXJlIGFueSB1c2UgY2FzZSB0byB1c2UgImRvbTBs
ZXNzX2VuaGFuY2VkIiB3aXRob3V0IGRvbTAgKG9yIGEgZG9tYWluIHNlcnZpY2luZyBYZW5zdG9y
ZWQpPw0KPj4+Pj4gDQo+Pj4+IEp1c3QgYmVpbmcgY3VyaW91cyBoZXJlIGJ1dCB3b3VsZCBpdCBl
dmVuIGJlIHBvc3NpYmxlIHRvIGhhdmUgbm9uIGRvbTAgZG9tYWluIHNlcnZpY2luZyB4ZW5zdG9y
ZWQgPw0KPj4+IA0KPj4+IFlvdSBjYW4gYnVpbGQgWGVuc3RvcmVkIGFnYWluc3QgbWluaS1vcyBh
bmQgY29uZmlndXJlIHRoZSBpbml0IHNjcmlwdCB0byBsYXVuY2ggeGVuc3RvcmVkIGFzIGEgZG9t
YWluLg0KPj4gU28gZG9tMCBpcyBub3QgbWFuZGF0b3J5IG9yIHNob3VsZCBtaW5pLW9zIGJlIHN0
YXJ0ZWQgYXMgRG9tMCBmb3IgdGhpcyB0byB3b3JrID8NCj4gDQo+IEluIG9yZGVyIHRvIGFsbG9j
YXRlIHRoZSBldmVudCBjaGFubmVsLCB5b3UgbmVlZCB0byBrbm93IHRoZSBJRCBvZiB0aGUgZG9t
YWluIHdoZXJlIFhlbnN0b3JlZCB3aWxsIHJ1bi4gU3RlZmFubydzIHBhdGNoIGlzIHJlbHlpbmcg
b24gWGVuc3RvcmVkIHRvIGJlIHJ1biBpbiBEb21haW4gMC4NCj4gDQo+IFRoaXMgd291bGQgbmVl
ZCB0byBiZSB1cGRhdGVkIGlmIHdlIHdhbnQgdG8gcnVuIGl0IGluIGEgc2VwYXJhdGUgZG9tYWlu
Lg0KDQpPayB0aGVuIERvbTAgaXMgbWFuZGF0b3J5IGF0IHRoZSBtb21lbnQsIEkgYW0gb2sgd2l0
aCB0aGF0Lg0KDQo+IA0KPj4+IA0KPj4+Pj4gSWYgbm90LCB0aGVuIEkgd291bGQgY29uc2lkZXIg
dG8gZm9yYmlkIHRoaXMgY2FzZSBhbmQgcmV0dXJuIGFuIGVycm9yLg0KPj4+PiBPbmUgd2F5IG9y
IGFuIG90aGVyIHdlIG5lZWQgdG8gc29sdmUgdGhlIGNyYXNoIGJ1dCBpZiBpdCBpcyBmb3JiaWRk
ZW4gd2UgbXVzdCBwcmV2ZW50IGNvbWluZyB0byB0aGlzIHN0ZXAgZWFybGllciBhcyBpdCBtZWFu
cyB0aGUgY29uZmlndXJhdGlvbiBpcyB3cm9uZy4NCj4+PiANCj4+PiBJIHRoaW5rIHRoaXMgc2hv
dWxkIGJlIGNoZWNrZWQgd2hlbiBwYXJzaW5nIHRoZSBjb25maWd1cmF0aW9uLg0KPj4gSWYgZG9t
MCBpcyBtYW5kYXRvcnkgeWVzLCB3ZSBzaG91bGQgc3RpbGwgbWFrZSBzdXJlIHRoYXQgdGhpcyBj
b2RlIGNhbm5vdCBiZSByZWFjaGVkIHNvIGFuIEFTU0VSVCB3b3VsZCBiZSBuaWNlIGhlcmUgYXQg
bGVhc3QgaW4gY2FzZSBzb21lb25lIHRyaWVzIHRvIGFjdGl2YXRlIHRoaXMgY29kZSB3aXRob3V0
IGRvbTAgKHdoaWNoIG1pZ2h0IGhhcHBlbiB3aGVuIHdlIHdpbGwgcHVzaCB0aGUgc2VyaWUgZm9y
IHN0YXRpYyBldmVudCBjaGFubmVscykuDQo+IA0KPiBJIGFtIGZpbmUgd2l0aCBhbiBBU1NFUlQo
KS4NCj4gDQo+IEFyZSB5b3Ugc2F5aW5nIHRoYXQgZG9tMGxlc3NfZW5oYW5jZWQgd2lsbCBiZSBz
ZXQgdG8gdHJ1ZSBmb3IgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsIHNlcmllcz8NCj4gDQo+IElm
IHllcywgdGhlbiBJIHRoaW5rIGRvbTBsZXNzX2VuaGFuY2VkIHdpbGwgbmVlZCB0byBiZSBhbiBl
bnVtIHNvIHdlIGtub3cgd2hhdCBwYXJ0IG9mIFhlbiBpcyBleHBvc2VkLg0KDQpObyBpdCB3b27i
gJl0LCB3ZSBqdXN0IG5lZWQgc29tZSBvZiB0aGUgY2hhbmdlcyBkb25lIGJ1dCB3aXRob3V0IHNl
dHRpbmcgZG9tMGxlc3NfZW5oYW5jZWQuDQpAUmFodWw6IGNhbiB5b3UgY29uZmlybS4NCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxs
DQoNCg==

