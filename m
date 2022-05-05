Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CBC51C127
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 15:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322149.543364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmbmt-00087V-Lo; Thu, 05 May 2022 13:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322149.543364; Thu, 05 May 2022 13:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmbmt-00084W-IT; Thu, 05 May 2022 13:44:59 +0000
Received: by outflank-mailman (input) for mailman id 322149;
 Thu, 05 May 2022 13:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxCF=VN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmbmr-000847-Mh
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 13:44:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89943608-cc79-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 15:44:51 +0200 (CEST)
Received: from AM6P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::25)
 by AM5PR0801MB1905.eurprd08.prod.outlook.com (2603:10a6:203:43::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 5 May
 2022 13:44:52 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::6e) by AM6P194CA0012.outlook.office365.com
 (2603:10a6:209:90::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 13:44:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 13:44:51 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Thu, 05 May 2022 13:44:51 +0000
Received: from e87e99e6af7a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 436D0B5A-D641-46BE-ACE8-59ECCD6877CE.1; 
 Thu, 05 May 2022 13:44:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e87e99e6af7a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 13:44:46 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by PAXPR08MB7035.eurprd08.prod.outlook.com (2603:10a6:102:207::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 13:44:43 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 13:44:42 +0000
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
X-Inumbo-ID: 89943608-cc79-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RVK/23gRDogmS0UajxkDoWi7Svkjw/bC/5AYyjymKm1zfwx1OLMNGJEO4SZXOg1SaxJoXxqIO+oC9mDiKC7KjAkk+djk5YahBSb11uWYuKcI+9Jwg9hO+rFyVAFER5iKWTjj8QyAZrgV28Q9Kibxg3mqi4mk93gmi+EjLyWDKFezC858NmTMkof7E2xTNjucEQOPxV7ydSOKfVXAXgFuJpeiDYATUkvMwDiRRJlfgZIU/y6QVqopM1iVVCAd1Ux1xtqItbsG4m1BACWOx9YJLxcDSUHun1ze1V1HTh/djWT6+oyEGB0PHnS4Emq7JxOnClHiBqEZX6sGaWnF6T8DkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30gKdXD5EI40lISPx9UXSUYITHyg6VythMuIYcJ6Qto=;
 b=dgrnz5I/i/6fWXC/Bk38L1n3rUOFTdv/8f7L+vCd0aCUhYoY9x7Xsyh+ePoXXOezo6PHDhrArfx6MrKEXl/5AX0+Z+lvnAYBjZ1u+59qxR3geHiWokCC/QHsEjZRDWeJeYo9bYqmnRxyb453GFh9PsVKztwRiZbfvdRNbXdXtlEHYj00Tj/+QHfrap9u05Nr1QkBmUMgdm8FJ/hX2tBPZgqigH5nnVn2oq4iFErPR4Tjl6XZdIMo7SgxBeckwBQ3MaFYScPtZFSiXSALBvoVvU4JGWE9kw0oIUJ6ju3yh/YqmImpFjvoyxHL4iMla32TRb6uwxNg5WbgXzYdsg+afg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30gKdXD5EI40lISPx9UXSUYITHyg6VythMuIYcJ6Qto=;
 b=HyU4elX5TxV+IoA3eulmv1DWxmrTFEf/T0GcCe2xeTm18+n8+EOtSwda24P9RrzKWY6HGBa+5YFRtYFO3yF/ENAnZ4Xt2VZpu99mq7EKNYe3MxzXwnQX4ldl/F/TW05tai2s1Crv8g71pozB7DL24RLJ4PZ20zOc67ZwQ9UPPw0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qawr8E5m9d5DzFs6D9LKhTYO/ckf8V/W7spP7lifsXhyWy7kU8/UG58xqiS8f0vEl6QtQjZMKDSkrL+hpVZZsAhFz/LyVLAlqhHvEx5OGQ7hq2FhX6VxJO4Z10kOwjhvK2np4emvQkxK90sbMCbx+IWHTRnzZltpQzxiRlZLOiE7tno/I92oZtc8kB9U7NV0Gi3z3Q2gdMFexO/Cl8TC/FP8hAajasmlUZdozpGK0I3TT2L2fjlZlriwylsx6UnyfGmbYyanu9fX+zbUsF+TTubAmVLfuV336R3bLc/2GSV4UVUklTVBpjBvPcJAraw5oGzBWWAWoUWYUqpqv0ZOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30gKdXD5EI40lISPx9UXSUYITHyg6VythMuIYcJ6Qto=;
 b=ogWiE9FzhQy14xZDrE5A0Nv2fLjlLagM7wtJDxeQ2hof5x9sqO4wYYkbJJ7yZ+uayYCzim/xvn6a8dd+ecozY0K1LX/lMioA72VcQizcVTyFWoIKfkr0oY4A2KtoEPxlQPwyD0cJQt9NoS2/Nq2VlieYS5lralWtxIEw1RJDKyI2kYGhtSTBK7N7KVQo3ggUerz9zZBbvgeM523eEgfjSe1kMMLIn2gLx/mnJyQjwvDrTdhPhx/Ad61h+APSHX45/OgwGXycq/lW4RoHE7qwSpFTO6CWMgCzrFuCRzLGPAa85fp9vYSBzTPfFbd28qPYoZF4DVWmLAkZe64ENteXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30gKdXD5EI40lISPx9UXSUYITHyg6VythMuIYcJ6Qto=;
 b=HyU4elX5TxV+IoA3eulmv1DWxmrTFEf/T0GcCe2xeTm18+n8+EOtSwda24P9RrzKWY6HGBa+5YFRtYFO3yF/ENAnZ4Xt2VZpu99mq7EKNYe3MxzXwnQX4ldl/F/TW05tai2s1Crv8g71pozB7DL24RLJ4PZ20zOc67ZwQ9UPPw0=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index:
 AQHYWhlFOdBlNRd7J0aYNs5h64D4UK0OxgEAgAEVjwCAABi4gIAAB8rggAAKIYCAAAcaUIAAL5+AgAAR4BA=
Date: Thu, 5 May 2022 13:44:42 +0000
Message-ID:
 <DU2PR08MB7325CBB8EFD65D2BB64E92EBF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
 <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6ee0b5b6-e099-c17f-48df-58ba1deb4066@suse.com>
In-Reply-To: <6ee0b5b6-e099-c17f-48df-58ba1deb4066@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F5543EAA1FF1E24CB3C4F53CC915BB4C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4db717ea-c20a-40ef-a575-08da2e9d6e1e
x-ms-traffictypediagnostic:
	PAXPR08MB7035:EE_|VE1EUR03FT006:EE_|AM5PR0801MB1905:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1905FE89276654ADDEDC77B5F7C29@AM5PR0801MB1905.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ieAiGseEfScHXBZBQiRxmu5wOmRHR78qBge/7VULS7mH7SWpCuBgeqP+CRMQVXtW955bupzyulcHZtD5oIMuyFHh3q9x0katXHWodiBSpmWJgzZpKU+ehRoUJ+pviqGE9QWpBgyHfDj62N8iVrlCxDxvGSK7nyU3eGJiMqUflIFSU0O9TZZUAVB5bhgQcWzTB87ubkn1h2vEc8zH4WRVT8SnGB1nTSxGN9DwLNto5LUFGNDM38H8kCk7T3agHnYN18VuSgU7HzAGuS/lLY3IUaJhOjmWeHPXFVuNvqONsYwlVgz2Gx3EYM5IX19aAWSCVUKT1S295zPK9qkyW8UyKT943dG/qn+p3ro7IWVr+IT9juGDd5v7MINLEPlF7vMRtvn3Bkv3MDbQl2cQMxs2suSARHKdfLXzvbV6Za1Xong1f4xw20NLzXKsVqYSuTE6zL4VMJrK8RGLP/Gm7uWkbg2WbLuo1EPybZe4yBkdfTPZHwmztKkjwgP3xpr9ZhZAuowqVUSpXcykPtZyk+tthuklF1Hp203NqUz4bN7S3LC3cXHQ/LZZTdy5lK5RKX/gAct3hDsVBejk5ysltOOPaM7vTvxsxmrdQR16mKImxHIPrx2qAiDn0Hbb+/BY8/tu8XXGd3nddJQSxll5UcSpZAVAFO4MDLJylXAQZYTnyB6Lw64xK4yA0w8sKGgi4I6/OY7rMgU+dAq3Xl/b3+JhGZ4W37QssTZS5rL6N+iuhTA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(7696005)(122000001)(86362001)(38070700005)(38100700002)(66446008)(71200400001)(8676002)(66476007)(64756008)(66556008)(76116006)(66946007)(4326008)(55016003)(8936002)(52536014)(186003)(33656002)(316002)(2906002)(5660300002)(53546011)(508600001)(9686003)(26005)(6506007)(6916009)(54906003)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7035
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f7af2d8-bd5a-40df-45e1-08da2e9d688a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kf9D6u0EirFeIwpLN3Oc/0KT4CfCHBJJoUahf6n3etkthLcknSho131Vtm06EypuyUIHGqpRKPRleCWiuWsZpzeWeUTlz039inRXkcBCis5nnXIM5t4cSYGwDWLP3mWiWmEuEUlhojwhSEK/XPNpdd9nJiycRtMuAzS1mAPHtX2WV5T1w6XKQfE3zb8ABSCe07X2CmN2A1Ch9MpgobB5P6y2nmIb2Nnm8c29D9Q8kQUxms7f7Ij/FRDUCCTtJYlDh5sCm1T15tE9T0VNic71bUGD6PfDwj1XB245tMrq0TMtMtGho5xBI7/ZklvSfc2ff6MT3rxu2lt6DC7eBv/HUS1d7dqwuGCXqY5vgSHKwUrOSRAJvlL/JQdLS+5dmHQyGuYoBXGdTUT42w4x0w9TfdIx5uHTOTgd7I/9ZeCm7qBxrYJ1Omc5akOA3rXZKtkaV5RTobUR2PEyFhL5wmVPEERoMoIIKOqF3zae/UmZA80BPcZty7niD70l7L+7++U0dgOr1Z2qt5eKWfctkKWZaGloQB/QAJHQv2wG9pG612UeFole3SM+3T6SnJExdhi0vxNv9FtIqdM6KcLjfHe+K8urhfBRCiKcEAmOQV3csWEOgCLBkVbi75faydkHghrU2XoiapwTQpSHqH2Wt/iTyDyUGzjV7NTLOg7Tt7f1Rb2sMx3g3s5MuLgnZdW6TdKv6DrV7XfgG9n5SmghONvP8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(36860700001)(40460700003)(86362001)(83380400001)(55016003)(33656002)(316002)(8676002)(6862004)(4326008)(54906003)(70206006)(70586007)(82310400005)(6506007)(8936002)(9686003)(7696005)(26005)(53546011)(47076005)(52536014)(508600001)(336012)(81166007)(356005)(186003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 13:44:51.7341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db717ea-c20a-40ef-a575-08da2e9d6e1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1905

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDUsIDIwMjIgODow
NyBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47
DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA2LzZdIHhlbjogcmV0cmlldmUgcmVzZXJ2ZWQgcGFn
ZXMgb24gcG9wdWxhdGVfcGh5c21hcA0KPiANCj4gT24gMDUuMDUuMjAyMiAxMToyOSwgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIE1h
eSA1LCAyMDIyIDQ6NTEgUE0NCj4gPj4NCj4gPj4gT24gMDUuMDUuMjAyMiAxMDo0NCwgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBG
cm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+Pj4gU2VudDogVGh1cnNk
YXksIE1heSA1LCAyMDIyIDM6NDcgUE0NCj4gPj4+Pg0KPiA+Pj4+IE9uIDA1LjA1LjIwMjIgMDg6
MjQsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiA+Pj4+Pj4gU2VudDogV2VkbmVzZGF5LCBNYXkgNCwgMjAyMiA5OjQ1
IFBNDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMjcuMDQuMjAyMiAxMToyNywgUGVubnkgWmhlbmcg
d3JvdGU6DQo+ID4+Pj4+Pj4gICNlbHNlDQo+ID4+Pj4+Pj4gIHZvaWQgZnJlZV9zdGF0aWNtZW1f
cGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGxvbmcNCj4gPj4+PiBucl9tZm5z
LA0KPiA+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgbmVlZF9zY3J1Yikg
IHsNCj4gPj4+Pj4+PiAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiA+Pj4+Pj4+ICB9DQo+
ID4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+ICtpbnQgX19pbml0IGFjcXVpcmVfZG9tc3RhdGljX3BhZ2Vz
KHN0cnVjdCBkb21haW4gKmQsIG1mbl90IHNtZm4sDQo+ID4+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX21mbnMsDQo+ID4+Pj4+Pj4gK3Vu
c2lnbmVkIGludA0KPiA+Pj4+Pj4+ICttZW1mbGFncykgew0KPiA+Pj4+Pj4+ICsgICAgQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7DQo+ID4+Pj4+Pj4gK30NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBJIGNhbid0
IHNwb3QgYSBjYWxsZXIgb2YgdGhpcyBvbmUgb3V0c2lkZSBvZiBzdWl0YWJsZSAjaWZkZWYuDQo+
ID4+Pj4+PiBBbHNvIHRoZSBfX2luaXQgaGVyZSBsb29rcyB3cm9uZyBhbmQgeW91IGxvb2sgdG8g
aGF2ZSBtaXNzZWQNCj4gPj4+Pj4+IGRyb3BwaW5nIGl0IGZyb20NCj4gPj4+PiB0aGUgcmVhbCBm
dW5jdGlvbi4NCj4gPj4+Pj4+DQo+ID4+Pj4+Pj4gK21mbl90IGFjcXVpcmVfcmVzZXJ2ZWRfcGFn
ZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQNCj4gPj4+Pj4+PiArbWVtZmxhZ3MpIHsN
Cj4gPj4+Pj4+PiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiA+Pj4+Pj4+ICt9DQo+ID4+
Pj4+Pj4gICNlbmRpZg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEZvciB0aGlzIG9uZSBJJ2QgYWdhaW4g
ZXhwZWN0IENTRSB0byBsZWF2ZSBubyBjYWxsZXJzLCBqdXN0IGxpa2UNCj4gPj4+Pj4+IGluIHRo
ZSBlYXJsaWVyIHBhdGNoLiBPciBhbSBJIG92ZXJsb29raW5nIGFueXRoaW5nPw0KPiA+Pj4+Pj4N
Cj4gPj4+Pj4NCj4gPj4+Pj4gSW4gYWNxdWlyZV9yZXNlcnZlZF9wYWdlLCBJJ3ZlIHVzZSBhIGZl
dyBDT05GSUdfU1RBVElDX01FTU9SWS0NCj4gb25seQ0KPiA+Pj4+PiB2YXJpYWJsZXMsIGxpa2UN
Cj4gPj4+Pj4gZC0+cmVzdl9wYWdlX2xpc3QsIHNvIEknZCBleHBlY3QgdG8gbGV0IGFjcXVpcmVf
cmVzZXJ2ZWRfcGFnZQ0KPiA+Pj4+PiBkLT5ndWFyZGVkIGJ5IENPTkZJR19TVEFUSUNfTUVNT1JZ
DQo+ID4+Pj4+IHRvbyBhbmQgcHJvdmlkZSB0aGUgc3R1YiBmdW5jdGlvbiBoZXJlIHRvIGF2b2lk
IGNvbXBpbGF0aW9uIGVycm9yDQo+ID4+Pj4gd2hlbiAhQ09ORklHX1NUQVRJQ19NRU1PUlkuDQo+
ID4+Pj4NCj4gPj4+PiBBIGNvbXBpbGF0aW9uIGVycm9yIHNob3VsZCBvbmx5IHJlc3VsdCBpZiB0
aGVyZSdzIG5vIGRlY2xhcmF0aW9uIG9mDQo+ID4+Pj4gdGhlIGZ1bmN0aW9uLiBJIGRpZG4ndCBz
dWdnZXN0IHRvIHJlbW92ZSB0aGF0LiBBIG1pc3NpbmcgZGVmaW5pdGlvbg0KPiA+Pj4+IHdvdWxk
IG9ubHkgYmUgbm90aWNlZCB3aGVuIGxpbmtpbmcsIGJ1dCBDU0Ugc2hvdWxkIHJlc3VsdCBpbiBu
bw0KPiA+Pj4+IHJlZmVyZW5jZSB0byB0aGUgZnVuY3Rpb24gaW4gdGhlIGZpcnN0IHBsYWNlLiBK
dXN0IGxpa2Ugd2FzDQo+ID4+Pj4gc3VnZ2VzdGVkIGZvciB0aGUgZWFybGllciBwYXRjaC4gQW5k
IGFzIG9wcG9zZWQgdG8gdGhlIGNhbGwgc2l0ZQ0KPiA+Pj4+IG9wdGltaXphdGlvbiB0aGUgY29t
cGlsZXIgY2FuIGRvLCB3aXRoIC1mZnVuY3Rpb24tc2VjdGlvbnMgdGhlcmUncw0KPiA+Pj4+IG5v
IHdheSBmb3IgdGhlIGxpbmtlcg0KPiA+PiB0byBlbGltaW5hdGUgdGhlIGRlYWQgc3R1YiBmdW5j
dGlvbi4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IFN1cmUsIHBseiBjb3JyZWN0IG1lIGlmIEkgdW5k
ZXJzdGFuZCB3cm9uZ2x5Og0KPiA+Pj4gTWF5YmUgaGVyZSBJIHNob3VsZCB1c2UgI2RlZmluZSB4
eHggdG8gZG8gdGhlIGRlY2xhcmF0aW9uLCBhbmQgaXQNCj4gPj4+IHdpbGwgYWxzbyBhdm9pZCBi
cmluZ2luZyBkZWFkIHN0dWIgZnVuY3Rpb24uIFNvbWV0aGluZyBsaWtlOg0KPiA+Pj4gI2RlZmlu
ZSBmcmVlX3N0YXRpY21lbV9wYWdlcyhwZywgbnJfbWZucywgbmVlZF9zY3J1YikgKCh2b2lkKShw
ZyksDQo+ID4+PiAodm9pZCkobnJfbWZucyksICh2b2lkKShuZWVkX3NjcnViKSkgQW5kICNkZWZp
bmUNCj4gPj4+IGFjcXVpcmVfcmVzZXJ2ZWRfcGFnZShkLCBtZW1mbGFncykgKElOVkFMSURfTUZO
KQ0KPiA+Pg0KPiA+PiBObywgSSBkb24ndCBzZWUgd2h5IHlvdSB3b3VsZCBuZWVkICNkZWZpbmUt
cy4gWW91IHdhbnQgdG8gaGF2ZSBub3JtYWwNCj4gPj4gZGVjbGFyYXRpb25zLCBidXQgbm8gZGVm
aW5pdGlvbiB1bmxlc3MgU1RBVElDX01FTU9SWS4gSWYgdGhhdCBkb2Vzbid0DQo+ID4+IHdvcmss
IHBsZWFzZSBwb2ludCBvdXQgd2h5IChpLmUuIHdoYXQgSSBhbSBvdmVybG9va2luZykuDQo+ID4+
DQo+ID4NCj4gPiBJIHdhcyB0cnlpbmcgdG8gYXZvaWQgZGVhZCBzdHViIGZ1bmN0aW9uLCBhbmQg
SSB0aGluayAjZGVmaW5lLXMgaXMgdGhlIHdyb25nDQo+IHBhdGguLi4NCj4gPiBTbywgSSBndWVz
cyBJZiBJIHJlbW92ZSB0aGUgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgcGFydCBhbmQgb25seSBsZWF2
ZQ0KPiA+IHRoZSBlbXB0eSBmdW5jdGlvbiBib2R5IHRoZXJlLCB0aGUgQ1NFIGNvdWxkIGRvIHRo
ZSBvcHRpbWl6YXRpb24gYW5kIHJlc3VsdA0KPiBpbiBubyByZWZlcmVuY2UuDQo+IA0KPiBObywg
RENFIChJJ20gc29ycnkgZm9yIHRoZSBlYXJsaWVyIHdyb25nIHVzZXMgb2YgQ1NFKSBjYW5ub3Qg
ZWxpbWluYXRlIGENCj4gZnVuY3Rpb24sIGl0IGNhbiBvbmx5IGVsaW1pbmF0ZSBjYWxsIHNpdGVz
LiBIZW5jZSBpdCBkb2Vzbid0IG1hdHRlciB3aGV0aGVyIGENCj4gZnVuY3Rpb24gaXMgZW1wdHku
IEFuZCBubywgaWYgYSBzdHViIGZ1bmN0aW9uIG5lZWRzIHJldGFpbmluZywgdGhlDQo+IEFTU0VS
VF9VTlJFQUNIQUJMRSgpIHNob3VsZCBhbHNvIHJlbWFpbiB0aGVyZSBpZiB0aGUgZnVuY3Rpb24g
aW5kZWVkIGlzDQo+IHN1cHBvc2VkIHRvIG5ldmVyIGJlIGNhbGxlZC4NCj4NCg0KT2suIFRoYW5r
cyBmb3IgZXhwbGFuYXRpb24uDQpJIG1pc3VuZGVyc3RhbmQgd2hhdCB5b3Ugc3VnZ2VzdGVkIGhl
cmUsIEkgdGhvdWdodCB5b3Ugd2VyZSBzdWdnZXN0aW5nIGEgd2F5IG9mIHN0dWIgZnVuY3Rpb24N
CndoaWNoIGNvdWxkIGJyaW5nIHNvbWUgb3B0aW1pemF0aW9uLg0KVGhlIHJlYXNvbiBJIGludHJv
ZHVjZWQgZnJlZV9zdGF0aWNtZW1fcGFnZXMgYW5kIGFjcXVpcmVfcmVzZXJ2ZWRfcGFnZSBoZXJl
IGlzIHRoYXQNCndlIG5vdyB1c2VkIHRoZW0gaW4gY29tbW9uIGNvZGUsIGFuZCBpZiB0aGV5IGFy
ZSBub3QgZGVmaW5lZCh1c2luZyBzdHViKSBvbiAhQ09ORklHX1NUQVRJQ19NRU1PUlksDQp3ZSB3
aWxsIGhhdmUgIiBoaWRkZW4gc3ltYm9sIGB4eHgnIGlzbid0IGRlZmluZWQgIiBjb21waWxhdGlv
biBlcnJvci4NCiANCj4gSmFuDQoNCg==

