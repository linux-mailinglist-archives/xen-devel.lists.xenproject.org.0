Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B557CAE9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372723.604632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVdv-0004CK-Eu; Thu, 21 Jul 2022 12:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372723.604632; Thu, 21 Jul 2022 12:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVdv-0004A0-B4; Thu, 21 Jul 2022 12:51:03 +0000
Received: by outflank-mailman (input) for mailman id 372723;
 Thu, 21 Jul 2022 12:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FenC=X2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oEVdt-00049u-59
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:51:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5465f13-08f3-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 14:51:00 +0200 (CEST)
Received: from AM5PR0402CA0003.eurprd04.prod.outlook.com
 (2603:10a6:203:90::13) by DB8PR08MB3996.eurprd08.prod.outlook.com
 (2603:10a6:10:a5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Thu, 21 Jul
 2022 12:50:28 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::5c) by AM5PR0402CA0003.outlook.office365.com
 (2603:10a6:203:90::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 21 Jul 2022 12:50:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Thu, 21 Jul 2022 12:50:28 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 21 Jul 2022 12:50:28 +0000
Received: from e3b76a4cfdcc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E866791A-B2CD-41AF-8BD1-5E4E8D930282.1; 
 Thu, 21 Jul 2022 12:50:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3b76a4cfdcc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 12:50:16 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM9PR08MB7260.eurprd08.prod.outlook.com (2603:10a6:20b:433::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 21 Jul
 2022 12:50:15 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 12:50:15 +0000
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
X-Inumbo-ID: c5465f13-08f3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JZ4tybgaDFWjR2h7FS5aXI/5DQw2ID44lNqmiq/1vki4+8hBxI3hGXBE+Y35chFyssNbMHke1GV4Y9fonqJDcNwzLTV6JQV1ioEDSRxs3eL7KxYKaKaJNwIChPh/O8ZUXNH8mXZrKOJAX8FSKKjp0lW0Yax20B7mW+fuL09alJaIiHNhfLDwZj0m7109aZtcLztz1zVvx5gCP+Ce7KAi/usxS+pkyIl5s71V8qe4v85Q2pVJ73gC8OFqYf1qc1vU91kYtbAs83qCI/iOOnqtvY+9VuRt8RpVOsD5H40MT1f/DzTZezMGZXZCyKg0RA4uBcpq7NT6U/kNot3GE9o26w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeQr1vXptp6pTT09bPtp+3miZOJ5V5Uar/Aa96P3ZWw=;
 b=JppjC92jRvMVHJ/AZl/uy0w/+xMd42ZKEk0ner7XSvsjev2BJESCZ4a4H4EqDpsVa4MeaA7rSNgBwmgau1TbIOwKJaE59rqVYgg9/fWeK1DdRdhqYTkgwFJCBta7pjbwHtMYoDXE2QYCIpxXKL2VytxNmwUCjgo5ED96V+aYJ97H3t7p7Yo3PE8N74HhC29cen+M/Lh5hn2a8aafGslVMFW7fxxR7F26cWBgKM0z0G0mjf3DdsCgviY+dKhPhJaKweCrK57CKysGVFiHp141BV3+KiDDynFG42wUeRXO8/LA/9ulG8lLiGOaoPDPMrbSF0LsqVCuWvbCeXUNa5YsmA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeQr1vXptp6pTT09bPtp+3miZOJ5V5Uar/Aa96P3ZWw=;
 b=gd6TxM0OsdLMnYxev+IF2KpEqxCXkcxug5ioLxU3cr3XLj/5ePtid9+2ToyrLl5ID96RkaJjl8FYwWyVLpsUibENQ5LS9EcBKkpjMW7VZsjXQVzh8+n1/wd0qddGt2+2PsWY7NZdcXK0qGFH1z7ogl8HiRIDeMEWkXnvNvNYozE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9050cf5f9b421452
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+5WhtA736SOS4vifFKTKOaiw0Edt9YOz86yXKSjBoRJEnVlAxLCjqiZUEdYgrsvznnch3nxRkYszyDIrJQkfnEi7yMfwi70Ul3Xr7xXws53/rqlHtGp5vBI5htVaWi1LIQ1ra4o9TyrxE5leA37e+efWHt27iQmc7B+M7CrNbxOsRv6ayaKmSxgr6HXEw+jeKLK4CDRYcTYriZ9gxW0Hv5j2j6i6mmTO3I6+G7o3oRtPAR/i2UyzXlKos+rkCYtdRfaX0zOT5S3E/KKeFPFuqLhBrGHrvTz/m66dyOirTox9Ttngc1XkeBfPE/cLmU5TVufTjbijiSpeUhgCtBoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeQr1vXptp6pTT09bPtp+3miZOJ5V5Uar/Aa96P3ZWw=;
 b=YiWMO7U+CLAx0/NIsvg7j8/Vvzo1qzd5g+XQAKbVfipPQuA9glqZ2hBGNoxLV8usqDBZ1OmQ3Vy5Q6OBl1/YoAAriJqaCTbKev+vc+NvP9pPwCN4nUEJmjlMbssN2l13vXR3evnTnoBk+a3brPPbRTJkBDqY+Vrk9nrLYnHQAG1PLwJSX7H/n5jm2Ip1ID6iI9AaC+BUii2Oy9/l751LWg/B/tyc4VOw5wM7liX5DXa645FoBaJY/g1Bg+kHAqpCVn07gfmrea39Mjw5Et6NN0IoND8mK2iaYeLUF3NvyUA8GM7S4cijglolRv8nnsHXhqPWJzc47sxnotrtmCO8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeQr1vXptp6pTT09bPtp+3miZOJ5V5Uar/Aa96P3ZWw=;
 b=gd6TxM0OsdLMnYxev+IF2KpEqxCXkcxug5ioLxU3cr3XLj/5ePtid9+2ToyrLl5ID96RkaJjl8FYwWyVLpsUibENQ5LS9EcBKkpjMW7VZsjXQVzh8+n1/wd0qddGt2+2PsWY7NZdcXK0qGFH1z7ogl8HiRIDeMEWkXnvNvNYozE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index:
 AQHYhkXaSSR0QDc2DUiowhnmyNd/Sq1bgqiAgB3xuACAAai8gIAA1/CAgAA2U4CAAAT8AIAABuwAgAAKeYCAAAnjAIAAC4AAgAAEsgCACtZcgIAAFXWAgAGspoA=
Date: Thu, 21 Jul 2022 12:50:15 +0000
Message-ID: <99D4D342-5DF7-4F85-A311-4D03967D77DB@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
In-Reply-To: <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e2c31173-831e-424a-3f8b-08da6b1796e3
x-ms-traffictypediagnostic:
	AM9PR08MB7260:EE_|AM5EUR03FT023:EE_|DB8PR08MB3996:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tqWocHbXjJFBY0iYXz28Z4XlmqXDziNnFF/1602ZD6I9mjYPW2ZCT53YYtdsNAkA70NSzdARelnkH/p0UFcBOH3Gto8lWg78BS3HJ0hM0D6CTeligOyNUvWrT4zj0djQSEApIXoFY/oM+w+2o5bAiJmsbP5w03fFpRHtCJUQQorDphsqKR5M846FC/waqshjvsbqMqICCVwrOQfRU3qDBuDiFcajldg2bJK6E3wk67DeAYNqqYR5r1GF1qnUESdDS54XA0aN6S5hctUZlXi4wNHnilq+twGWPtCOexzBFzRGmw4PeW0pqBOsVCgyVn74uJoNARHpL2O44vI+9rvIb/u0Yx0IqCihuTOwx1QWaHhrZ3hs1xG2uuM+jtqlLBjBWRKb95rbFc+89L8CEVys0M19T3UH0XGg4Ne76u/xhghTXa2zr0iwBRKjGwmxqvI+L88cPvpH6rAxcGKxCnfeadhUyaK+5XKoAA64T9YN9VHFpJS9a5rRkRLtW2Hi04bOGBS7Oh+Ig1UNFbx1/xObb1gV1909wQwvmB31sQofuKLbgVFqsSzxfzknStvqL9wNqQ9OEOAJ4kZrq6Dem2WJVyDkrPV9taIU4WNrqXVTTmpXQs8+jnVjTOmf2xVhV+mYMWcq94XeCON03mUQwNVWIBJ/sgUozG8XjUB1iGjgh/RmqHEqsbMmP1R5mOLK/BuT2yTNa7V1ATD0l2cOoLojGcH0ppySWQSGn24uzbTBHtkNojYH6yvmPGkmUDj4HN3iUGCm50eHFoJhaR4ZGEk3n4DdXaPIW1+hMZqb1BEiuQrmoXj5L7poHl0eJTxxZ+X68cVXm66J/yg4WPbRThjIXA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(316002)(83380400001)(38070700005)(91956017)(38100700002)(71200400001)(186003)(53546011)(478600001)(2616005)(6506007)(6486002)(6512007)(8676002)(41300700001)(66446008)(66946007)(4326008)(122000001)(64756008)(6916009)(54906003)(66476007)(33656002)(8936002)(76116006)(66556008)(5660300002)(2906002)(86362001)(26005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <061AC06C13E0B244807FBE5EC0F32DF0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7260
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79a4bdab-9e41-4c1f-c33a-08da6b178f0b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FIb4ZXAm1mjh61Gd/ZxGpqaD2MBgCAF/1OxLJkA1fxtPH/Csuz3vh1qzpW6mpPeKsbkeH6SjT/MJ04qN4HpPNIJ9PmZ47+E83r4jWQCi3f+K6aBwkQsAPyA1bWFI8F8jemFkVmet0jjFuuwZPHt/sOea6QQeSREnDhlIYGXqveGPkDYaTta5LpeeaZkUCxeGqsrVueAKJxIEfdwAGlmGN0OSw2Nn4C83b21QlaG4WueWRMoRT33Lk9Ilk4zk6t9eOeAf3bzDmPVB5rVHi4GCvY0KKn2E8FcbmwYqZ7Z3ErTkvEDyRqrRXrted4bSVGmHYyWNW7nfttbBL4IuzsL8cdFfmtXV6s95sP81t43RD61P1PUXxQFykyLF/C3HPF9+Uhv+23F59QJ7OR5MFnDkVJNSBwO6lpW0Ni5hMJBTJOY5qg9vkrxevVvxCy3XFMaR9EAgU9a+rrLDHGxLm3PECqSz1P+RpN2emxa76mELKxOOLKNy1SC9VT3zLLFFbLsGNGpURuxWx6HxFt5BdG7BJAxFeF63uhkBh2rs2xoDEVn628shkVg4RzzGwYmAvIidZfT02IADtrDRGDpXZo/WnGXqyX9Fl36ai5lP04vesMM36M5RLvHQb0WPTqeauoen21vDaD4nA4yaChOAPZqaigDAsfG0a9wX0CXZ7TkzeudlpMrN0VOoYPUl4J4PgSyLNlHNioWgWRWrT05v8cw9r8BvHyg5gxV8n9cfyxRZx/xHUGjOOuWrJ54vEt9jutPOYKMWxDUiuAJDqbr05RqO3l1GNHEcXF70NEq/gvN7B/DrfvS9GxWAkuzNYYmRf+oX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966006)(36840700001)(40470700004)(2616005)(186003)(6512007)(26005)(47076005)(6486002)(41300700001)(5660300002)(478600001)(86362001)(36860700001)(40480700001)(81166007)(336012)(83380400001)(54906003)(36756003)(8676002)(6506007)(8936002)(33656002)(82310400005)(4326008)(316002)(6862004)(2906002)(82740400003)(356005)(70586007)(40460700003)(53546011)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 12:50:28.5616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c31173-831e-424a-3f8b-08da6b1796e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3996

SGkgSnVsaWVuLA0KDQo+IE9uIDIwIEp1bCAyMDIyLCBhdCAxMjoxNiBwbSwgSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+IE9uIDIwLzA3
LzIwMjIgMTA6NTksIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+IE9uIDEzIEp1bCAyMDIyLCBhdCAx
OjI5IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiAN
Cj4+PiANCj4+PiBPbiAxMy8wNy8yMDIyIDEzOjEyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0K
Pj4+Pj4gT24gMTMgSnVsIDIwMjIsIGF0IDEyOjMxLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4+Pj4+PiBJIGNhbid0DQo+Pj4+Pj4gc2VlIHdoeSBpdCB3b3VsZCBiZSB3
cm9uZyB0byBoYXZlIGEgbW9yZSB0aWdodCBsaW1pdCBvbiBzdGF0aWMgcG9ydHMNCj4+Pj4+PiB0
aGFuIG9uIHRyYWRpdGlvbmFsICgiZHluYW1pYyIpIG9uZXMuIEV2ZW4gaWYgb25seSB0byBtYWtl
IHN1cmUgc28NCj4+Pj4+PiBtYW55IGR5bmFtaWMgb25lcyBhcmUgbGVmdC4NCj4+Pj4+IA0KPj4+
Pj4gVGhpcyBpcyBzaW1pbGFyIHRvIFhlbiBmb3JiaWRkaW5nIHRvIGNsb3NlIGEgc3RhdGljIHBv
cnQ6IGl0IGlzIG5vdCB0aGUgaHlwZXJ2aXNvciBidXNpbmVzcyB0byBjaGVjayB0aGF0IHRoZXJl
IGFyZSBlbm91Z2ggZXZlbnQgY2hhbm5lbCBwb3J0cyBmcmVlZCBmb3IgZHluYW1pYyBhbGxvY2F0
aW9uLg0KPj4+PiBPbiBvdGhlciBzaWRlIHdlIG5lZWQgdG8gYmUgY2F1dGlvdXMgbm90IHRvIGFk
ZCB0b28gbXVjaCBjb21wbGV4aXR5IGluIHRoZSBjb2RlIGJ5IHRyeWluZyB0byBtYWtlIHRoaW5n
cyBhbHdheXMgbWFnaWNhbGx5IHdvcmsuDQo+Pj4+IElmIHlvdSB3YW50IFhlbiB0byBiZSBhY2Nl
c3NpYmxlIHRvIG5vbiBleHBlcnQgYnkgbWFnaWNhbGx5IHdvcmtpbmcgYWxsIHRoZSB0aW1lLCB0
aGVyZSB3b3VsZCBiZSBhIGxvdCBvZiB3b3JrIHRvIGRvLg0KPj4+IA0KPj4+IEl0IGlzIG5vdCBj
bGVhciB0byBtZSB3aGV0aGVyIHlvdSBhcmUgcmVmZXJyaW5nIHRvIGEgZGV2ZWxvcHBlciBvciBh
ZG1pbiBoZXJlLg0KPj4+IA0KPj4+IE9uIHRoZSBhZG1pbiBzaWRlLCB3ZSBuZWVkIHRvIG1ha2Ug
c3VyZSB0aGV5IGhhdmUgYW4gZWFzeSB3YXkgdG8gY29uZmlndXJlIGV2ZW50IGNoYW5uZWxzLiBP
bmUga25vYiBpcyBhbHdheXMgZ29pbmcgdG8gZWFzaWVyIHRoYW4gdHdvIGtub2JzLg0KPj4+IA0K
Pj4+IE9uIHRoZSBkZXZlbG9wcGVyIHNpZGUsIHRoaXMgY291bGQgYmUgcmVzb2x2ZWQgYnkgYmV0
dGVyIGRvY3VtZW50YXRpb24gaW4gdGhlIGNvZGUvaW50ZXJmYWNlLg0KPj4+IA0KPj4+IENoZWVy
cywNCj4+IFRvIGNvbmNsdWRlIHRoZSBkaXNjdXNzaW9uLCBJZiBldmVyeW9uZSBhZ3JlZSBJIHdp
bGwgYWRkIHRoZSBiZWxvdyBwYXRjaCBvciBzaW1pbGFyIGluIHRoZSBuZXh0IHZlcnNpb24gdG8g
cmVzdHJpY3QgdGhlDQo+PiBtYXggbnVtYmVyIG9mIGV2dGNobiBzdXBwb3J0ZWQgYXMgc3VnZ2Vz
dGVkLg0KPiANCj4gSSBhbSBmaW5lIGlmIHRoZSBsaW1pdCBmb3IgZG9tVSBpcyBmaXhlZCBieSBY
ZW4gZm9yIG5vdy4gSG93ZXZlciwgZm9yIGRvbTAsIDQwOTYgaXMgcG90ZW50aWFsbHkgdG9vIGxv
dyBpZiB5b3UgaGF2ZSBtYW55IFBWIGRyaXZlcnMgKGVhY2ggYmFja2VuZCB3aWxsIG5lZWQgYSBm
ZXcgZXZlbnQgY2hhbm5lbHMpLiBTbyBJIGRvbid0IHRoaW5rIHRoaXMgd2FudHMgdG8gYmUgZml4
ZWQgYnkgWGVuLg0KQWdyZWUuDQo+IA0KPiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdlIHdhbnQg
dG8gbGltaXQgdGhlIG51bWJlciBvZiBldmVudCBjaGFubmVscyBmb3IgZG9tMC4gQnV0IGlmIHlv
dSB3YW50IHRvLCB0aGVuIHRoaXMgd2lsbCBoYXZlIHRvIGJlIGRvbmUgdmlhIGEgY29tbWFuZCBs
aW5lIG9wdGlvbiAob3IgZGV2aWNlLXRyZWUgcHJvcGVydHkpLg0KDQpXZSBuZWVkIHRvIHN1cHBv
cnQgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsIGZvciBkb20wIGFsc28sIGluIHRoYXQgY2FzZSwg
d2UgbmVlZCB0byByZXN0cmljdCB0aGUgbWF4IG51bWJlciBvZiBldnRjaG4gZm9yIGRvbTAgdG8g
bWl0aWdhdGUgdGhlIHNlY3VyaXR5IGlzc3VlLg0KSSBhbSBva2F5IHdpdGggaW50cm9kdWNpbmcg
dGhlIG5ldyBjb21tYW5kIGxpbmUgb3B0aW9uICJtYXhfZXZlbnRfY2hhbm5lbHPigJ0gZm9yIGRv
bTAgYW5kIHNldHRpbmcgdGhlIGRlZmF1bHQgdmFsdWUgdG8gNDA5Ni4NCg0KSWYgdGhlIGFkbWlu
IHNldCB0aGUgdmFsdWUgZ3JlYXRlciB0aGFuIDQwOTYgKG9yIHdoYXQgd2UgYWdyZWVkIG9uKSBh
bmQgc3RhdGljIGV2ZW50IGNoYW5uZWwgc3VwcG9ydCBpcyBlbmFibGVkIHdlIHdpbGwgcHJpbnQg
dGhlIHdhcm5pbmcgdG8gdGhlIHVzZXIgcmVsYXRlZCB0byBmaWxsDQp0aGUgaG9sZSBpc3N1ZSBm
b3IgRklGTyBBQkkuDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo=

