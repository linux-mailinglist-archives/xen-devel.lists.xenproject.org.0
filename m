Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0783F4ADE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 14:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170417.311224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI9Ed-00063G-8n; Mon, 23 Aug 2021 12:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170417.311224; Mon, 23 Aug 2021 12:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI9Ed-0005zp-43; Mon, 23 Aug 2021 12:39:27 +0000
Received: by outflank-mailman (input) for mailman id 170417;
 Mon, 23 Aug 2021 12:39:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xpK=NO=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mI9Eb-0005zj-11
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 12:39:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58cf3cb1-fcd9-4129-99fe-96f496d91454;
 Mon, 23 Aug 2021 12:39:22 +0000 (UTC)
Received: from AM6P193CA0112.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::17)
 by DBBPR08MB4741.eurprd08.prod.outlook.com (2603:10a6:10:d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 12:39:21 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::21) by AM6P193CA0112.outlook.office365.com
 (2603:10a6:209:85::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 12:39:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 12:39:20 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Mon, 23 Aug 2021 12:39:20 +0000
Received: from f7da315c0a6a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5261B906-E85C-4871-A5A0-3BC10225CF33.1; 
 Mon, 23 Aug 2021 12:39:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7da315c0a6a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Aug 2021 12:39:11 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB5998.eurprd08.prod.outlook.com (2603:10a6:102:e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 12:39:10 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4394.023; Mon, 23 Aug 2021
 12:39:10 +0000
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
X-Inumbo-ID: 58cf3cb1-fcd9-4129-99fe-96f496d91454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R9UmUQuParRVRHO+yeuPmtDYNAnIFC/HgVg53kldPY=;
 b=WKa7ALcj0eiqeoe3YoFiogQ4HIFTx6dx3f1S6ImDHyeOrZaqgRwqaBwisn7Iw3Ng3HZJLVWncnEmFHVCzULws/yU95Dip/9P4v99M8ar6INGLBp+UMl+qziwJhFC4PFfqaDW1eK1Zik4cI0oBjKXIcgOf1OsrZRE8v3c+A20tTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b2d1bae6bc4a1cf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oI/21IBA77n60mKms3QTwmkuoj+4W2WydGpzfGyGiSE4uzDnHSLH8GGSK7xHlNj7/l49Kj+tCxCyarWojGm++KKo4JRufPYIddv6HU85AQD4xJkEzUorO/eEKNPOBsSfv0SEqPmpSxNezBmKF1SHF9IEZbsiewz6SXo5xC1RBkS2yJKIWUM1gLkC53y8DNZoNQKsotTS3v8UmV/scCycD+7jpjtf2wMyB+5bjINLHwsLCQyFrlV0kSSVDnSHeLqV4lLPXcwUFKQjiH8B4mDuB+hHxiUhJn65KfyNhrQgQcdZiYB/Md5bkO+gjmOBDUG8ZEiuoAsjrZrCqOA+lhKS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R9UmUQuParRVRHO+yeuPmtDYNAnIFC/HgVg53kldPY=;
 b=H7pz+T4bETjBlDsgEjHP3wri12UPz0j1VFfj3HYSCo8N/eBcKXju88u430M81ZUBQ5bYGhZ40onJ2sNBtMG6GXfJw+hKS3YeAM1+mIeiZFgdBMLqAmHkmUYzLqeYrkIv6J7itRj5CwWPZA7TU4Dw0oDBIM1dYad+8ul26FIPlXOhc7+uY4TRX3csDciJflR+3b6hNEGdmDXx+C9jOrJ/roFBCfnqVLCuAirD604v9sXTP1UPMi8tqfQh4rbePGprO9vAE+jX5kjzOmVJnHNbjmqh0wCFEHgBPqtzoMM/ausnaPwxHPXHGgrmkcUmO14yPhGd7Mzgy4say7sUwE+m5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R9UmUQuParRVRHO+yeuPmtDYNAnIFC/HgVg53kldPY=;
 b=WKa7ALcj0eiqeoe3YoFiogQ4HIFTx6dx3f1S6ImDHyeOrZaqgRwqaBwisn7Iw3Ng3HZJLVWncnEmFHVCzULws/yU95Dip/9P4v99M8ar6INGLBp+UMl+qziwJhFC4PFfqaDW1eK1Zik4cI0oBjKXIcgOf1OsrZRE8v3c+A20tTo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 5/7] xen/arm: Use sanitize values for p2m
Thread-Topic: [PATCH v2 5/7] xen/arm: Use sanitize values for p2m
Thread-Index: AQHXmApoMVB9cWExpU2kmUfkwXVwUKuA+VSAgAAOUYA=
Date: Mon, 23 Aug 2021 12:39:10 +0000
Message-ID: <D6083043-B649-43E1-9654-99BC1B8FEED5@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
 <b6d656bd249e85ef192a0bbddae1eb8492e51583.1629713932.git.bertrand.marquis@arm.com>
 <7c8684a1-a20f-0534-2a4b-3a778a80166b@xen.org>
In-Reply-To: <7c8684a1-a20f-0534-2a4b-3a778a80166b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 42a1bbcd-8419-4561-4ca2-08d9663307b8
x-ms-traffictypediagnostic: PA4PR08MB5998:|DBBPR08MB4741:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4741CBDB7044B4EC842874939DC49@DBBPR08MB4741.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 39YpSKuRcCbbYGAIZxxgNCU6WNDGzvUYIenWPeQfwJEAp0ZTbP0wLna4kk3VfRO8f6Ct9OCE6CT936rd9kfFCHBEOUHynuzRrLY0gVBb7oNrWhhsn1jqwIlXQCqYLRDxFVg7nY+nTLX+nG/te7UsUnxmknpVDSWRRJS0yZxPf9Cfj8QKo+t5Sdsaye88uzvO2tU6tsJ9hq/rCoZc9C1jqrWpPzSfFl6MW/mwpvXHRbLiL+x7IQ8tuCxIQ7cEJRTV2kFamZgGOV1LCI8D30AnAOLJfit1KUhYyulw1Wc4WRdoQi0dntUu26sExXrP1Jx+4TV2fKnYYdFARuSVeLuQ9KLdJJEF/iZFnVwSxNKN4fw+gGmx411Jtm3gV8p1/9v0zPklZu+kx8O+zhxN6Xzy16YVthWzJ0BZK6f6EaQMiQHZCBC+NGPVx7eyDcCrV0dGREuo6WmQD/l0Ktnb0s7nazlvxWLZgOIakKXlf8Q3dCu+36VvT9E5wYxzSF+LGn1tmXa76i77OwerKFXhzDbp9VsWbXPVU+naQseaOzKDlcTJnTf0mIS9P5VYc/rdQ4z0dD3jcjn0LqRmKU48gitDYB7Mx7fbYUNPm2qE8GsXA3MAmgddbN7rBYnTI4qL0AQ6/OSsAttLxqX8eVFlPl8EvqFtgbmjgXvGFpq7W78HcVGs6epfExdH2hOrb8fMsdqJzGkp39InbSc15jqPP9EJLh4QNv4/x32J4t9NOj2ZQPhDVwBvKabrtKv6LWZITzfX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(38070700005)(33656002)(83380400001)(122000001)(53546011)(6512007)(4326008)(5660300002)(71200400001)(91956017)(6916009)(54906003)(66946007)(76116006)(6486002)(316002)(2616005)(2906002)(86362001)(186003)(66476007)(66446008)(478600001)(8676002)(26005)(66556008)(64756008)(8936002)(38100700002)(36756003)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?F9BQSkFTi13b7GCObKtRju/jFF0ZgxQl2xGlE70Im7aveEdHr8SUH1ppg2Pq?=
 =?us-ascii?Q?1+2hTeZTRQIg1s1hnCh1+3yhqaUESRW+TgSp77iomI1SdAPYYFk1T7FvcRG/?=
 =?us-ascii?Q?2AEqPY6Ivo9u2PVJ5dS3Xdtbx9nREDFglUZioc5gpzfTsj1zZSZoThEoo/NZ?=
 =?us-ascii?Q?ke0lLBp6qFzE93xuyiIZfZ7pKoIFk+CHjvb1Wy02wmH7iG5bXCSeKwMQHEy7?=
 =?us-ascii?Q?PKbGh9hOf5Jhsf6OxXB9qLCenJFUQ+rU2vnTr3jrKhujSdbdJ09IIiGe5dQa?=
 =?us-ascii?Q?13Eb1UP6GZYpsQcxMqGKc/zv4FdRf8+soXV0qSDegk9TZteRh6RZcAFK1Kiz?=
 =?us-ascii?Q?ioDsdwtYehaId4EYzlfan+Nc7/qpqAhVxYTCKazOejbeUfDpNxIx9J/4VttM?=
 =?us-ascii?Q?d83b58hJjiHoRVbou2n67OnEQWo7Z/ND5+eBsMmshl20aVzDJJ2GIU6wvULY?=
 =?us-ascii?Q?5j8BNUGpIEgmIbdLoGLuHgtpuEaSUgrmBFPsyi7ak/Tstm22BtXMajbOLFAg?=
 =?us-ascii?Q?d+P9RsnZhgmvon8zXDddhvseYxSWD5Ian3IzfzXikCPuCxOl/aVzp7XtA1Mh?=
 =?us-ascii?Q?SGDHydIgXVos2O6xmKoyalLZYKCNevQjQr3JZqsjnzEtLa4G5sY0XMGudyS8?=
 =?us-ascii?Q?1lDlv9kUm7tDY0IPLcFP5pKcQpqysXVZwYmgErTFJ/HFlsmN+RQlSqXtmWz4?=
 =?us-ascii?Q?Aq/OxQIaReq9R632a2HFuviJrGTcXdnlUvc2jZpgtFT+RmBS9rBtrJqUA78C?=
 =?us-ascii?Q?9HzEkPsujllgnXFAP7r3k8Kn6Er5Jv7heba+U2yFqwqzGFZlYZhP2EFHya/c?=
 =?us-ascii?Q?xgtKgiamj3pZlGQAOpYcHZp4ZU/oW3QUeYCELFIAUmavfemU9Yu81eZkvJ/c?=
 =?us-ascii?Q?+1fPmCVSgrjNGoXDs3dpD11fDs6bz6rU/PEBCzwkuBhaIvVPyxIm5Ner/Q0M?=
 =?us-ascii?Q?ZrTne6ZrzyIRpV2FNebLH6ZAt6A9nhHa6gDqjcKAd5FLjhzlHBn91M0kYArB?=
 =?us-ascii?Q?35rRkoOzTVz1i+aLIJugntZ9yq7aQR8IJlXJeP6c+/rPMQ+QDN0Of2esQWba?=
 =?us-ascii?Q?wq1asllKFPOe0Wlpuu28Ydd9RTh9kD4JuC3ElmHuGEaDqqc9MA5w1kTWQytS?=
 =?us-ascii?Q?MXRsl4vF3tJ6K2FAeodn7t7jQ0RXatYFV3sLsmIEIpZFfiqIPY7v72VNfyXs?=
 =?us-ascii?Q?lO3VEHY7a2fA1FZS+DtB2zghO9/apRkSQNWZeH3drhu/31Er200vbwDH31Z+?=
 =?us-ascii?Q?ALzpdujh2P1dyJNiEJzSsG+p4oZNGSxzO4pWYuHW1rRn9ZVamr/UR5s4wFHN?=
 =?us-ascii?Q?AlnSiMGTqq8GvXTUVcYzyEAq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC787C20EC7D304EB66D44FF039B73E7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5998
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35fc90d5-b929-42b0-8e50-08d9663301ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HFvkFLbm6WbaWEwajI20NvYddd+bvUX89rZpDJz+xedykib5jgVSLw9HxUWqwdFWbszE2Y8vdnnBH5JfvWSlUyhoDofi72PKRqfxqeKmU7VCoLVedsiT5HKEZOUaLRPIVqnanDWjgJrCkMWWK0EAKuhcye9wXKBcgDme5IAKbxGetOOs10bD0dtdhcTuzotZzd1C+0zNx53ZoaKyreLtJQUamXGklm2Z9XYWIHdZdbYejFsvU7eec+T31zAFDG6Jo6ubzOHqjPr5vuXD5j8XNtSpOzP22oslXcYYS2aRaZBaoVFFm/DZtzFR/KMSNRGWBsW5BNDLSofv6qebz2FvQ/q+A+RgBKiI+ktdVmS2OIVAu5VjS41+iYP0nWQbWwOpv6PAS4gHS4q4dmUdFC4dQdRVVbFn+mekQJz2r9Qkyd4AfBSJCzTKXV+td/2K7Kn7ZntMwhjErPp4SD5ZNd9CrDw0ajlCMqv2B52zodJq9y+tCqy+WbwkbkxqrRzjYmsM04BCwNLGBOec8CbAcCSiiSQamStgKSrUa1Z+DHIG9cINkDZpN6yfD6GPz5mAJJo63TK4DjuqIwU18Z0EbLwcyhXYZ0c11oVNqWTgMkb7bdeZo/sZgupAs7gNeHQhOrf/7nr0+bDvCFk0g4vpVPKYUDiwmfricM5KJkFqxzJ8+RGwoZnxrMBWMvTKZthJm+qb0I+vrwUZJTQ6r9ZuS/sJrw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(82740400003)(53546011)(83380400001)(8676002)(336012)(81166007)(107886003)(6512007)(4326008)(186003)(2616005)(6506007)(33656002)(478600001)(36756003)(316002)(54906003)(26005)(2906002)(6862004)(70586007)(36860700001)(70206006)(86362001)(356005)(6486002)(82310400003)(5660300002)(47076005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 12:39:20.7486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a1bbcd-8419-4561-4ca2-08d9663307b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4741

Hi Julien,

> On 23 Aug 2021, at 12:47, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 23/08/2021 11:32, Bertrand Marquis wrote:
>> Replace the code in p2m trying to find a sane value for the VMID size
>> supported and the PAR to use. We are now using the boot cpuinfo as the
>> values there are sanitized during boot and the value for those
>> parameters is now the safest possible value on the system.
>> On arm32, the system will panic if there are different types of core so
>> those checks were not needed anyway.
>=20
> So the assumption is that if you have the same MIDR, then you must have t=
he same features. I understand this is what Xen assumes today but I never v=
iewed that check as the truth. It is more to limit the damage on most platf=
orm.

This was the assumption before, I did not change anything but just explaine=
d in the commit message why this was not possible to come to this code.

>=20
> So can you confirm whether this is something that Arm guarantees?

For a specific MIDR from Arm (ie a Cortex) the PAR is fixed and VMID size t=
o.
But for an other Arm architecture processor I cannot say.

>=20
> That said, I am not against removing the code. But I would like the comme=
nt to be amended if this is not a correct assumption.

Would the following be acceptable:
On arm32, Xen is not booting on systems having different MIDR amongst cores=
 and it is assumed that cores with the same MIDR will have the same PAR and=
 VMID size.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


