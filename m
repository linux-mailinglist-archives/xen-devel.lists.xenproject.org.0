Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56665FD817
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 13:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421866.667546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiw2N-0003gu-Ll; Thu, 13 Oct 2022 11:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421866.667546; Thu, 13 Oct 2022 11:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiw2N-0003fV-Hx; Thu, 13 Oct 2022 11:06:03 +0000
Received: by outflank-mailman (input) for mailman id 421866;
 Thu, 13 Oct 2022 11:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiw2M-0003fN-Ga
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 11:06:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0521a653-4ae7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 13:06:00 +0200 (CEST)
Received: from DB6PR0202CA0001.eurprd02.prod.outlook.com (2603:10a6:4:29::11)
 by DU0PR08MB8953.eurprd08.prod.outlook.com (2603:10a6:10:464::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 11:05:58 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::82) by DB6PR0202CA0001.outlook.office365.com
 (2603:10a6:4:29::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Thu, 13 Oct 2022 11:05:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 11:05:58 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Thu, 13 Oct 2022 11:05:57 +0000
Received: from de1d645292fa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 69F53177-9502-468F-B118-BC4401AAAA9E.1; 
 Thu, 13 Oct 2022 11:05:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de1d645292fa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 11:05:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7860.eurprd08.prod.outlook.com (2603:10a6:10:3b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 11:05:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 11:05:44 +0000
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
X-Inumbo-ID: 0521a653-4ae7-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PdZrru1UhYcfeMOdAgm56v0zLMg/Qd7U0UhYfFUEDmGfHCHbyz2i+lz0wVv2oy0E27+fPcJVN+4au+OIYt9wCo4JlxjSEyKIqRxv2+J0r+NgW2UZD2PwNCxOEiRDc16iaSLRq25qPd6+P+VrrCOEAoCQq2f2gjM9keZLHPkbVqmpwcJKS/TM3yOFSvvzwkVJUFUmG/qOkPnKQPZlxCaBYXwG03deBllIdFo99qBrvGbcqotr68+umCjMnLDxVuBmAYGMBM1caSezhQ3akaaf95mjC05H67Q49i5UR0x4l6V2jz02t12+x0Zpy+Wp+J2BcOjfgv1WTtN+PkmWg0y9Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2hGsz+tza4BmRvGnFdxEY33BsYLCs575k7h8s43/rk=;
 b=CMnQBn1VchPSHqtr/raxpIkAzhJGtFlDezKlfmR2Kofvm+KyZxYcBxxxHypqlqKGhFEjdEzV1lzaR9+wPIXPFkQE/VbeuJf9K05MLYgk0YzJl6DCt2ZxJOULuH5cYfW3wRmZRM9lghqk9tx/BtCTup0/D0ZeTWR0mH737q299iLNB+EOPxjJ0dqAcC4HXdMCfY2lsniXXDi7SMogZsBM09Mbr0ZGmkdHzUSJmEArYsuD0WV+8f62dIZ92l6089hYMGl//NVqN6NVSVmyk+R7FB3RSxlxO5xA9FuFWn3oKll3o50TkSdvdyKVIH/j4sLVumJImqHtkD1MVnNTxwz9KA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2hGsz+tza4BmRvGnFdxEY33BsYLCs575k7h8s43/rk=;
 b=qPfJ/uHnhjNjAiDDjWh8F2JmCnPb39scLWnmRYYGZDUeOMXnPx54XJMWImtMLXzf/IMcQDjpXGqZmG3f8GODdM46CXHpy6HugSt2J15G9QR+0h+nLGTa4yypRvMwCBNO8URflRD3WlqcotAU6KPi4V3qXBhbzTMArmdyRvyxKvg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx95tLzppuoDJ0MD+iby8NeIL8Zjgxd2jbEdQKWaxtkLd+c4naesz2BR0X1wweT1tNeYHOfv+Ib+x6qXEVN8d1lBwfU7mtUYcmd78FxOtkks4EDOtUeSf1ZVrBY2P6ezCcVNzcgQGKfqLvZ/1hLfHpDZiNe46x85ws/CWU/FLsoTeurAXPpCz7HeT81Kk679Jo0KsIt53imOceu167eRGM9hgydWIV9JjoRqCgkXMKoHqrMzvfaZ+OHKIchy5rzOQSBxfsbYDIFJDchWudt3eMw2vnnOLzD6sflBjA3cDLEJ+68gkhL2bd5B/7BtdVaW1uEfB14AH2EcUqBuI0XItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2hGsz+tza4BmRvGnFdxEY33BsYLCs575k7h8s43/rk=;
 b=mtBrEILeRxII46+LxOvRnP/QQmkNmYxTKv59PuvTDP2UoUL3KntzyCdoGjKRnwYePExdKOqbyW+QJwSJCN2pso0QTQuzEkXmwDxQmGhfaVWSjCF8zTnxlRbyPsB981wGs3nRwyOXxzCIoDjXpGJhjMDJACTxgIjjrPTywfC2imjzjHIr7UjxGtLVABLn2/Qzax0FtRjhMUK6k+SuJc8cQ0HrH7vx5L7a9ZraJFz8SAo4wJHqv6xh6fozAvYse49tUAffqaWoHUOAByP2I1AGic3UpepgPHC2MPq2KjRPYqps2N/mpe6rfM0Rf75rALJ9MXis5CWGj92W+/kC3rBnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2hGsz+tza4BmRvGnFdxEY33BsYLCs575k7h8s43/rk=;
 b=qPfJ/uHnhjNjAiDDjWh8F2JmCnPb39scLWnmRYYGZDUeOMXnPx54XJMWImtMLXzf/IMcQDjpXGqZmG3f8GODdM46CXHpy6HugSt2J15G9QR+0h+nLGTa4yypRvMwCBNO8URflRD3WlqcotAU6KPi4V3qXBhbzTMArmdyRvyxKvg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY3t81xdeRddBbSEGLoF20gErPe64MCngAgAAAYwCAABzHgIAAAcyAgAAAK9A=
Date: Thu, 13 Oct 2022 11:05:44 +0000
Message-ID:
 <AS8PR08MB79917792FD8A7695C969020992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
 <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
In-Reply-To: <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 808D1175FD59EA4C8046F3CAD74C3793.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7860:EE_|DBAEUR03FT033:EE_|DU0PR08MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 9740cffe-519c-4c2b-2754-08daad0ae80c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jr2E3lS3RPGKfiGecZX3HHJ49297sveXMWj0GHTb5i2E0U7MlfM7armzAvZbkTyJ2STFJa3iUuy60wYGLzBgktW1jj5phqKwBNLaiVBFhnJDNFXYiQXjpZKkmj/YT+XaaAwN12Clsr9K3W8oJr7G+HQqD21CZfuMcYFdediguSzvE9O1uxDoBY6jo4wnL8Nj3Ux5XQXuTYt6kmZEhfZTXt+o6/kuE/7Hyoc+nJGWl7xkvepqOuhCT4SiE8hV3FLFtHjuW60+oBlWS1xgK2gDbc8DGM/dJxpllSHdMXHY1FUovXHcKafdbHznNqk2IRKJ3u59qSXHVO9jl1oD9jxj7ICYfLo5wuT0caKuVix+uSdaNEwSBOQuoiJ5xtoKBs8hLB+GA8WTD4ZEqgdDdpgsHo/LTUw/VMBBVQg8CQubwcClI3ZLe6tm+juf+gSemZxNsvswACusDau5rZOFE75464/jxVAupJSzx1GfzkQhp/KiazD5taKmr3bMLJevPF+JxFGo15uDj+gSTFRNceaXUK2v2kYB6ufjgPeEvamhmcVWbD+ikfuiqmWufVjtMlCn0h6N21xWze1LOYDMZaTZcfq6bQhGLaRDHEHS2v1I+ziCbIRUuUEvZ81QumMFSj0hmbTaJjTDNRzQgkSaid0NnuuBuliiJ4ngIFpscQC+aN2DgbDVhlJZqHGCFRm0fYW/TkZw6SzKXrnN+0tfoVWfj1Tywj+2kULhvrGgY7OmIfj/9BrBSrq0nuEOyLaKgNmXQcRZzq2h5fJYu17FXHrOhw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(26005)(6506007)(53546011)(7696005)(122000001)(38100700002)(4326008)(66556008)(64756008)(316002)(55016003)(8676002)(66446008)(66946007)(71200400001)(76116006)(66476007)(38070700005)(86362001)(33656002)(186003)(83380400001)(478600001)(54906003)(2906002)(41300700001)(5660300002)(8936002)(9686003)(110136005)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7860
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f423bf99-b487-4890-b2a9-08daad0ae02c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x3cYjcAc7cimeh+qJpR6xMoJrAk8DQG576TJywpHG+OWECFBJZIyXFot9bkjBvXnBqwtmMEuta0E+11if8rMWZBwD4cyZz/Y9qgh0e9TxAwNmY9e1BGp9QM8Jl65UqnR9QMHOq1xAhbEktKO1zT3+lAWmC3z1tTqEzU22DhahvFM8GZ2P4ZNiRG2LwhTjLUN2Nh77K4dtcFGaAFSYd2mZkXGVHaw7OvIY+y7Nque66yxVbcbJlh6YUyrnLho7BJc1gspAyQPTw8oDc8MTuxoRmW2m+OOnLdta5OBh0+6jNWAub5TkV/hBhgaYpQthCE45Mw2c/VGtgrpuF3pJ4e6WQw6JP7t+048Ku45yJUFnxytHG0KJf0gqIuS1U09tNavFCJ7M3SfmLwkhldnTzEUTViukzJ5RC2LgmRNSNqhPdg+2NeqfLXUOMuqQF11I09oj2VVaqboKXVUE80fvQUEOYBAUR8/3QrvmIMvCtrLeESjrU2OVEvZYV3IqgFqvQmEZ8jOAls6LQYjZmdIIFh9uQ1mLgBMPhfLQRUWRnnzQOzV9dtM9HREme5OpXvwzSvUgjH0Ws0TBapa9kIyL4yir4B7vFM+SRGNAm7nsxIJOLjuJhf0TPfwkInQDiD8CFbqjPC57aXawoxRIcVW9Mdd1sNoKnOsRLQ3NgdHuGUctFYdo45IveOVd4ITrGhQei3pWrnsmuMbTN08iY02F6CA++6nWjYGdnGUB0f0Fdwf6nvhciD7MLM5CMIj+2GA1fAicXgPv1ebooL3Jch6A6UD4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(33656002)(82310400005)(40460700003)(2906002)(4326008)(5660300002)(41300700001)(52536014)(8676002)(316002)(70206006)(110136005)(86362001)(54906003)(70586007)(81166007)(356005)(8936002)(82740400003)(478600001)(36860700001)(9686003)(53546011)(336012)(83380400001)(40480700001)(26005)(6506007)(55016003)(7696005)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:05:58.0735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9740cffe-519c-4c2b-2754-08daad0ae80c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8953

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4vYXJtOiBw
Mm06IFBvcHVsYXRlIHBhZ2VzIGZvciBHSUN2MiBtYXBwaW5nIGluDQo+IGFyY2hfZG9tYWluX2Ny
ZWF0ZSgpDQo+IA0KPiBPbiAxMy4xMC4yMDIyIDEyOjU4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
ID4gT24gMTMvMTAvMjAyMiAxMDoyMSwgSGVucnkgV2FuZyB3cm90ZToNCj4gPj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPg0KPiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL2FybTogcDJtOiBQb3B1bGF0ZSBw
YWdlcyBmb3IgR0lDdjIgbWFwcGluZw0KPiBpbg0KPiA+Pj4gYXJjaF9kb21haW5fY3JlYXRlKCkN
Cj4gPj4+DQo+ID4+PiBPbiAxMy8xMC8yMDIyIDA5OjM4LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+
Pj4+IEhhcmR3YXJlIHVzaW5nIEdJQ3YyIG5lZWRzIHRvIGNyZWF0ZSBhIFAyTSBtYXBwaW5nIG9m
IDhLQiBHSUN2Mg0KPiBhcmVhDQo+ID4+Pj4gd2hlbiB0aGUgZG9tYWluIGlzIGNyZWF0ZWQuIENv
bnNpZGVyaW5nIHRoZSB3b3JzdCBjYXNlIG9mIHBhZ2UgdGFibGVzDQo+ID4+Pg0KPiA+Pj4gQ2Fu
IHlvdSBkZXNjcmliZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hhdCBpcyB0aGUgd29yc3QgY2Fz
ZSBzY2VuYXJpbz8NCj4gPj4NCj4gPj4gVGhlIHR3byBwYWdlcyB3aWxsIGJlIGNvbnNlY3V0aXZl
IGJ1dCBub3QgbmVjZXNzYXJpbHkgaW4gdGhlIHNhbWUgTDMgcGFnZQ0KPiA+PiB0YWJsZSBzbyB0
aGUgd29yc3QgY2FzZSBpcyA0ICsgMiwgaXMgdGhhdCBjb3JyZWN0Pw0KPiA+DQo+ID4gU28gSSBh
Z3JlZSB0aGF0IHRoZSB3b3JzZSBjYXNlIGlzIDYuIEJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2hh
dCB5b3UNCj4gPiBtZWFuIGJ5ICc0ICsgMicgaGVyZS4NCj4gDQo+IEFzc3VtaW5nIHlvdSBoYXZl
IDQgKE4pIHBhZ2UgdGFibGUgbGV2ZWxzLCBpc24ndCBpdCA3ICgxICsgMiAqIChOIC0gMSkpPw0K
PiBPciBpcyB0aGUgcm9vdCB0YWJsZSBub3QgdGFrZW4gZnJvbSB0aGUgcDJtIHBvb2w/DQoNCkNv
cnJlY3QsIG9uIGFybSB0aGUgcm9vdCBpcyBub3QgdGFrZW4gZnJvbSB0aGUgcG9vbC4NCg0KS2lu
ZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

