Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26E5B37D7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 14:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404291.646716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdF0-0003BN-Iu; Fri, 09 Sep 2022 12:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404291.646716; Fri, 09 Sep 2022 12:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdF0-000394-Fy; Fri, 09 Sep 2022 12:36:14 +0000
Received: by outflank-mailman (input) for mailman id 404291;
 Fri, 09 Sep 2022 12:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2S5y=ZM=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oWdEy-00038y-SW
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 12:36:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20050.outbound.protection.outlook.com [40.107.2.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fac15ec1-303b-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 14:36:09 +0200 (CEST)
Received: from FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::7) by
 DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Fri, 9 Sep 2022 12:36:04 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::d5) by FR0P281CA0059.outlook.office365.com
 (2603:10a6:d10:49::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.7 via Frontend
 Transport; Fri, 9 Sep 2022 12:36:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 12:36:03 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Fri, 09 Sep 2022 12:36:03 +0000
Received: from 93dd2d3e8483.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 139E0A66-68DB-423B-9300-F17BFF34992F.1; 
 Fri, 09 Sep 2022 12:35:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93dd2d3e8483.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 12:35:56 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DU0PR08MB8017.eurprd08.prod.outlook.com (2603:10a6:10:3e4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 12:35:54 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::cdd:acf1:e6c0:4687]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::cdd:acf1:e6c0:4687%4]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 12:35:54 +0000
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
X-Inumbo-ID: fac15ec1-303b-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jyvFhDnXKvNwkiSVW0TFm4cdvdIgRxXCj+8mXg1QbRiXHlkpR1ov89ceOf389FYT4g4XGwfJSb3YgFgsz99VGdBYBxnHXw1y9q7ITT5uxnerkJDjXjVTRlt51rpEDoymqGU5vLZ6nN987uNtCSQEjlAZvgqsS1tezlvecO360tnO0Y2nVsOq3aaSUuAHdT2Ar5lC1RGKvIWTONd96EYnbvc3mFMCGYNe+nf9idwMcPHoQxtbBLXIMxYqCb6tufysGsNbWNpguavUM64f6SYptD7Wp7gJm2cBn1q4lNyL6sHpbBx/oecswACWiYENRNqBbphS/ctwFJuVq+N4yjbi+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB4irmaGsLrNw968AkoqxufXa1FXjHqMsMSgbafPtVk=;
 b=U6yF+2nN1ivRe8wFyXWzjWmkXcLcJF0d5IbUbI3gZdt2cYCiexiRB3IYnBTbLbG5WcPm6yH1BSBI4RiHUam7mQBgCSkCtVWlRrLZXL1mnqbEIX2Fq2EbShN0UhnI4e7WQ386Gb0nOPINS3ZKQnSy9fw1RfC+0a/JDg8QYGXnPnC7WHupA3IXB9WxWzRhXiSik8nMKo6g/zLk/Fu7u6owKVCb+DmD8yDGVuNXXhYEU3uIvit5AFxqysl1OfKdDbiO7HxYdOw7m7mUQ9pXxA+7Fa6jIZZkSeQzb7ZwljUElAOeefSnLLl1ntGHwR0iwAL6R4HeAUd/aN+bnSbJT3M6GA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB4irmaGsLrNw968AkoqxufXa1FXjHqMsMSgbafPtVk=;
 b=uuGWEpL9T+xNAN6gdThLfJFm7GoXiVnvbNfpik2bFFe+gD/Yip6dMjrTsTmRLuoe4PwgxepNMeRFK/4eBjpPFxeaph3lCnxafqWlMzK1Tq6o81dYQ90EZ6jbIIXBGJIjJG0wD6AJq3tCr72C7Rycb9q0T7qQs3hTFXJ8YTjojSg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e753bcc4f752911b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klfzJL9WcoNSKIz+fLb+buPmGK9LJn5NiftrJdVDt6JSbyvn8Tr5COfOXjkHF34YYtcyblrC7ybvYmoKCkS0gHk8kBnGueN423lZG+xvGpoKo0pi3t2McFHfZE+EtJke/C8y4qw/2LX8zyYVbcf6E0TkiLCnUbINK0vAp45YbohepNKvWzJLkjLCMJUgjJntK7hY3CV/PLRyuqESovFnmwpb7qEEzF4eZPCtTjRfiAFulHM/rZqe4IuGZKylI8tUfR1SR/k9T27Zia2RTSIT7b1+mrFEAiReUxlBC+myYOic1pN5UKDpatLDFtxc3eaDEj3yG5OE+7blZA7QznqkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB4irmaGsLrNw968AkoqxufXa1FXjHqMsMSgbafPtVk=;
 b=Uo+PXX+PeZZNABMkQFtlhYJXerYcPJN3WNRHlEyg7/9INRmg8L0p4X//ELdFHgDqdpQxBWlyMpiaBBLNZ9XhM2tX+QWKv+kwmUIyM9BF6q0D2anORbTjBlCbeqBsKXKRDJrpKIxQ+9UKz3hUMu+qT6SXkWcSErmnyhuRnW/5oDfnyrI2/jdTYNXBHPcyWL/KN09kws2tIFr+EdsYYxTs9CdVjW86vP3zFVFZb4E9IpuYJaEOvexgFEvU1G5m/1l8Wkb6YZzbJTrVw5hHnRcFdwBoAHK7cppifoOzpwZQ2E/X0laPvuyj9hWCHFjEVmabAhD/R2kjeSujtbmiEA4Mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB4irmaGsLrNw968AkoqxufXa1FXjHqMsMSgbafPtVk=;
 b=uuGWEpL9T+xNAN6gdThLfJFm7GoXiVnvbNfpik2bFFe+gD/Yip6dMjrTsTmRLuoe4PwgxepNMeRFK/4eBjpPFxeaph3lCnxafqWlMzK1Tq6o81dYQ90EZ6jbIIXBGJIjJG0wD6AJq3tCr72C7Rycb9q0T7qQs3hTFXJ8YTjojSg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Penny Zheng
	<Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Topic: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Index: AQHYxC5uizhN+hjMF0m2RbBlUt+pVq3W1+wAgAAxHYA=
