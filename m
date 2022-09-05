Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D957E5AD40C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 15:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398871.639846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVCHY-0001un-Fo; Mon, 05 Sep 2022 13:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398871.639846; Mon, 05 Sep 2022 13:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVCHY-0001s3-Ct; Mon, 05 Sep 2022 13:36:56 +0000
Received: by outflank-mailman (input) for mailman id 398871;
 Mon, 05 Sep 2022 13:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVCHW-0001rx-Nu
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 13:36:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccf470c8-2d1f-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 15:36:52 +0200 (CEST)
Received: from AM6P192CA0037.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::14)
 by DB9PR08MB7626.eurprd08.prod.outlook.com (2603:10a6:10:30a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 13:36:50 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::f9) by AM6P192CA0037.outlook.office365.com
 (2603:10a6:209:82::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 13:36:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 13:36:49 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Mon, 05 Sep 2022 13:36:49 +0000
Received: from 42073404c82c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B3454FE-DBE1-46C6-BA62-DE890218C334.1; 
 Mon, 05 Sep 2022 13:36:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 42073404c82c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 13:36:42 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB7663.eurprd08.prod.outlook.com (2603:10a6:10:319::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Mon, 5 Sep
 2022 13:36:40 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 13:36:40 +0000
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
X-Inumbo-ID: ccf470c8-2d1f-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=g8wfSqbmh8db5TRsEZ5zEyhSrA+zE4tB0mKDOHDkglpajmplNVqC4it3MIMyw2aigQGK/BfB6M40u8AQL0ttddLr6ZTO8ZDn/xhfAsCDXuzZbV/Dw/VilkX+QKxjp3sc4km2H35d0bIJEzMo6mKFKCb1t8VSB/kk+zE5HjCA6W5j4PPM1bvRLgQ7fUQiIHE0GW2npr6SRe3wCUXL08K0kcfU9doEV93nT37DFdIQhAvc40UrxvAPp0Bf9zb8j9/geCjWQK3HCD3ZIgzgaH/jPojQhhr+kEUuJ1Y0WwgqjZFH4STIQZXs9MPDljfCSDSIi+tPi1Vy2v4xl8soo9VaAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7opXkaEtIDMzH+1cK3aghCv2BYe5N81Hh6jyHO7ehw=;
 b=V33Ia7RxYD7oTrYjH1rF0ckoqZOvKHe1TqGVN5zgj8dZQmgFPzpvnBmYdM/I0CKdpL8ZljoS1OFGOFb/JGI+TyqUgGFtvFCYgSLZbtoSEbIZOXueqZssxoFBrs/u1gDbyYpudqb2Oqk7gXCeBra7FJW/v8O3HdghOp8pqkUEGpieYy/E1LClRYHLibYNSToF7V4Bmi42Rj1VagZvqQdg1bu2UGua5J+nRIs4rr+Qw6EztdgKSlpr5cXSt4dyTUyZa9DISqxzxf/jT31grFiqVbr+KMi0OrUeaHdJ9FncofP1g15hgCqYbuzqasUtDZ9GC8cp1/KebNb2hw6OMVaQFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7opXkaEtIDMzH+1cK3aghCv2BYe5N81Hh6jyHO7ehw=;
 b=Kc4MCs9yDTLxZ/LSGouUpqvWerRIqIV3ju7rzq4Hse90nB4NIwdwFHUqsA6DzAZVNM46XAEvoTTRN/dfa+u9deMOTnG9dAZCvqPpJ2Y49QZlolp2cc/C0e4XpJG0nuBajW+vYJlSNK/qZK3dJklG/1ZK9I6iQiU7w/1VXd1hSrM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8c10f67b7f7ad4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUtibyPfDLAoDLi2TTsyy76OTtGkvxsEaJCHh7x6WvsIFnMLTA5m0pGwvNo5eVawxqDG6erGQ009m8fD35VdvxqSW0+ak5oN3XvTdqLf8SH13wKuEqD+isPUBMg962tQGerRFaSlzAQ+b8DB0bNl9ZMzIzl2MArYNh3uI2QQbqvebKAOXrSKA6/au+mf9hY5dZilSyHM8a4gip38jWLQEhssZouMy/F2KU9+llPF8USNftdfjE8LFbag7nwKQtsSN2Mndp6tlMNYVD+a7UOIwS1vEd9B48icTuPqBVHKMF0JDr/WuSq+tevu3jsNWkyv1ozw9AfuD2X8/9lLJ+R/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7opXkaEtIDMzH+1cK3aghCv2BYe5N81Hh6jyHO7ehw=;
 b=SZKZbMhmakmd/DnCZH7ihnsR+UgMVOgZWh5H7hZTpbwYfePe1/Ee/6r+N7Rb3EaE6eIUc82a2V+zUXnnp8V9uCGtPkSd7K4WjhIlq2q8hhq519UxY6HUPQdda/nUyyc+/CzS5ZTlR+FZzgXNnlMOCBUHz0KXXhPhieQLAVrOAJ0zxSZSDk6SeOlJT+VubtEDgLmcK3718nFS00eS+L7cDELKZeXVQLMqNbWl51b+IB4HWciJr0moVsgSRFnfX+rkmDMfGAKS67xgeIPRph5xHjSoBbUVJW1DHytYXr0ldCZcSQCheqoRGANay9qofsNjTp4ieQtdjGKiPGvLMleGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7opXkaEtIDMzH+1cK3aghCv2BYe5N81Hh6jyHO7ehw=;
 b=Kc4MCs9yDTLxZ/LSGouUpqvWerRIqIV3ju7rzq4Hse90nB4NIwdwFHUqsA6DzAZVNM46XAEvoTTRN/dfa+u9deMOTnG9dAZCvqPpJ2Y49QZlolp2cc/C0e4XpJG0nuBajW+vYJlSNK/qZK3dJklG/1ZK9I6iQiU7w/1VXd1hSrM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYveOA33HU3e+ak0GIRMMly1Yth63K4ewAgAFZKoCAAAQmAIAADY6AgAAHOICABGESgIAACJcAgAADEwCAAAPEgIAADnWAgAAKUAA=
Date: Mon, 5 Sep 2022 13:36:40 +0000
Message-ID: <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
 <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
 <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
In-Reply-To: <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f7800f39-3748-47c7-667a-08da8f43afaa
x-ms-traffictypediagnostic:
	DU0PR08MB7663:EE_|VE1EUR03FT057:EE_|DB9PR08MB7626:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YZ+AF2QwqR0Q9YrLXiOjcLpB61l1np3zItb2hlVyQG8DmO7GdWSrNJe9h9on+hF8BELJQ0qdZmwjd/fo5zbgdXHA11yJudrJlMMFfhiZJKnWV2vZ3Q/fnXQlAaU7egFyfZ1cb46+VbsJnh9zSrVRc5T7IQqCMRdQKFHzL2TcNn5SeR6CfB0Q8O/y9b1Fu6yO9NlXuFo5TL+J1lKx0IDQvVzvhOtiSpo0gLnl+uG3XAD8KyMmRhhG6PELRD2DX1l6Wqt6wZJdBH7koMo+tNFx6WH0v6MWbOYVCy0jWBMgVm7GCHsTpc2WrW0zOYR1zl4UeDxpWJK5bdBFHmMmjWAPTv5ZdAZLDE9xDmE3J0R62xLVPz8BxpQtXkVjd7yaBOL27DQBL4F500hpmicJuWB6+uAFLROGTd/XEgdnYWsc8ZCydohXHzqiB4vKUstYQy/+GZ8j+4AsUGRSSA4H9MujwCfzD2dspt1FFJJfXUPxyEnlpjbiA5+LRpAC3iY00QhV1MMlKOA5m1EiGdXe9Yld8e8vhDsJXgu/1Kt6G/qwKFT3C9AnuUq2tkmLIHhmRj+rqVrQOhYErl3ypJi+MbtX2/f+30pyc5nH3yN7wNhqqiWK/9xXC7jVI+c3wqg0JvYvXclv+FLD+TEbzVTLiaegKBblVSAMgygUQBdvWYxdWPK4mfNENbd3gUq9hm93DokLqeckcR486GR3FaAzJhMjbqXuDMXdCo1hYUtSG1oeru41bZ1br/JekXzYnYS77Nc58kxojY+btCk1Uymhcbf4brMT5OYQaTM2eSMFRgn7XAc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(83380400001)(38070700005)(6636002)(38100700002)(122000001)(66946007)(66476007)(76116006)(64756008)(54906003)(4326008)(2906002)(316002)(66446008)(8676002)(37006003)(66556008)(91956017)(71200400001)(5660300002)(6862004)(186003)(53546011)(6512007)(26005)(6506007)(2616005)(8936002)(6486002)(478600001)(33656002)(41300700001)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0F1DC631EB2434C9E28F7933B1F0F8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7663
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96fc6951-920e-42ef-c10e-08da8f43aa3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GZ3qRf4q5ORloepO0wKULicCUbBVO8fn6sGd5SxdEER6x/JZ1ndySd7omZJiLayHJKgkJQGHyDkK1/9N51GVSQeCUDBDQJ9zoa2QJ93k6ey/lSmzCCcLxtU0bJzwK4w9gHjedMC5Rj5SQk8BPmbdyYmPS40f/BGCeBskoxfA9eh8+K1CjEKH69gJSTog0cqqNavNznWzQ/W9ZpVaQBaNQOkl24JBf3On+D9xkknQOoH8Zs0Scshp9scHeYBBTRi6QBUehv0GpHkL4pBhVjNx9fTW/1K73H5g6ubv8UN5HINK2pVfISI1pNkckclbTqDHnQcsvPgW0hfoftxGvbxWF9HOnX6gePIVpBBi9dWtEpp2weeCPeP71pxzIsxPsdOrYQJ/rszcoo/ppH5WwIpW9Ahf+WNFmAqf1OE5rCDs2Y24f8n9FYtOHpaLYcCMnmlE5o3ed8Y0bm4BnmRmQipULuNOPxvsayaQJYXfPuhWjPPth9TkYLPFg9eqNoWiZ0vx0F4WJ1/RNsItHXeS8z5KovzRu4k9K7fEhKxBZ1sBOQHodumj54IHPnBOZF41s9nzYrzIp2kvOpVqZ+0ieJvpyYvzWj0mca7RnjKURNY7h9DMZHSL8+u6ZFWeTbbxI2Uk+12BfW2UKlD3+SzEZ467hncEdnrNGJJN+fnJwl4zeEx77nJylLM9BWGDxswz5Ek9YeHGkFtT+18VdKvz7jxg9gu9LKxgmSTVFcP98QUkrzfTqh/R9cfJVAa3dKyulKdPL3BI2umLEpbmCyXa1BeOVQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966006)(40470700004)(36840700001)(47076005)(40460700003)(2616005)(86362001)(81166007)(356005)(6512007)(6506007)(41300700001)(107886003)(83380400001)(26005)(336012)(82740400003)(36860700001)(53546011)(186003)(54906003)(37006003)(40480700001)(33656002)(316002)(6862004)(70586007)(8676002)(4326008)(8936002)(6636002)(5660300002)(2906002)(36756003)(478600001)(6486002)(70206006)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:36:49.7545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7800f39-3748-47c7-667a-08da8f43afaa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7626

SGkgSnVsaWVuLA0KDQo+IE9uIDUgU2VwIDIwMjIsIGF0IDE6NTkgcG0sIEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKdWxpZW4sDQo+
IA0KPj4gT24gNSBTZXAgMjAyMiwgYXQgMTM6MDgsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4gT24gMDUvMDkvMjAyMiAxMjo1NCwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+PiBIaSBKdWxpZW4sDQo+Pj4+IE9uIDUgU2VwIDIwMjIsIGF0
IDEyOjQzLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+
IA0KPj4+PiANCj4+Pj4gT24gMDUvMDkvMjAyMiAxMjoxMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+
Pj4+PiBIaSBKdWxpZW4sDQo+Pj4+IA0KPj4+PiBIaSBSYWh1bCwNCj4+Pj4gDQo+Pj4+Pj4gT24g
MiBTZXAgMjAyMiwgYXQgNToyMCBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3Jv
dGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gT24gMDIvMDkvMjAyMiAxNjo1
NCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+IEhpIEp1bGllbiwNCj4+Pj4+PiANCj4+Pj4+
PiBIaSBSYWh1bCwNCj4+Pj4+PiANCj4+Pj4+Pj4+IE9uIDIgU2VwIDIwMjIsIGF0IDQ6MDUgcG0s
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+
PiBIaSBCZXJ0cmFuZCwNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gT24gMDIvMDkvMjAyMiAxNTo1MSwg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4+Pj4gT24gMSBTZXAgMjAyMiwgYXQgMTk6
MTUsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+Pj4+PiBBRkFJ
VSwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGhhdmUgKl94ZW5zdG9yZSA9IHRydWUgYW5kICpfZW5o
YW5jZWQgPSBmYWxzZS4gSSB0aGluayBpdCB3b3VsZCBiZSBjbGVhcmVyIGlmIGBgZG9tMGxlc3Nf
ZW5oYW5jZWRgYCBpcyB0dXJuZWQgdG8gYW4gZW51bSB3aXRoIDMgdmFsdWVzOg0KPj4+Pj4+Pj4+
PiAtIE5vbmUNCj4+Pj4+Pj4+Pj4gLSBOT1hFTlNUT1JFL0JBU0lDDQo+Pj4+Pj4+Pj4+IC0gRlVM
TFlfRU5IQU5DRUQNCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IElmIHdlIHdhbnQgdG8gYmUgZnV0
dXJlIHByb29mLCBJIHdvdWxkIHVzZSBhIGZpZWxkICdmbGFncycgd2hlcmUgbm9uLXplcm8gbWVh
bnMgZW5oYW5jZWQuIEVhY2ggYml0IHdvdWxkIGluZGljYXRlIHdoaWNoIGZlYXR1cmVzIG9mIFhl
biBpcyBleHBvc2VkLg0KPj4+Pj4+Pj4+IEkgdGhpbmsgdGhhdCBjb3VsZCBiZSBhIGdvb2Qgc29s
dXRpb24gaWYgd2UgZG8gaXQgdGhpcyB3YXk6DQo+Pj4+Pj4+Pj4gLSBkZWZpbmUgYSBkb20wbGVz
cyBmZWF0dXJlIGZpZWxkIGFuZCBoYXZlIGRlZmluZXMgbGlrZSB0aGUgZm9sbG93aW5nOg0KPj4+
Pj4+Pj4+ICNkZWZpbmUgRE9NMExFU1NfR05UVEFCDQo+Pj4+Pj4+Pj4gI2RlZmluZSBET00wTEVT
U19FVkVOVENITg0KPj4+Pj4+Pj4+ICNkZWZpbmUgRE9NMExFU1NfWEVOU1RPUkUgPg0KPj4+Pj4+
Pj4+IC0gZGVmaW5lIGRvbTBsZXNzIGVuaGFuY2VkIGFzIHRoZSByaWdodCBjb21iaW5hdGlvbjoN
Cj4+Pj4+Pj4+PiAjZGVmaW5lIERPTTBMRVNTX0VOSEFOQ0VEID0gKERPTTBMRVNTX0dOVFRBQnwg
RE9NMExFU1NfRVZFTlRDSE58IERPTTBMRVNTX1hFTlNUT1JFKQ0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+
PiBJIHdvdWxkIHJhdGhlciBpbnRyb2R1Y2UgRE9NMExFU1NfRU5IQU5DRURfQkFTSUMgKG9yIHNp
bWlsYXIpIGluc3RlYWQgb2YgZGVmaW5pbmcgYSBiaXQgZm9yIGdudHRhYiBhbmQgZXZ0Y2huLiBU
aGlzIHdpbGwgYXZvaWQgdGhlIHF1ZXN0aW9uIG9mIHdoeSB3ZSBhcmUgaW50cm9kdWNpbmcgYml0
cyBmb3IgYm90aCBmZWF0dXJlcyBidXQgbm90IHRoZSBoeXBlcmNhbGwuLi4NCj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4gQXMgdGhpcyBpcyBhbiBpbnRlcm5hbCBpbnRlcmZhY2UsIGl0IHdvdWxkIGJlIGVh
c2llciB0byBtb2RpZnkgYWZ0ZXJ3YXJkcy4NCj4+Pj4+Pj4gSG93IGFib3V0IHRoaXM/DQo+Pj4+
Pj4+IC8qDQo+Pj4+Pj4+ICogTGlzdCBvZiBwb3NzaWJsZSBmZWF0dXJlcyBmb3IgZG9tMGxlc3Mg
ZG9tVXMNCj4+Pj4+Pj4gKg0KPj4+Pj4+PiAqIERPTTBMRVNTX0VOSEFOQ0VEX0JBU0lDOiBYZW4g
UFYgaW50ZXJmYWNlcywgaW5jbHVkaW5nIGdyYW50LXRhYmxlIGFuZA0KPj4+Pj4+PiAqICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2dGNo
biwgd2lsbCBiZSBlbmFibGVkIGZvciB0aGUgVk0uDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGVjaG5pY2Fs
bHksIHRoZSBndWVzdCBjYW4gYWxyZWFkeSB1c2UgdGhlIGdyYW50LXRhYmxlIGFuZCBldnRjaG4g
aW50ZXJmYWNlcy4gVGhpcyBhbHNvIHJlYWRzIHF1aXRlIG9kZCB0byBtZSBiZWNhdXNlICJpbmNs
dWRpbmciIGRvZXNuJ3QgdGVsbCB3aGF0J3Mgbm90IGVuYWJsZWQuIFNvIG9uZSBjb3VsZCBhc3N1
bWUgWGVuc3RvcmVkIGlzIGFsc28gZW5hYmxlZC4gSW4gZmFjdCB0aGUgd29yZGluZyBmb3IgYGBE
T00wTEVTU19FTkhBTkNFRGBgIGlzIHdoYXQgbWFrZXMgaXQgYSBsb3QgbW9yZSBjb25mdXNpbmcu
DQo+Pj4+Pj4gDQo+Pj4+Pj4gU28gSSB3b3VsZCBzdWdnZXN0IHRoZSBmb2xsb3dpbmcgd29yZGlu
ZzoNCj4+Pj4+PiANCj4+Pj4+PiAiTm90aWZ5IHRoZSBPUyBpdCBpcyBydW5uaW5nIG9uIHRvcCBv
ZiBYZW4uIEFsbCB0aGUgZGVmYXVsdCBmZWF0dXJlcyBidXQgWGVuc3RvcmUgd2lsbCBiZSBhdmFp
bGFibGUuIE5vdGUgdGhhdCBhbiBPUyAqbXVzdCogbm90IHJlbHkgb24gdGhlIGF2YWlsYWJpbGl0
eSBvZiBYZW4gZmVhdHVyZXMgaWYgdGhpcyBpcyBub3Qgc2V0Lg0KPj4+Pj4+ICINCj4+Pj4+PiAN
Cj4+Pj4+PiBUaGUgd29yZGluZyBjYW4gYmUgdXBkYXRlZCBvbmNlIHdlIHByb3Blcmx5IGRpc2Fi
bGUgZXZlbnQgY2hhbm5lbC9ncmFudCB0YWJsZSB3aGVuIHRoZSBmbGFnIGlzIG5vdCBzZXQuDQo+
Pj4+Pj4gDQo+Pj4+Pj4+ICogRE9NMExFU1NfWEVOU1RPUkU6ICAgICAgICAgICAgICBYZW5zdG9y
ZSB3aWxsIGJlIGVuYWJsZWQgZm9yIHRoZSBWTS4NCj4+Pj4+PiANCj4+Pj4+PiBJIHdvdWxkIG1h
a2UgY2xlYXIgdGhpcyBjYW4ndCBiZSB1c2VkIHdpdGhvdXQgdGhlIGZpcnN0IG9uZS4NCj4+Pj4+
PiANCj4+Pj4+Pj4gKiBET00wTEVTU19FTkhBTkNFRDogICAgICAgICAgICAgIFhlbiBQViBpbnRl
cmZhY2VzLCBpbmNsdWRpbmcgZ3JhbnQtdGFibGUgeGVuc3RvcmUgPiAgICogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kDQo+Pj4+Pj4g
ZXZ0Y2huLCB3aWxsIGJlIGVuYWJsZWQgZm9yIHRoZSBWTS4NCj4+Pj4+PiANCj4+Pj4+PiBTZWUg
YWJvdmUgYWJvdXQgIlBWIGludGVyZmFjZXMiLiBTbyBJIHdvdWxkIHN1Z2dlc3QgdG8gcmV3b3Jk
IHRvOg0KPj4+Pj4+IA0KPj4+Pj4+ICJOb3RpZnkgdGhlIE9TIGl0IGlzIHJ1bm5pbmcgb24gdG9w
IG9mIFhlbi4gQWxsIHRoZSBkZWZhdWx0IGZlYXR1cmVzIChpbmNsdWRpbmcgWGVuc3RvcmUpIHdp
bGwgYmUgYXZhaWxhYmxlIi4NCj4+Pj4+PiANCj4+Pj4+Pj4gKi8NCj4+Pj4+Pj4gI2RlZmluZSBE
T00wTEVTU19FTkhBTkNFRF9CQVNJQyBCSVQoMCwgVUwpDQo+Pj4+Pj4+ICNkZWZpbmUgRE9NMExF
U1NfWEVOU1RPUkUgICAgICAgQklUKDEsIFVMKQ0KPj4+Pj4+IA0KPj4+Pj4+IEJhc2VkIG9uIHRo
ZSBjb21tZW50IGFib3ZlLCBJIHdvdWxkIGNvbnNpZGVyIHRvIGRlZmluZSBET00wTEVTU19YRU5T
VE9SRSBhcyBiaXQgMCBhbmQgMSBzZXQuDQo+Pj4+Pj4gDQo+Pj4+Pj4+ICNkZWZpbmUgRE9NMExF
U1NfRU5IQU5DRUQgICAgICAgKERPTTBMRVNTX0VOSEFOQ0VEX0JBU0lDIHwgRE9NMExFU1NfWEVO
U1RPUkUpDQo+Pj4+PiBCZXJ0cmFuZCBhbmQgSSBkaXNjdXNzZWQgdGhpcyBhZ2FpbiB3ZSBjYW1l
IHRvIHRoZSBjb25jbHVzaW9uIHRoYXQgRE9NMExFU1NfRU5IQU5DRURfQkFTSUMgaXMgbm90DQo+
Pj4+PiB0aGUgc3VpdGFibGUgbmFtZSBhcyB0aGlzIG1ha2VzIHRoZSBjb2RlIHVuY2xlYXIgYW5k
IGRvZXMgbm90IGNvcnJlc3BvbmQgdG8gRFQgc2V0dGluZ3MuIFdlIHByb3Bvc2UgdGhpcw0KPj4+
Pj4gcGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuDQo+Pj4+IA0KPj4+PiBUbyBtZSB0
aGUgZGVmYXVsdCBvZiAiZW5oYW5jZWQiIHNob3VsZCBiZSBhbGwgWGVuIGZlYXR1cmVzLiBBbnl0
aGluZyBlbHNlIHNob3VsZCBiZSBjb25zaWRlciBhcyByZWR1Y2VkL2Jhc2ljL21pbmltdW0uIEhl
bmNlIHdoeSBJIHN0aWxsIHRoaW5rIHdlIG5lZWQgdG8gYWRkIGl0IGluIHRoZSBuYW1lIGV2ZW4g
aWYgdGhpcyBpcyBub3Qgd2hhdCB3ZSBleHBvc2UgaW4gdGhlIERULiBJbiBmYWN0Li4uDQo+Pj4+
PiAvKg0KPj4+Pj4gKiBMaXN0IG9mIHBvc3NpYmxlIGZlYXR1cmVzIGZvciBkb20wbGVzcyBkb21V
cw0KPj4+Pj4gKg0KPj4+Pj4gKiBET00wTEVTU19YRU5TVE9SRTogICAgICAgICAgICAgIFhlbnN0
b3JlIHdpbGwgYmUgZW5hYmxlZCBmb3IgdGhlIFZNLiBUaGlzIGZlYXR1cmUNCj4+Pj4+ICogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FuJ3QgYmUgZW5h
YmxlZCB3aXRob3V0IHRoZSBET00wTEVTU19FTkhBTkNFRC4NCj4+Pj4+ICogRE9NMExFU1NfRU5I
QU5DRUQ6ICAgICAgICAgICAgICBOb3RpZnkgdGhlIE9TIGl0IGlzIHJ1bm5pbmcgb24gdG9wIG9m
IFhlbi4gQWxsIHRoZQ0KPj4+Pj4gKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQgZmVhdHVyZXMgKGluY2x1ZGluZyBYZW5zdG9y
ZSkgd2lsbCBiZQ0KPj4+Pj4gKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGF2YWlsYWJsZS4gTm90ZSB0aGF0IGFuIE9TICptdXN0KiBub3Qg
cmVseSBvbiB0aGUNCj4+Pj4+ICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBhdmFpbGFiaWxpdHkgb2YgWGVuIGZlYXR1cmVzIGlmIHRoaXMg
aXMgbm90IHNldC4NCj4+Pj4gDQo+Pj4+IC4uLiB3aGF0IHlvdSB3cm90ZSBoZXJlIG1hdGNoIHdo
YXQgSSB3cm90ZSBhYm92ZS4gU28gaXQgaXMgbm90IGNsZWFyIHRvIG1lIHdoYXQncyB0aGUgcG9p
bnQgb2YgaGF2aW5nIGEgZmxhZyBET00wTEVTU19YRU5TVE9SRS4NCj4+PiBXaGVuIHdlIGxvb2tl
ZCBhdCB0aGUgY29kZSB3aXRoIHRoZSBzb2x1dGlvbiB1c2luZyBCQVNJQywgaXQgd2FzIHJlYWxs
eSBub3QgZWFzeSB0byB1bmRlcnN0YW5kLg0KPj4gDQo+PiBJIGRvbid0IHF1aXRlIHVuZGVyc3Rh
bmQgaG93IHRoaXMgaXMgZGlmZmVyZW50IGZyb20gRU5IQU5DRUQsIEVOSEFOQ0VEX0ZVTEwuIElu
IGZhY3QsIHdpdGhvdXQgbG9va2luZyBhdCB0aGUgZG9jdW1lbnRhdGlvbiwgdGhleSBtZWFuIGV4
YWN0bHkgdGhlIHNhbWUuLi4NCj4+IA0KPj4gVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiAiQkFTSUMi
IGFuZCAiRU5IQU5DRUQiIGlzIGNsZWFyLiBZb3Uga25vdyB0aGF0IGluIG9uZSBjYXNlLCB5b3Ug
d291bGQgZ2V0IGxlc3MgdGhhbiB0aGUgb3RoZXIuDQo+PiANCj4+PiBCeSB0aGUgd2F5IHRoZSBj
b21tZW50IGlzIHdyb25nIGFuZCBjb3JyZXNwb25kIHRvIHdoYXQgc2hvdWxkIGJlIEVOSEFOQ0VE
X0ZVTEwgaGVyZQ0KPj4+IEVOSEFOQ0VEIHdvdWxkIGJlIHRoZSBiYXNlIHdpdGhvdXQgWGVuc3Rv
cmUuDQo+PiANCj4+IFRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbi4gSSBhbSBhZnJhaWQsIEkg
YW0gc3Ryb25nbHkgYWdhaW5zdCB0aGUgdGVybWlub2xvZ3kgeW91IHByb3Bvc2VkIChzZWUgYWJv
dmUgd2h5KS4NCj4+IA0KPj4gSSB0aGluayBCQVNJQyAob3Igc2ltaWxhciBuYW1lKSBpcyBiZXR0
ZXIuIEJ1dCBJIGFtIG9wZW4gdG8gc3VnZ2VzdGlvbiBzbyBsb25nIGl0IGlzIG5vdCAiRE9NMExF
U1NfRU5IQU5DRUQiIHZzICJET00wTEVTU19FTkhBTkNFRF9GVUxMIi4NCj4gDQo+IEkgZG8gbm90
IGFncmVlIGJ1dCBJIHRoaW5rIHRoaXMgaXMgb25seSBpbnRlcm5hbCBhbmQgY291bGQgZWFzaWx5
IGJlIG1vZGlmaWVkIG9uZSBkYXkgaWYgd2UgaGF2ZSBtb3JlIHVzZS1jYXNlcy4NCj4gU28gbGV0
4oCZcyBnbyBmb3IgQkFTSUMgYW5kIHVuYmxvY2sgdGhpcyBiZWZvcmUgdGhlIGZlYXR1cmUgZnJl
ZXplLg0KPiANCj4gQmVydHJhbmQNCg0KUGxlYXNlIGhhdmUgYSBsb29rIG9uY2UgaWYgdGhpcyBs
b29rcyBva2F5Lg0KDQovKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICogTGlzdCBvZiBwb3NzaWJs
ZSBmZWF0dXJlcyBmb3IgZG9tMGxlc3MgZG9tVXMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCiAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogKiBET00wTEVTU19FTkhBTkNFRF9CQVNJ
QzoJTm90aWZ5IHRoZSBPUyBpdCBpcyBydW5uaW5nIG9uIHRvcCBvZiBYZW4uIEFsbCB0aGUgIA0K
ICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCWRlZmF1bHQgZmVhdHVyZXMgKGV4Y2x1ZGluZyBYZW5zdG9yZSkgd2lsbCBiZSAgICAgICAN
CiAqICAgICAgICAgICAgICAgICAgICAgICAgICAJCQkJCWF2YWlsYWJsZS4gTm90ZSB0aGF0IGFu
IE9TICptdXN0KiBub3QgcmVseSBvbiB0aGUgICANCiAqICAgICAgICAgICAgICAgICAgICAgICAg
ICAJCQkJCWF2YWlsYWJpbGl0eSBvZiBYZW4gZmVhdHVyZXMgaWYgdGhpcyBpcyBub3Qgc2V0LiAg
ICANCiAqIERPTTBMRVNTX1hFTlNUT1JFOiAgICAgICAJCVhlbnN0b3JlIHdpbGwgYmUgZW5hYmxl
ZCBmb3IgdGhlIFZNLiBUaGlzIGZlYXR1cmUgICANCiAqICAgICAgICAgICAgICAgICAgICAgICAg
ICAJCQkJCWNhbid0IGJlIGVuYWJsZWQgd2l0aG91dCB0aGUgRE9NMExFU1NfRU5IQU5DRURfQkFT
SUMuICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICogRE9NMExFU1NfRU5IQU5DRUQ6CQkJ
Tm90aWZ5IHRoZSBPUyBpdCBpcyBydW5uaW5nIG9uIHRvcCBvZiBYZW4uIEFsbCB0aGUgIA0KICog
ICAgICAgICAgICAgICAgICAgICAgICAgIAkJCQkJZGVmYXVsdCBmZWF0dXJlcyAoaW5jbHVkaW5n
IFhlbnN0b3JlKSB3aWxsIGJlICAgICAgIA0KICogICAgICAgICAgICAgICAgICAgICAgICAgIAkJ
CQkJYXZhaWxhYmxlLiBOb3RlIHRoYXQgYW4gT1MgKm11c3QqIG5vdCByZWx5IG9uIHRoZSAgIA0K
ICogICAgICAgICAgICAgICAgICAgICAgICAgIAkJCQkJYXZhaWxhYmlsaXR5IG9mIFhlbiBmZWF0
dXJlcyBpZiB0aGlzIGlzIG5vdCBzZXQuICAgIA0KICovICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiNk
ZWZpbmUgRE9NMExFU1NfRU5IQU5DRURfQkFTSUMgICAgIEJJVCgwLCBVTCkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgDQojZGVmaW5lIERPTTBMRVNTX1hFTlNUT1JFICAgICAgICAg
ICAgICAgICAgQklUKDEsIFVMKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiNk
ZWZpbmUgRE9NMExFU1NfRU5IQU5DRUQgICAgICAgICAgICAgICAgIChET00wTEVTU19FTkhBTkNF
RF9CQVNJQyAgfCAgRE9NMExFU1NfWEVOU1RPUkUpDQoNClJlZ2FyZHMsDQpSYWh1bA0KIA==

