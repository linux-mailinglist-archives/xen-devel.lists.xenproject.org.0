Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B45A5B8F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 08:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394814.634365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSuT9-0005Qk-AT; Tue, 30 Aug 2022 06:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394814.634365; Tue, 30 Aug 2022 06:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSuT9-0005OK-7l; Tue, 30 Aug 2022 06:11:27 +0000
Received: by outflank-mailman (input) for mailman id 394814;
 Tue, 30 Aug 2022 06:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSuT7-0005OD-HD
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 06:11:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93376de6-282a-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 08:11:24 +0200 (CEST)
Received: from FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::6) by
 VI1PR08MB4543.eurprd08.prod.outlook.com (2603:10a6:803:f4::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 30 Aug 2022 06:11:16 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::f1) by FR3P281CA0152.outlook.office365.com
 (2603:10a6:d10:a2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 30 Aug 2022 06:11:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 06:11:15 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 30 Aug 2022 06:11:15 +0000
Received: from 9561fc5c40fa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D39E8C0B-DC1C-4159-AE82-2B03487BBBE5.1; 
 Tue, 30 Aug 2022 06:11:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9561fc5c40fa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 06:11:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB5883.eurprd08.prod.outlook.com (2603:10a6:10:206::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:11:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:11:02 +0000
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
X-Inumbo-ID: 93376de6-282a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bAmyYGKGBQOjO/oSQNxWFpNfjqqnjgo3I0ztpygFR5HIriATIbaTJXXQ4J6vd1rR/neZxSnzchdSJrS6RmsAlJegXvjDTtjuS5YPdqo81fjwkW8wOwcZvVk/zLaP4fUI4MHBD8xxRuK4W0aT84kOeyPibL7QGriDbJ8JAubuNQXvYyoF3SRDIeR4aczXo4kE5lYUO8C7X/axh8Zn5lwKgjEh/4YZ77cXjGo8HSZqgYnvlFIrW9W0s/oQQLQwy6hQmgBhGApAxmJLH+dQm/tD49NL9uByuBwcTXInXQEjyjO+pm6ZZM8SZn546ckKird9/UmKOV4LbPrajlzB8E1eSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DZ5eiPe4MTAXqhedNujlDDau3Z4c289ZTp/ntqoAq8=;
 b=eOR1vlQslIe0MyVV3iihjzDlAcT1X+xxb6nH13K8HVwIwxcH3nefM9gzS1fMCdfgQTKZG72z0c2nMgzCJrJy9Bpx1Io7ZGcEeLlHEdcD6VNCtI6nqDx5I18nupyVCEUJAGHURiSVA72gVNGRXBgZz8Bs+2L0pGC5fatb+RvpPQlbhoqR7JxUv9sF8ri5VURWkEtep4J/XDSllOsHKZr7UXYbwje37bhBRg6TiEe4YbpzkASQUjF7bE+tGRF4FAkH9R/lS8nNw3r3aXGFCe9BowbLr6YI1D7evwkQ/5/G/L4iIA/V3mKQk0rHXll/JY+XPhSiML2imxfINoeHIEHVzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DZ5eiPe4MTAXqhedNujlDDau3Z4c289ZTp/ntqoAq8=;
 b=dEhv+CjXx2mIf2piYmpz//b2Nhsb8XuB6tEnLKifNoJnnKuDoFY4keqvOwEAoY3w2UxKsZqjVRcG67U3TEbz9ZCXV3jVdqKu40gKPfcC7c8hc2YxFXhiQzbBPYw8zYR+xJyAujyqyfg8wOIQjlAslTjUZWBz9Whef/SQIW6gbnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQaMIn64LJhAaey6Wjfvb0dGMrLM1aVrY0cQYi9U0muAzcYeZUAQOXPCHoFl5x299DPbrXflJ26wFpDL9LIbr59cV7H3AHFd3uI/TtfbFIGz8S6yWX+EhYHpXj+ApyO2mxIO3o4//Y5SLdRRXBlozyiSb/eh6w2jTvvbrq9GQNAOXrd1gzR+TqSxQu87BS2V09SE3mL3boEFPS9e/obzPPwgVAXxfib/x5+QBFNLi/6AJj0Bgjf5qc1GxnBQ8ODFM7atP5GX+j+OuGDvb2HFLWbqzMwcAtif/Vd9WRs48oKm8R/E87LGCxuL8zsswSrwoUSOfJny0uz9+tSbL484IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DZ5eiPe4MTAXqhedNujlDDau3Z4c289ZTp/ntqoAq8=;
 b=bursVrjxBqq2OoCcMc/sDqGkn1UEKGZq7e7NgKexWHl/SBoz+tmmmDjFxDOOtRQC3epoauxLBV7fqUw5BL6iOgq6CvEdFPjeLF9f7fHIrrgtRUOHfi9176zJoHjPQZJ5vtQKVkfRYul10nSxsXYHXhZbr9h3CI748NKSzzsyqGuNHqv5PmpN4aQoJcyEtRoXUrzin+2KlyZCFD1v0z70cwdPJBHr7OiqOrV63/k4LbU5Q6frcw9CSVTLNNis0vFMSJHKgMPSBPIheum10K55ecH24DJKEsYbvMy6XJIWcZ0YEbFGJ10yzKj1PW3uqcQvW0OfCFx6T9gHXQ3vLs0rGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DZ5eiPe4MTAXqhedNujlDDau3Z4c289ZTp/ntqoAq8=;
 b=dEhv+CjXx2mIf2piYmpz//b2Nhsb8XuB6tEnLKifNoJnnKuDoFY4keqvOwEAoY3w2UxKsZqjVRcG67U3TEbz9ZCXV3jVdqKu40gKPfcC7c8hc2YxFXhiQzbBPYw8zYR+xJyAujyqyfg8wOIQjlAslTjUZWBz9Whef/SQIW6gbnE=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q2/e0SAgAeAsxA=
Date: Tue, 30 Aug 2022 06:11:02 +0000
Message-ID:
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
In-Reply-To: <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DB304F9153E02F4292EB9C86B4EB96B0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b68a5258-db8f-486a-5ab1-08da8a4e7240
x-ms-traffictypediagnostic:
	DBBPR08MB5883:EE_|DBAEUR03FT065:EE_|VI1PR08MB4543:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 js9rFgFZVD5OFmQRs+nfPg9uicLmd67KgsdtNh1zzQyPanfzBYrCc7IWLCVpHsZT/KL6hGOg7cUJewvS99aJB0ZYlOHcktuV1V8NRiF71lhB1hSyYWpMfGhLxm/qqzilfUgRw5f2w1E2/LLNG6Xy7oG3QJ4NPF9vbBQRoerAUpvC1sIMR+0YM8AN36JG6Hu74FgHPnm/UViB18M5s8R5CvPfsUY4HSwHLNtGDwoWK9AbyFkhRsR/ksfDygQ6ydcXVDS/1I/BPHJymHnzshHA+nUGUAkY/m1wY1ff4CjX/qk0y3Lh7gJe10oxGy6XI/7wEtxi58F/25CrmTXYQagscAPVo5aQslASUAbGnCbtNUdoJXObzETBJcFkrmuBO9bdvtXk1KgzYjMz2LH5/wo3KTbxwdGjeVah4s/TF932d0lcuMRRcdHQb4wRI2xjtmzpsAYaii394gW0wC1OfNUWrB2P/kQ6uwwGPLfwuaoctFkGMVmQiiK5StizhY4K+TP7W8pqOSjiYVrB6PDyos9bfiWfN0bBSe+FjM/Rn39A1lBRgOxvJchtG8bKdSJUy58B75av+t5/Te62+gvZ3635XyEQrYTL/Q92Qeweijrz88012xmfVWP2KusxE8h0sHKEVQMInx3vn/KWb04BUEhB9ciRKbmYR9QII76L2xRR1Mxbk8Dnxps4sj6EeZrjdJjfu/eoLXxYEKy54Mpv5+ZURYS64Cu8kPZ1e4MRJIwLzDJOObjodkAt0iWaHAL1Ql0S0nIk7HbGMWN7pRPhGbnQAw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(33656002)(71200400001)(316002)(9686003)(26005)(186003)(83380400001)(6506007)(2906002)(7696005)(86362001)(38070700005)(55016003)(54906003)(122000001)(478600001)(5660300002)(41300700001)(52536014)(38100700002)(8936002)(110136005)(66476007)(66446008)(4326008)(66556008)(76116006)(8676002)(64756008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5883
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81a8cd70-2ae3-4472-76b5-08da8a4e6a7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KFfsMJ9R9uIAuEEwViyNpxUNZXgGkbdh2lIvE9psWGS1g8E+TPhKBNdnFhGnFCRZi0cGCDTOVLbheQ5nr2hhqaPYkBme/uE0e+D3aZVu3akwbgAKrw6SMvhsEfWIJFfKAhDfUOBqqka809fdmuQDBaxHTCcmZ6ohsJ9NF4C/wl9kWI7EZVq25DkpZ+Vac1aerWrHjY8cbN1cP6gfl8Df2tNB+6K3Ee1lA5R7ueWC6fvuSJr/WksrTnk1mdNmJMjMefN+Nbyir4P8C5xbO8+VULwmtGMhVV5/ZzbChzLpmPqeJmCHVGoZne9E9HtYp1isyO0Yw0Ax2pgcfhw3itzr5BTdegdFMQ6YvPuzURxpeTTZP71++LVW981pWrLPWFPFAEf39GkZUb4dUyP+AUkDzvir0GoLvup5KzrdEmO0WBxxES2zKpjcLNQlacDCPce1pgEvJYBIFsAeBNrvLHrq+nCO3yzZPkvtWlP4IF3q30+MJG65gttHGM3dJ8+6RXwcZH7bc7CTsTRtjvh58LYFd/kPpKnW7mrwn2kvjFfdmrGEcAcHeU2KP89ArC5JOzDZybE74AFI0FlYXnoeWnAKUHLVAt5yy66Jd+wSlGBUtQOwkk/CMSIxaPg8OGRFYXe+7Q3koYHWrh6hnumxMV6EBlTJSJfFO5H0JdVcnO3m4zOssaXUwcYLEjufiFKOvGIgmhYGlv3+9wiNAA4mSHzpDOiGe9ZQzP1I33hCSiHtAP8+HDTngKB/RJNOE7L5F0DALb8FA0tkJfXBESs0v9GZJw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(36840700001)(46966006)(40470700004)(4326008)(55016003)(2906002)(40480700001)(82310400005)(70206006)(8676002)(70586007)(8936002)(6506007)(7696005)(107886003)(54906003)(316002)(26005)(33656002)(9686003)(478600001)(110136005)(41300700001)(83380400001)(86362001)(40460700003)(47076005)(336012)(356005)(186003)(36860700001)(81166007)(82740400003)(5660300002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 06:11:15.5092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b68a5258-db8f-486a-5ab1-08da8a4e7240
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4543

SGkgTWljaGFsLA0KDQpTb3JyeSBhYm91dCB0aGUgbGF0ZSByZXBseSAtIEkgaGFkIGEgY291cGxl
IG9mIGRheXMgb2ZmLiBUaGFuayB5b3UgdmVyeQ0KbXVjaCBmb3IgdGhlIHJldmlldyEgSSB3aWxs
IGFkZCBteSByZXBseSBhbmQgYW5zd2VyIHNvbWUgb2YgeW91cg0KcXVlc3Rpb25zIGJlbG93Lg0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hhbCBPcnplbCA8bWlj
aGFsLm9yemVsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSB4ZW4vYXJtOiBI
YW5kbGUgcmVzZXJ2ZWQgaGVhcCBwYWdlcyBpbiBib290IGFuZA0KPiBoZWFwIGFsbG9jYXRvcg0K
PiANCj4gPiBUaGlzIGNvbW1pdCBmaXJzdGx5IGFkZHMgYSBnbG9iYWwgdmFyaWFibGUgYHJlc2Vy
dmVkX2hlYXBgLg0KPiA+IFRoaXMgbmV3bHkgaW50cm9kdWNlZCBnbG9iYWwgdmFyaWFibGUgaXMg
c2V0IGF0IHRoZSBkZXZpY2UgdHJlZQ0KPiA+IHBhcnNpbmcgdGltZSBpZiB0aGUgcmVzZXJ2ZWQg
aGVhcCByYW5nZXMgYXJlIGRlZmluZWQgaW4gdGhlIGRldmljZQ0KPiA+IHRyZWUgY2hvc2VuIG5v
ZGUuDQo+ID4NCj4gRGlkIHlvdSBjb25zaWRlciBwdXR0aW5nIHJlc2VydmVkX2hlYXAgaW50byBi
b290aW5mbyBzdHJ1Y3R1cmU/DQoNCkFjdHVhbGx5IEkgZGlkLCBidXQgSSBzYXcgY3VycmVudCBi
b290aW5mbyBvbmx5IGNvbnRhaW5zIHNvbWUgc3RydWN0cyBzbw0KSSB3YXMgbm90IHN1cmUgaWYg
dGhpcyBpcyB0aGUgcHJlZmVycmVkIHdheSwgYnV0IHNpbmNlIHlvdSBhcmUgcmFpc2luZyB0aGlz
DQpxdWVzdGlvbiwgSSB3aWxsIGZvbGxvdyB0aGlzIG1ldGhvZCBpbiB2Mi4NCg0KPiBJdCB3b3Vs
ZCBoZWxwIHRvIGF2b2lkIGludHJvZHVjaW5nIG5ldyBnbG9iYWwgdmFyaWFibGVzIHRoYXQgYXJl
IG9ubHkgdXNlZA0KPiBpbiBwbGFjZXMgbWFraW5nIHVzZSBvZiB0aGUgYm9vdGluZm8gYW55d2F5
Lg0KDQpBY2suDQoNCj4gDQo+ID4gKyAgICAgICAgZm9yICggaSA9IDAgOyBpIDwgYm9vdGluZm8u
cmVzZXJ2ZWRfbWVtLm5yX2JhbmtzOyBpKysgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAg
ICAgICAgaWYgKCBib290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tpXS54ZW5faGVhcCApDQo+ID4g
KyAgICAgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgICAgIGJhbmtfc3RhcnQgPSBib290aW5m
by5yZXNlcnZlZF9tZW0uYmFua1tpXS5zdGFydDsNCj4gPiArICAgICAgICAgICAgICAgIGJhbmtf
c2l6ZSA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2ldLnNpemU7DQo+ID4gKyAgICAgICAg
ICAgICAgICBiYW5rX2VuZCA9IGJhbmtfc3RhcnQgKyBiYW5rX3NpemU7DQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICAgICAgcmVzZXJ2ZWRfaGVhcF9zaXplICs9IGJhbmtfc2l6ZTsNCj4gPiArICAg
ICAgICAgICAgICAgIHJlc2VydmVkX2hlYXBfc3RhcnQgPSBtaW4ocmVzZXJ2ZWRfaGVhcF9zdGFy
dCwgYmFua19zdGFydCk7DQo+IFlvdSBkbyBub3QgbmVlZCByZXNlcnZlZF9oZWFwX3N0YXJ0IGFz
IHlvdSBkbyBub3QgdXNlIGl0IGF0IGFueSBwbGFjZSBsYXRlcg0KPiBvbi4NCj4gSW4geW91ciBj
dXJyZW50IGltcGxlbWVudGF0aW9uIHlvdSBqdXN0IG5lZWQgcmVzZXJ2ZWRfaGVhcF9zaXplIGFu
ZA0KPiByZXNlcnZlZF9oZWFwX2VuZC4NCg0KR29vZCBwb2ludCwgdGhhbmsgeW91IGFuZCBJIHdp
bGwgcmVtb3ZlIGluIHYyLg0KDQo+IA0KPiA+ICAgICAgLyoNCj4gPiAgICAgICAqIElmIHRoZSB1
c2VyIGhhcyBub3QgcmVxdWVzdGVkIG90aGVyd2lzZSB2aWEgdGhlIGNvbW1hbmQgbGluZQ0KPiA+
ICAgICAgICogdGhlbiBsb2NhdGUgdGhlIHhlbmhlYXAgdXNpbmcgdGhlc2UgY29uc3RyYWludHM6
DQo+ID4gQEAgLTc0Myw3ICs3NjYsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9p
ZCkNCj4gPiAgICAgICAqIFdlIHRyeSB0byBhbGxvY2F0ZSB0aGUgbGFyZ2VzdCB4ZW5oZWFwIHBv
c3NpYmxlIHdpdGhpbiB0aGVzZQ0KPiA+ICAgICAgICogY29uc3RyYWludHMuDQo+ID4gICAgICAg
Ki8NCj4gPiAtICAgIGhlYXBfcGFnZXMgPSByYW1fcGFnZXM7DQo+ID4gKyAgICBoZWFwX3BhZ2Vz
ID0gIXJlc2VydmVkX2hlYXAgPyByYW1fcGFnZXMgOiByZXNlcnZlZF9oZWFwX3BhZ2VzOw0KPiBJ
IG11c3Qgc2F5IHRoYXQgdGhlIHJldmVydGVkIGxvZ2ljIGlzIGhhcmRlciB0byByZWFkLiBUaGlz
IGlzIGEgbWF0dGVyIG9mIHRhc3RlDQo+IGJ1dA0KPiBwbGVhc2UgY29uc2lkZXIgdGhlIGZvbGxv
d2luZzoNCj4gaGVhcF9wYWdlcyA9IHJlc2VydmVkX2hlYXAgPyByZXNlcnZlZF9oZWFwX3BhZ2Vz
IDogcmFtX3BhZ2VzOw0KPiBUaGUgc2FtZSBhcHBsaWVzIHRvIC4uLg0KDQpTdXJlLCBJIHdpbGwg
dXNlIHRoZSB3YXkgeW91IHN1Z2dlc3RlZC4NCg0KPiANCj4gPiArDQo+ID4gICAgICBpZiAoIG9w
dF94ZW5oZWFwX21lZ2FieXRlcyApDQo+ID4gICAgICAgICAgeGVuaGVhcF9wYWdlcyA9IG9wdF94
ZW5oZWFwX21lZ2FieXRlcyA8PCAoMjAtUEFHRV9TSElGVCk7DQo+ID4gICAgICBlbHNlDQo+ID4g
QEAgLTc1NSwxNyArNzc5LDIxIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tbSh2b2lkKQ0K
PiA+DQo+ID4gICAgICBkbw0KPiA+ICAgICAgew0KPiA+IC0gICAgICAgIGUgPSBjb25zaWRlcl9t
b2R1bGVzKHJhbV9zdGFydCwgcmFtX2VuZCwNCj4gPiArICAgICAgICBlID0gIXJlc2VydmVkX2hl
YXAgPw0KPiAuLi4gaGVyZS4NCg0KQW5kIGhlcmUgOikpDQoNCj4gDQo+ID4gKyAgICAgICAgICAg
IGNvbnNpZGVyX21vZHVsZXMocmFtX3N0YXJ0LCByYW1fZW5kLA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBmbl90b19wYWRkcih4ZW5oZWFwX3BhZ2VzKSwNCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAzMjw8MjAsIDApOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDMyPDwyMCwgMCkgOg0KPiA+ICsgICAgICAgICAgICByZXNlcnZlZF9oZWFw
X2VuZDsNCj4gPiArDQo+ID4gICAgICAgICAgaWYgKCBlICkNCj4gPiAgICAgICAgICAgICAgYnJl
YWs7DQo+ID4NCj4gPiAgICAgICAgICB4ZW5oZWFwX3BhZ2VzID4+PSAxOw0KPiA+ICAgICAgfSB3
aGlsZSAoICFvcHRfeGVuaGVhcF9tZWdhYnl0ZXMgJiYgeGVuaGVhcF9wYWdlcyA+IDMyPDwoMjAt
DQo+IFBBR0VfU0hJRlQpICk7DQo+ID4NCj4gPiAtICAgIGlmICggISBlICkNCj4gPiAtICAgICAg
ICBwYW5pYygiTm90IG5vdCBlbm91Z2ggc3BhY2UgZm9yIHhlbmhlYXBcbiIpOw0KPiA+ICsgICAg
aWYgKCAhIGUgfHwNCj4gPiArICAgICAgICAgKCByZXNlcnZlZF9oZWFwICYmIHJlc2VydmVkX2hl
YXBfcGFnZXMgPCAzMjw8KDIwLVBBR0VfU0hJRlQpICkgKQ0KPiBJJ20gbm90IHN1cmUgYWJvdXQg
dGhpcy4gWW91IGFyZSBjaGVja2luZyBpZiB0aGUgc2l6ZSBvZiB0aGUgcmVzZXJ2ZWQgaGVhcCBp
cw0KPiBsZXNzIHRoYW4gMzJNQg0KPiBhbmQgdGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRo
ZSBmb2xsb3dpbmcgcGFuaWMgbWVzc2FnZS4NCg0KSG1tbSwgSSBhbSBub3Qgc3VyZSBpZiBJIHVu
ZGVyc3RhbmQgeW91ciBxdWVzdGlvbiBjb3JyZWN0bHksIHNvIGhlcmUgdGhlcmUNCmFyZSBhY3R1
YWxseSAyIGlzc3VlczoNCigxKSBUaGUgZG91YmxlIG5vdCBpbiB0aGUgcGFuaWMgbWVzc2FnZS4N
CigyKSBUaGUgc2l6ZSBvZiB4ZW5oZWFwLg0KDQpJZiB5b3UgY2hlY2sgdGhlIGNvbW1lbnQgb2Yg
dGhlIHhlbmhlYXAgY29uc3RyYWludHMgYWJvdmUsIG9uZSBydWxlIG9mIHRoZQ0KeGVuaGVhcCBz
aXplIGlzIGl0ICJtdXN0IGJlIGF0IGxlYXN0IDMyTSIuIElmIEkgYW0gbm90IG1pc3Rha2VuLCB3
ZSBuZWVkIHRvDQpmb2xsb3cgdGhlIHNhbWUgcnVsZSB3aXRoIHRoZSByZXNlcnZlZCBoZWFwIHNl
dHVwLCBzbyBoZXJlIHdlIG5lZWQgdG8gY2hlY2sNCnRoZSBzaXplIGFuZCBpZiA8MzJNIHRoZW4g
cGFuaWMuDQoNCj4gDQo+ID4gKyAgICAgICAgcGFuaWMoIk5vdCBlbm91Z2ggc3BhY2UgZm9yIHhl
bmhlYXBcbiIpOw0KPiA+DQo+ID4gICAgICBkb21oZWFwX3BhZ2VzID0gaGVhcF9wYWdlcyAtIHhl
bmhlYXBfcGFnZXM7DQo+ID4NCj4gPiBAQCAtODEwLDkgKzgzOCw5IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBzZXR1cF9tbSh2b2lkKQ0KPiA+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9p
ZCkNCj4gPiAgew0KPiA+ICAgICAgY29uc3Qgc3RydWN0IG1lbWluZm8gKmJhbmtzID0gJmJvb3Rp
bmZvLm1lbTsNCj4gPiAtICAgIHBhZGRyX3QgcmFtX3N0YXJ0ID0gfjA7DQo+ID4gLSAgICBwYWRk
cl90IHJhbV9lbmQgPSAwOw0KPiA+IC0gICAgcGFkZHJfdCByYW1fc2l6ZSA9IDA7DQo+ID4gKyAg
ICBwYWRkcl90IHJhbV9zdGFydCA9IH4wLCBiYW5rX3N0YXJ0ID0gfjA7DQo+ID4gKyAgICBwYWRk
cl90IHJhbV9lbmQgPSAwLCBiYW5rX2VuZCA9IDA7DQo+ID4gKyAgICBwYWRkcl90IHJhbV9zaXpl
ID0gMCwgYmFua19zaXplID0gMDsNCj4gPiAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+DQo+ID4g
ICAgICBpbml0X3BkeCgpOw0KPiA+IEBAIC04MjEsMTcgKzg0OSwzNiBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfbW0odm9pZCkNCj4gPiAgICAgICAqIFdlIG5lZWQgc29tZSBtZW1vcnkgdG8g
YWxsb2NhdGUgdGhlIHBhZ2UtdGFibGVzIHVzZWQgZm9yIHRoZQ0KPiB4ZW5oZWFwDQo+ID4gICAg
ICAgKiBtYXBwaW5ncy4gQnV0IHNvbWUgcmVnaW9ucyBtYXkgY29udGFpbiBtZW1vcnkgYWxyZWFk
eSBhbGxvY2F0ZWQNCj4gPiAgICAgICAqIGZvciBvdGhlciB1c2VzIChlLmcuIG1vZHVsZXMsIHJl
c2VydmVkLW1lbW9yeS4uLikuDQo+ID4gLSAgICAgKg0KPiA+ICsgICAgICogSWYgcmVzZXJ2ZWQg
aGVhcCByZWdpb25zIGFyZSBwcm9wZXJseSBkZWZpbmVkLCAob25seSkgYWRkIHRoZXNlDQo+IHJl
Z2lvbnMNCj4gSG93IGNhbiB5b3Ugc2F5IGF0IHRoaXMgc3RhZ2Ugd2hldGhlciB0aGUgcmVzZXJ2
ZWQgaGVhcCByZWdpb25zIGFyZSBkZWZpbmVkDQo+IHByb3Blcmx5Pw0KDQpCZWNhdXNlIGlmIHRo
ZSByZXNlcnZlZCBoZWFwIHJlZ2lvbnMgYXJlIG5vdCBwcm9wZXJseSBkZWZpbmVkLCBpbiB0aGUg
ZGV2aWNlDQp0cmVlIHBhcnNpbmcgcGhhc2UgdGhlIGdsb2JhbCB2YXJpYWJsZSAicmVzZXJ2ZWRf
aGVhcCIgY2FuIG5ldmVyIGJlIHRydWUuDQoNCkRpZCBJIHVuZGVyc3RhbmQgeW91ciBxdWVzdGlv
biBjb3JyZWN0bHk/IE9yIG1heWJlIHdlIG5lZWQgdG8gY2hhbmdlIHRoZQ0Kd29yZGluZyBoZXJl
IGluIHRoZSBjb21tZW50Pw0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiA+ICsgICAg
ICogaW4gdGhlIGJvb3QgYWxsb2NhdG9yLg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoIHJl
c2VydmVkX2hlYXAgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGZvciAoIGkgPSAwIDsgaSA8
IGJvb3RpbmZvLnJlc2VydmVkX21lbS5ucl9iYW5rczsgaSsrICkNCj4gPiArICAgICAgICB7DQo+
ID4gKyAgICAgICAgICAgIGlmICggYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaV0ueGVuX2hl
YXAgKQ0KPiA+ICsgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICBiYW5rX3N0YXJ0
ID0gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaV0uc3RhcnQ7DQo+ID4gKyAgICAgICAgICAg
ICAgICBiYW5rX3NpemUgPSBib290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tpXS5zaXplOw0KPiA+
ICsgICAgICAgICAgICAgICAgYmFua19lbmQgPSBiYW5rX3N0YXJ0ICsgYmFua19zaXplOw0KPiA+
ICsNCj4gPiArICAgICAgICAgICAgICAgIGluaXRfYm9vdF9wYWdlcyhiYW5rX3N0YXJ0LCBiYW5r
X2VuZCk7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gPiArICAgICAgICB9DQo+ID4gKyAgICB9DQo+
ID4gKyAgICAvKg0KPiA+ICsgICAgICogTm8gcmVzZXJ2ZWQgaGVhcCByZWdpb25zOg0KPiA+ICAg
ICAgICogRm9yIHNpbXBsaWNpdHksIGFkZCBhbGwgdGhlIGZyZWUgcmVnaW9ucyBpbiB0aGUgYm9v
dCBhbGxvY2F0b3IuDQo+ID4gICAgICAgKi8NCj4gPiAtICAgIHBvcHVsYXRlX2Jvb3RfYWxsb2Nh
dG9yKCk7DQo+ID4gKyAgICBlbHNlDQo+ID4gKyAgICAgICAgcG9wdWxhdGVfYm9vdF9hbGxvY2F0
b3IoKTsNCj4gPg0KPiA+ICAgICAgdG90YWxfcGFnZXMgPSAwOw0KPiA+DQo+ID4gICAgICBmb3Ig
KCBpID0gMDsgaSA8IGJhbmtzLT5ucl9iYW5rczsgaSsrICkNCj4gPiAgICAgIHsNCj4gPiAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbWVtYmFuayAqYmFuayA9ICZiYW5rcy0+YmFua1tpXTsNCj4gPiAt
ICAgICAgICBwYWRkcl90IGJhbmtfZW5kID0gYmFuay0+c3RhcnQgKyBiYW5rLT5zaXplOw0KPiA+
ICsgICAgICAgIGJhbmtfZW5kID0gYmFuay0+c3RhcnQgKyBiYW5rLT5zaXplOw0KPiA+DQo+ID4g
ICAgICAgICAgcmFtX3NpemUgPSByYW1fc2l6ZSArIGJhbmstPnNpemU7DQo+ID4gICAgICAgICAg
cmFtX3N0YXJ0ID0gbWluKHJhbV9zdGFydCwgYmFuay0+c3RhcnQpOw0KPiA+IC0tDQo+ID4gMi4x
Ny4xDQo+ID4NCj4gPg0KPiANCj4gfk1pY2hhbA0K