Date: Fri, 9 Sep 2022 12:35:54 +0000
Message-ID: <FBA398EE-B1AD-4394-A357-6DFF77E374D9@arm.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
 <20220908135513.1800511-8-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop>
 <0DD9A3DA-4677-46F4-A454-3EAC335443AB@arm.com>
 <34ae5402-799e-1c43-7ab2-6e8935471cc2@xen.org>
 <CE6F0EC6-0DB9-47BE-90DC-09011D308FF2@arm.com>
In-Reply-To: <CE6F0EC6-0DB9-47BE-90DC-09011D308FF2@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DU0PR08MB8017:EE_|VE1EUR03FT043:EE_|DBAPR08MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cad784-751d-4e8a-57b1-08da925fdc39
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ar7ci7u0pSpS4FyP2TDY2qydeEtLrOUF1QoSLWcS/mB3m55VVac99Zr2cBWUoPIdjudmhlwq5uuPhU6pUPu9lfHoJw20K+xtPs+6bwZjMXo9vlzeQAUJXXuGtmWuVhSOzBkFvn5WZ/j8cxPAt6Zr4v6L4aotFNb2JzX47VhR1wJhLAeLJ+GyxBOGogbU4B4TzpRDyv4vPNTMgpJZ7Evo3tW0iqQ7yu2oQrvH81NGTLWR6XyIl4VVrLm2L3FIWRS72eO5E7vcpP6ZJ21vTtCieGjr4+N9IB4eWT6kaUn9sehFZBk4LEO65kOERfoq29CdXShW/B5sCGPcNUe9ZD8KlQn8oLuH43fn3m/X9iI04yi5y9RoVdm7rGGlYPYxLfyQNO3mNVS86m4s9Y+Ii2Vz86aYh/gXvyHrCuuvQEu5zw+rmvIagU3BdXFdUoq6WfYwycIi/d9Jt9Vz2Sx1IfUDSclRMm6m+ZOcLEKFnfsS9fxFl4DKKsnjIVf6igiapfEvW0dsqMBfnNOP5t6yMh9bW8/qvSYKczptjsroeS0zqc6fveso2n8iDHOfsSgLcJjE9U6JHkRIyVUE/FqBerYN+oyN6TXICODA1AsGoebi1lqd/RK4mTpzeQZaVCcX+f8o4M+Uu3ysEqKJRM/LzLGDeEhM+MTtBLZhN2EWCD5y/SW78cz3bcqTJpDSk9oWmA7FUSrD1Or2mI7sDwBXT6rAE0OOMalNPhze64XImSy2wYWp3Iq1e3+7Dmog8miLQtc3uSiSi9Vm1rGfzug0b/vK+Pph36MRx5tDndeHTltpNyk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(2616005)(53546011)(5660300002)(186003)(66476007)(66556008)(91956017)(66446008)(66946007)(8936002)(8676002)(64756008)(4326008)(2906002)(76116006)(6506007)(83380400001)(26005)(6512007)(33656002)(36756003)(86362001)(41300700001)(478600001)(6486002)(38070700005)(38100700002)(54906003)(316002)(6916009)(71200400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B2069437F348C4CBCD60DB5F2FD7E6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	198c6c72-bb0f-4dc6-4749-08da925fd6bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RhpBNdR/odj9m+FPRgFAfHjHDhpSp9iIBn7JiQJtSTG34OmzYPk9YmGWypgD0u9t25nlDUpl6DqQ2wdpl56uR1sokvmYeRxV9LSnMA2PqJ+F7771Nbjql+nI1aIM5TfDDSUfKfurSJgQ8DZKb7YhS5KqFkQbAZLR1wXcuNvwwgTDCTiMUmLnakY2KMOHb+gDy55mms1Ot8+qLQ6NB8qeSzz/hP3wKEcgoUjU5zJIb06Gx+ghO2weXuPkld8plzZHpjB08s/0ABTDzViFsjEKRTWkC+DZ+b2IqI9KciBoe6zFq5DoyczeSZKcd3VHjd1w3a/pjnZ5zc22jyUkF9FVSS2tWvGtczZ0PnnzxtjSIHiqpqa8Z2G6mmLkWilqMURuWy6h+G0wMmz6BGPrF5GdNvjRj/bO1f7ULd4oObj1W0ce7rkwVcHEfQ9HYISyR1ykJtGbZlbub4mkcGLmgagfs45kziI6vK43eBjLOg0SU7+U6YVjoPDqE+QOTO78d3f+K1TtZoyKX8t7ofiqOMmNFkWiD9tl3RilA1/2neBCSD0BkWmQW6/cQ3zKPPWT4EXILEqwFaBe/ywbNzLOaGPsPPmbA9TMX6IUuwoD18v4lf5YWMJseZGKmT6Fw2A6BtU95inwN5ywvb6P9Ko4muVFd4/YmdJhrBlsDU8dh+1JFimDH8nfpD3ZYS0ww+xpS4MRqqh1to6LuryBYV5aR78L2Zk7lWxakp01AHuJQCPMS2+LzOZkM7jz6c+JS8VAPu0iee5iow/czGGliUTDZKGL6w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(82740400003)(70206006)(70586007)(36860700001)(478600001)(86362001)(6486002)(40460700003)(356005)(54906003)(316002)(81166007)(8676002)(4326008)(40480700001)(53546011)(8936002)(6506007)(41300700001)(2616005)(47076005)(82310400005)(6862004)(186003)(36756003)(26005)(5660300002)(6512007)(33656002)(2906002)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 12:36:03.8921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cad784-751d-4e8a-57b1-08da925fdc39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832

DQoNCj4gT24gOSBTZXAgMjAyMiwgYXQgMTA6NDAsIEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKdWxpZW4sDQo+IA0KPj4gT24gOSBT
ZXAgMjAyMiwgYXQgMTA6MjcsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4gDQo+PiBIaSwNCj4+IA0KPj4gT24gMDkvMDkvMjAyMiAwODo0NSwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+Pj4gDQo+Pj4+IEl0IHNob3VsZCBiZToNCj4+Pj4gDQo+Pj4+IC8qDQo+Pj4+
ICogVE9ETzoNCj4+Pj4gKg0KPj4+PiANCj4+Pj4gSSB0aGluayB0aGlzIGlzIGdvb2QgdG8gZ28u
IFRoZSB0d28gbWlub3Igc3R5bGUgaXNzdWVzIGNvdWxkIGJlIGZpeGVkIG9uDQo+Pj4+IGNvbW1p
dC4gSSBoYXZlbid0IGNvbW1pdHRlZCB0byBnaXZlIEp1bGllbiAmIEJlcnRyYW5kIGFub3RoZXIg
Y2hhbmNlIHRvDQo+Pj4+IGhhdmUgYSBsb29rLg0KPj4+IEkgdGhpbmsgdGhhdCBpdCBpcyBvayB0
byBmaXggdGhvc2Ugb24gY29tbWl0IGFuZCBJIGFtIG9rIHdpdGggdGhlIHJlc3Qgc286DQo+Pj4g
UmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4N
Cj4+IA0KPj4gVGhpcyBzZXJpZXMgZG9lc24ndCBidWlsZCB3aXRob3V0ICFDT05GSUdfU1RBVElD
X1NITToNCj4+IA0KPj4gVVBEICAgICBpbmNsdWRlL3hlbi9jb21waWxlLmgNCj4+IFhlbiA0LjE3
LXVuc3RhYmxlDQo+PiBtYWtlWzFdOiBOb3RoaW5nIHRvIGJlIGRvbmUgZm9yIGBpbmNsdWRlJy4N
Cj4+IG1ha2VbMV06IGBhcmNoL2FybS9pbmNsdWRlL2FzbS9hc20tb2Zmc2V0cy5oJyBpcyB1cCB0
byBkYXRlLg0KPj4gQ0MgICAgICBjb21tb24vdmVyc2lvbi5vDQo+PiBMRCAgICAgIGNvbW1vbi9i
dWlsdF9pbi5vDQo+PiBDQyAgICAgIGFyY2gvYXJtL2RvbWFpbl9idWlsZC5vDQo+PiBhcmNoL2Fy
bS9kb21haW5fYnVpbGQuYzogSW4gZnVuY3Rpb24g4oCYbWFrZV9zaG1fbWVtb3J5X25vZGXigJk6
DQo+PiBhcmNoL2FybS9kb21haW5fYnVpbGQuYzoxNDQ1OjE6IGVycm9yOiBubyByZXR1cm4gc3Rh
dGVtZW50IGluIGZ1bmN0aW9uIHJldHVybmluZyBub24tdm9pZCBbLVdlcnJvcj1yZXR1cm4tdHlw
ZV0NCj4+IH0NCj4+IF4NCj4+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJy
b3JzDQo+PiBtYWtlWzJdOiAqKiogW2FyY2gvYXJtL2RvbWFpbl9idWlsZC5vXSBFcnJvciAxDQo+
PiBtYWtlWzFdOiAqKiogW2FyY2gvYXJtXSBFcnJvciAyDQo+PiBtYWtlOiAqKiogW3hlbl0gRXJy
b3IgMg0KPj4gDQo+PiBUaGlzIGlzIGJlY2F1c2UuLi4NCj4+IA0KPj4+Pj4gKyAgICAgICAgICog
LSB4ZW4sb2Zmc2V0OiAoYm9ycm93ZXIgVk1zIG9ubHkpDQo+Pj4+PiArICAgICAgICAgKiAgIDY0
IGJpdCBpbnRlZ2VyIG9mZnNldCB3aXRoaW4gdGhlIG93bmVyIHZpcnR1YWwgbWFjaGluZSdzIHNo
YXJlZA0KPj4+Pj4gKyAgICAgICAgICogICBtZW1vcnkgcmVnaW9uIHVzZWQgZm9yIHRoZSBtYXBw
aW5nIGluIHRoZSBib3Jyb3dlciBWTQ0KPj4+Pj4gKyAgICAgICAgICovDQo+Pj4+PiArICAgICAg
ICByZXMgPSBmZHRfcHJvcGVydHlfdTY0KGZkdCwgInhlbixvZmZzZXQiLCAwKTsNCj4+Pj4+ICsg
ICAgICAgIGlmICggcmVzICkNCj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gcmVzOw0KPj4+Pj4g
Kw0KPj4+Pj4gKyAgICAgICAgcmVzID0gZmR0X2VuZF9ub2RlKGZkdCk7DQo+Pj4+PiArICAgICAg
ICBpZiAoIHJlcyApDQo+Pj4+PiArICAgICAgICAgICAgcmV0dXJuIHJlczsNCj4+Pj4+ICsgICAg
fQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICByZXR1cm4gcmVzOw0KPj4+Pj4gK30NCj4+Pj4+ICsjZWxz
ZQ0KPj4+Pj4gK3N0YXRpYyBpbnQgX19pbml0IG1ha2Vfc2htX21lbW9yeV9ub2RlKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQsDQo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqZmR0LA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGludCBhZGRyY2VsbHMsIGludCBzaXplY2VsbHMsDQo+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1lbWluZm8gKm1lbSkNCj4+
Pj4+ICt7DQo+Pj4+PiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPj4gDQo+PiAuLi4gdGhl
cmUgaXMgYSBtaXNzaW5nICdyZXR1cm4gLUVOT1RTVVBQJyBoZXJlLiBXaGlsZSB0aGlzIGlzIHNp
bXBsZSBlbm91Z2ggdG8gZml4LCB0aGlzIGluZGljYXRlcyB0byBtZSB0aGF0IHRoaXMgdmVyc2lv
biB3YXMgbm90IHRlc3RlZCB3aXRoICFDT05GSUdfU1RBVElDX1NITS4NCj4+IA0KPj4gQXMgdGhp
cyBpcyB0aGUgZGVmYXVsdCBvcHRpb24sIEkgd2lsbCBub3QgY29tbWl0IHVudGlsIEkgZ2V0IGNv
bmZpcm1hdGlvbiB0aGF0IHNvbWUgc21va2Ugd2FzIGRvbmUuDQo+IA0KPiBUaGlzIGlzIGEgY2Fz
ZSBvdXIgaW50ZXJuYWwgQ0kgc2hvdWxkIGhhdmUgZ29uZSB0aHJvdWdoLg0KPiBMZXQgbWUgY2hl
Y2sgYW5kIGNvbWUgYmFjayB0byB5b3UuDQo+IA0KDQpIaSBKdWxpZW4sDQoNClRoYW5rcyBmb3Ig
Y2F0Y2hpbmcgaXQsIGluIHRoaXMgY2FzZSBJIGNhbiBjb25maXJtIHRoYXQgdGhlIHByb2JsZW0g
d2FzIHRoYXQgd2UgYXJlIGJ1aWxkaW5nIHdpdGggQ09ORklHX0RFQlVHIGVuYWJsZWQsIEkgZG9u
4oCZdCBrbm93IHdoeSBHQ0MgZG9lc27igJl0IGNvbXBsYWluIHdoZW4NCnlvdSBoYXZlIF9fYnVp
bHRpbl91bnJlYWNoYWJsZSgpIGluIHRoYXQgZnVuY3Rpb24gd2l0aG91dCBhbnkgcmV0dXJuIHZh
bHVlLCBpdCBkb2VzbuKAmXQgZXZlbiB0aHJvdyBhIHdhcm5pbmcuIENvdWxkIGl0IGJlIGNvbnNp
ZGVyZWQgYSBidWcgaW4gR0NDPw0KDQpCdWlsZGluZyBYZW4gd2l0aG91dCBDT05GSUdfREVCVUcg
aW5zdGVhZCBzaG93cyB1cCB0aGUgZXJyb3IgeW91IGZvdW5kLg0KDQpJbiB0aGlzIGNhc2UgdGhp
cyBjaGFuZ2Ugd2lsbCBmaXggdGhlIHByb2JsZW0sIGRvIHlvdSBhZ3JlZSBvbiBpdD8NCg0KZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYw0KaW5kZXggOGM3N2M3NjRiY2YyLi5jNWQ2NmYxOGJkNDkgMTAwNjQ0DQotLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KQEAgLTE0MzksNiArMTQzOSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2Vfc2ht
X21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsDQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1lbWluZm8gKm1lbSkNCiB7DQogICAg
IEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KKw0KKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQogfQ0K
ICNlbmRpZg0KDQpJcyBpdCBzb21ldGhpbmcgdGhhdCBjYW4gYmUgYWRkcmVzc2VkIG9uIGNvbW1p
dD8NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCj4gUmVnYXJkcw0KPiBCZXJ0cmFuZA0KPiANCj4+IA0K
Pj4gQ2hlZXJzLA0KPj4gDQo+PiAtLSANCj4+IEp1bGllbiBHcmFsbA0KDQo=

