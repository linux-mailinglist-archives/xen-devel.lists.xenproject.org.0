Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EB358DB5F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 17:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383039.618146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLRWe-0002Ga-P2; Tue, 09 Aug 2022 15:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383039.618146; Tue, 09 Aug 2022 15:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLRWe-0002Di-Kv; Tue, 09 Aug 2022 15:52:12 +0000
Received: by outflank-mailman (input) for mailman id 383039;
 Tue, 09 Aug 2022 15:52:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEZx=YN=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oLRWd-0002Cm-3p
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 15:52:11 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30043.outbound.protection.outlook.com [40.107.3.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39eb1f1d-17fb-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 17:52:09 +0200 (CEST)
Received: from DB7PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:36::17)
 by VI1PR08MB3199.eurprd08.prod.outlook.com (2603:10a6:803:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 15:52:07 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::6b) by DB7PR05CA0004.outlook.office365.com
 (2603:10a6:10:36::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21 via Frontend
 Transport; Tue, 9 Aug 2022 15:52:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 15:52:07 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Tue, 09 Aug 2022 15:52:07 +0000
Received: from cc4213433cb9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E87CD9B-0D9C-40CB-BE09-64FD0699341A.1; 
 Tue, 09 Aug 2022 15:51:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc4213433cb9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 15:51:55 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 15:51:52 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 15:51:52 +0000
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
X-Inumbo-ID: 39eb1f1d-17fb-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YrqRk20ve9LBAXs6697cJi9JLI5KxXVF5agMFeC3PTU6k5qsQWxoruVwRQ6NdedNDkKmZFzKxRTyd2QYRy1acR8h8g4ZSOkpZ7dTLClko8GGGIRGeyyTrh31YlW6DumzkA+B1/QEE8dQQ5Krh+WwoyMMbuzfFbOnCYmgL0IIhrEFOAQjV1G3c2mip2AmN96MSpY5IrTEr0ZTfdPpi6sVXfkYuyhfMAASBtge4s8zAhn320KUzTNTKc5w0ap4ROrwgdzqpoV9P9BUtl/iSXyOy7laFuMqdwpDZMyDE2Dwb1GMIn8+pWqtUDoVI+JGDUTHFgkunbWQ8izoOMvovA6rlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od+KecJCNPVCEehzJeJRC4V/NyG90OB7EfBVXM/9Y/Q=;
 b=TYW0Idgc0CjgXdA7h0IkZ53TMk14AbgLuq5bSfYlVaMDJsiJoTkB5ytkhS6V4epE7p2W0+XlH95Z4JZFVjs6x52jOvk5G2K4ZlF9MHFzp3g80m9plyBFDGtd72l6jyRuswF+4bf1O1GfidakSGtsvvZHlL5DN59k6vVOHE/vw3AeRxtJ+mL081ET4dl01t8Dk5IDRj0mSuLidLPrjuGD5G8SiiK/QNbAk/QesFK9EQCQqnzsN4Vg7S/PO89q6+IkVHLiAkSV3YnR9NZ2c/TJkYdvE66LoAcCtt7uqjBFhxZvBuvA2hGoKhAvGToqWmfUVOP8n4WAv5F84j1WOFCvyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od+KecJCNPVCEehzJeJRC4V/NyG90OB7EfBVXM/9Y/Q=;
 b=bvPpkAuJw8JHtlwi4/tXNtPP7Clr8K9J4dlH2HpOoiW4QBMcTGp8z2kQRmT+mNMEjQcTbl2dVCaSh2ICq77YRkbY4s7FMxHDqxBbnc68G46cQM5e30uennNEp8D9H0anR8lNAy5Fzu3NPoPpRVKGFEp/zNs8rCEz3EYNxaBz+/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a270cdcb05095f4b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnOZcQ5dnmbbHLXFLTfpnshoMJuM3NF90wpMdqP7hiewRvHGs3vkek6A1PUV3fOMmUiGl5K/5ImIZ08hPBaOuD/TYt1+0fj20iqTN/TdCP0W66SD2NArA8RQj+XevytQygsMJM44NwyRVF9QVkaBtyIauDzMhLdDhISBaxp4ebFWBWYIVRU298lN4L6A6tL679tIzsu3MLSMV25qbZopd+x2bFtSm37HszwnhoEDaInkNRpYyEHH4q1DCu0O+tjBQYbNd3TyoO5rXbuY9askyuxvxUXsHcNG5b+5Fx05I4JyJFrRd8HM1pbrnGsGQxC0hXLttXM9MkhKAn+rMP/xkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od+KecJCNPVCEehzJeJRC4V/NyG90OB7EfBVXM/9Y/Q=;
 b=KksE62B2HVD0wnXRYAKOD00iYHhQ0PIEML3BoBvUKVobe24VuVRW5uXEpb9sQ5mhkxLp54sG+AKKUHglMQQI11yFN/fOGNvgFEGMwB7vG+iCBe3thJyxMUO3LAzS9tqeUE81OLC+A+SCLNw/0HpmUybTrY772wzTwa8j+DAJ6RkvOnhCQ/3BeUiDB49q0UgiJRZFykY3DXMtjOEQXcP0wju6a1Z1LP8k2cXc41lAMWcYJs4X1zWFo/wKClyEaswMAz5A+RueeCMgFKme8IbQLlQ5YQ3kuYI/qvIVUZQKY6asgc3KDQtvhCxjyY6OfJY3smAmU46I6WZOX3S7EE/mMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od+KecJCNPVCEehzJeJRC4V/NyG90OB7EfBVXM/9Y/Q=;
 b=bvPpkAuJw8JHtlwi4/tXNtPP7Clr8K9J4dlH2HpOoiW4QBMcTGp8z2kQRmT+mNMEjQcTbl2dVCaSh2ICq77YRkbY4s7FMxHDqxBbnc68G46cQM5e30uennNEp8D9H0anR8lNAy5Fzu3NPoPpRVKGFEp/zNs8rCEz3EYNxaBz+/s=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Thread-Topic: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Thread-Index: AQHYqOI28IdG0PHJfUiTCQKz3s6xa62ms9EAgAAKSYA=
Date: Tue, 9 Aug 2022 15:51:52 +0000
Message-ID: <A7BCD311-F39E-4ABD-BC43-BE3DE95F5066@arm.com>
References:
 <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <6c8defc0-3197-14cc-64ba-1ef140d6930f@suse.com>
In-Reply-To: <6c8defc0-3197-14cc-64ba-1ef140d6930f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 44933c0b-a5ab-4c5c-23e5-08da7a1f1cd8
x-ms-traffictypediagnostic:
	DBBPR08MB6073:EE_|DBAEUR03FT030:EE_|VI1PR08MB3199:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Wb5B3diIJk7sEOAFJdVA0my5+QsBrN7w5d3DT1CiiLh9jgCDxtlOf7MgtifA/6IW92AUq0aa/HPYPYYh4N90IROY1NpBMkyW9QoHMnIWIFt4jiFAaDxvKLQ8NexGdLCQd4mttLr3Ye1TSc/DJP89N+4zeHhEKZ4C8Mh50uMGviMXgJoknzhN9yDefD8VtTR10ldrvKFeK/QLH36k0kDK6xHZJk/4xj4bsJQmTQ2pb6O/Y3OmiXKgP8r6ICs9/0AWCWUlMMifheU+z6Gu+M8X0bU8S/JpgJOiLizVNkkgJvBSZFb/MCmWh6TEbj5reSOhdDJndd9qI66nK3Lbdht87cj1o0Qn6pZ7FtQKY6jU9BW7SgB1NbW89+piWA7J0mp28QGriWRxHlAgIg/so57vJffvfkVS2TEfY/BUyeHS4GLCoxa7s/p03qsxZJJlGbf9dp/NEUK8DpB00k2xyCaor2/oyDGESbFOltrpYZvHvrAM3RSjZumiXYxyDT4mMJcV0qyZ6fv/mynwJsWbQFoNRzouGmKYF+vT8xMCkCpOXoozTuLHf+QmBq3GsG9NX9LXMfY9hXzgQ6aW07BshrjH6bGPm2qSgcYSrfiiAj8d9gCBKjxgqp86x3sEhDhSfPH6uBsaNGyOpxDXPtNxrKkCE7M660PO4UwcfnkKG6Y13/DkcJDYQNbpN6TAUA67yNHT3ThAL7gOZnJnJZb8Yr5w16A+1Fz6G73m1QahNCWEITexzXWAVq9pL4bQM7tDIRtwkhwT/8Z6IU/7/XLqenRLgJ/b4+CmC5F8UZFunZTJjwXghVmIQMNMynpdXzvZ1/yIWidjX8rwZgaRmGQ5KPB7dQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(6486002)(71200400001)(6506007)(478600001)(53546011)(41300700001)(33656002)(86362001)(2906002)(6512007)(2616005)(26005)(186003)(54906003)(36756003)(6916009)(8936002)(91956017)(4326008)(8676002)(76116006)(66476007)(66556008)(66946007)(64756008)(316002)(66446008)(38070700005)(122000001)(38100700002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2569F39FF8353B408DDFA98DAE475F21@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6073
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be11eb34-b323-4dd1-e5f2-08da7a1f13ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Ikt680Em2YZyBwsIh5tH1jh6mVDytl0C2ea1UXv3u6TKWW4QRBmz3sNezqQHuMMtiQhvHdddsVjmqnpSfJ7VYaPqX5eEp3aVogTjtarortrZnkjgqNucRJhk1giZclxwBGqv9tiHKxxZMFqtV3V33/m2kwivnubHOPTxyyphJ5E+MorjxQB+Tr7N99kLFgzCV5Bu46iYpjSm2nnAed0u0eG64uSCtUNJl3yJCTYDhzVlT5i1D/Vt9woHI3vdydQldNZoyL9e/jdunpTaF52xDT9gG+xX7Hk6+CbAfaklYAlvMX/RsGjc3Uv8uCkw2tZJhs3Y14OcOHQIshB6zgUml2xtgVA3YRkRkkSpkWwJfu+bOIrSM7DYA941r4N6pZfv0yOQ21ZTARk3CqfYoyP6UpmZ//oDOUiIkILOsGwCq6ZLICH3S+5xxtOeO2xv4qtv8BisyGOpzPCGBfBp45ISWSP3EC1OWegGOoSE2clnGLuXqecK6BeOAjdJYPKsGdGcjfTNc9VrUQgdaeOXCQmuAF7HpLrfeI0su6GSwbgd7cAMfO9Dj21EMVPVEtR0wNm75qSu915Okvl3vCnK/ppgcY/oDtX8bXnmABfbIbS101mJUrj78dHIaizL6wOTy8cpG/w86kPVTNScqokM9LX6Q6GcI3k9BusViFDF1GdobRr8T8Kdc9XTcBzOi3lQO1zg4I8VYNwK1hbspcjW72i3cC7/PLgcV1UF5Tws8SlbUffOhgJMFjOBgn6wpOz8J+kYYHpZGgt1CeYNcDJRCMMoxwh4NlKnYmyJnltArhvdYc8WxspQgx8W4ZYdDpRCXtz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(70206006)(40480700001)(186003)(336012)(36860700001)(36756003)(41300700001)(8936002)(6862004)(33656002)(5660300002)(47076005)(2616005)(53546011)(4326008)(2906002)(86362001)(82740400003)(356005)(70586007)(54906003)(6486002)(316002)(478600001)(40460700003)(82310400005)(8676002)(81166007)(26005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:52:07.2848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44933c0b-a5ab-4c5c-23e5-08da7a1f1cd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3199

Hi Jan,

> On 9 Aug 2022, at 4:15 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.08.2022 17:43, Rahul Singh wrote:
>> pci_get_pdev_by_domain() and pci_get_pdev() functions find the pdev in
>> the pseg list. If pdev is not in the pseg list, the functions will try
>> to find the pdev in the next segment. It is not right to find the pdev
>> in the next segment as this will result in the corruption of another
>> device in a different segment with the same BDF.
>>=20
>> An issue that was observed when implementing the PCI passthrough on ARM.
>> When we deassign the device from domU guest, the device is assigned
>> to dom_io and not to dom0, but the tool stack that runs in dom0 will try
>> to configure the device from dom0. vpci will find the device based on
>> conversion of GPA to SBDF and will try to find the device in dom0, but
>> because device is assigned to dom_io, pci_get_pdev_by_domain() will
>> return pdev with same BDF from next segment.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> Actually one more thing: While you're working on vPCI as I understand,
> the subject prefix here really wants to mention PCI, not vPCI.

Ack.

Regards,
Rahul


