Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D604259FA31
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392546.630975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpkU-0006KH-Cy; Wed, 24 Aug 2022 12:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392546.630975; Wed, 24 Aug 2022 12:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpkU-0006Hd-A1; Wed, 24 Aug 2022 12:44:46 +0000
Received: by outflank-mailman (input) for mailman id 392546;
 Wed, 24 Aug 2022 12:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQpkS-0006HL-16
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:44:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86beb82b-23aa-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 14:44:43 +0200 (CEST)
Received: from AM6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::19)
 by AS8PR08MB6978.eurprd08.prod.outlook.com (2603:10a6:20b:349::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 12:44:41 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::a8) by AM6P191CA0006.outlook.office365.com
 (2603:10a6:209:8b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Wed, 24 Aug 2022 12:44:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Wed, 24 Aug 2022 12:44:40 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 24 Aug 2022 12:44:39 +0000
Received: from 02d7f403576c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60C8B15B-D624-45C6-B6BB-F0F97BB3723A.1; 
 Wed, 24 Aug 2022 12:44:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02d7f403576c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 12:44:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7940.eurprd08.prod.outlook.com (2603:10a6:150:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 12:44:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 12:44:30 +0000
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
X-Inumbo-ID: 86beb82b-23aa-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oQ6Vy0XmPUr2ObCkMBtOmpYHamacD+ZJOl67Kd7dGSDkwzo9YNozZEtQ51orLrlEyKO6Bph4ZJVtioY4WjzK6MZN+oLbEOSX2qLq/on5DQ3OBX0v6Ucr5d3R5dAxBML6XYvOp866hOz7xJpFZBkc2p1eMLLg0uNKJ4Q/33cCbDb5otf6ILAAai0lIJT94iHMaub5a2rpfvIB6j7GeTNmAcC70Vq6d9GCWcoYAS3awdqJkbTB9BzfJEL7sQOsdXoujgbe2jO45V5gz29F8o/gperqcw/lBKrG6daFrzoSmhSLnPb8mV1kNW/pM2te1cmWZdXdDdbrtTKhRNnMnOOTtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7PuElJJfoj36hJl9Mz4yfwLddxvbytqe2alZtSlzcI=;
 b=hommLWrvURSt7a1FrR2Bda6hG3AghIXyKMhF6t9TL9uJkwKlfptYaPqEkMm2Lxo8mxkp+XtKj0kHfc3TUorPzga0FOKn4OrV7rwMR//ZzgCgwzD6UhjWm30bqDJzk3RoA+y+jSQ92mFwhiQoCRR7AprEPSIa80RejQ4cj8jzbULuHfK0JFt5JdVg6WzvS7ERv1jKRdtv1cBdbEWLr5pF6dM1K7RFkkCPs6QsCjOEzj2Ks8RhdcOtiDOI+Kb3/geD1jdv4WWvCEQhwjpY5Nsc+/NnhbvlDFXTLNrK7DN46XUZMR3n4IXsGC9SqofctEUpSsjkn7xsYScmfcNjXN3aMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7PuElJJfoj36hJl9Mz4yfwLddxvbytqe2alZtSlzcI=;
 b=7UdLrYUxgbaZsxHwjR3uPe0uvh0lzOzpxRb1vtMS3LQvXHdaYAAuo0eVW7ppo9TlrZYgUoJHu6zNmVHtRgb8YOLH0vz/LIOyECzBoc8n8V9qVSuuERR6ffhdaLzKpfnRoOoVhVzH0oZ3mLl8r8yigI4x5wAvBfIj9PpTfXjs2Os=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b64df25fa5e86590
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJg06trULLtWw5/IWimYORM5pmNpgzKOzDU1wQnUurLD8Klbq8GTbzaGiw6nJ45oBDOkjpQ1pe3jU9WchmtXIj1xwa9NZOoZoOxDIQ5lfcgZl7xJV5h19rb8fNwyVzZjBgVUoke4HytTvNo4bPW4LykEZJuoWgdcg5iOK7Kaz6V4iaRN27iI0BycBZ++uHMNOSZMG1aI4NZ/tO1h6R9imx2+nQCWnKg6rwjd66JJ7mGpTkL6YdtwdyA249CVtGlIMzxghuOK8KNkfH9K172rBdn7U/GIdo6UyhG7CmGrJxQmbnlRcFD6eyUx4cyAjy4GDm8bcHpK0Ctb4AMIhPo4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7PuElJJfoj36hJl9Mz4yfwLddxvbytqe2alZtSlzcI=;
 b=VrSmUPfiLjfwkcHt209w5VGNWgCAWUCDHNXJ9BN7AgkqqKWH1w5FmwHUsTZEJDQi9QnDs9FVi6Di/99nCdekJ/LR5gGnBhhE1OIjxcoyz6qA5BA74nInPlukqA0HVK6WIG/u6Wvs8ahdzvchCM0CIa2JJ8YNjoQLHv1R/AfqzftsgQNeOGpK5TNi+ygFlSxlOLWRYRWdRrldq5Ef9NbNoSerTRyLgpNL/B5mvBd4LFRXRPyKXDFXdRWbDrFxRkWnF24/5i/iIdxNLahdX3DJe6IIa0PUPV35fU4h6rbenP6MOeJmYoywL1e3p29Ahra0yqZOiwLKcPaOgf2VsCdLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7PuElJJfoj36hJl9Mz4yfwLddxvbytqe2alZtSlzcI=;
 b=7UdLrYUxgbaZsxHwjR3uPe0uvh0lzOzpxRb1vtMS3LQvXHdaYAAuo0eVW7ppo9TlrZYgUoJHu6zNmVHtRgb8YOLH0vz/LIOyECzBoc8n8V9qVSuuERR6ffhdaLzKpfnRoOoVhVzH0oZ3mLl8r8yigI4x5wAvBfIj9PpTfXjs2Os=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2] Arm32: correct string.h functions for "int" ->
 "unsigned char" conversion
Thread-Topic: [PATCH v2] Arm32: correct string.h functions for "int" ->
 "unsigned char" conversion
Thread-Index: AQHYt7WvGsqPX36ID06vL1k4SyhAUK29/xSA
Date: Wed, 24 Aug 2022 12:44:30 +0000
Message-ID: <43F406AE-988F-4429-B8CB-F47DBD599B43@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <031ce9f6-ede4-f371-da04-ff8c2df209dc@suse.com>
In-Reply-To: <031ce9f6-ede4-f371-da04-ff8c2df209dc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 144e0f11-0005-4a1b-188b-08da85ce6959
x-ms-traffictypediagnostic:
	GV1PR08MB7940:EE_|VE1EUR03FT051:EE_|AS8PR08MB6978:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z6UZQ+iuhIoZxP1/U2zNKkEhyRivWohXtRZkeqB9CC1mqv7oN+hukLCJkT+3sGwy9aTEWPkNPrq2HW5e9HP5JBwUgvx7/dZP2U5WkEbiI26/eTAhHLrluRhQ2HvWwHU79fAeEmDy6B3Vz8lp59wuXPQVxWmdlRObOn9dUog/plgZ//TnwOg8A87XX/fG8NFtexZLnV5Nj5r7YINMWkqQ7E7U0uoCpbqb+Qo9/y/Ed61hxCaMjkbI+58At9BNJeFv+rQv5bqmIb0blgxq+UB8L2ca6unSONo7hHgv4wjHOq3oOMxEBKvaehgwsX8lUO08aLT6fgX00W1h7/2rlX2ycc9jTKlihX5Tl9v3nKY8OlSgONWzFAVGupE6XI7Oens4ifXI0GVBSfvxZ4rIO9t37jWWOs/aWLt9NSCS2JkFSJNPRcV5BcUUTEMMBq/8CMdEY6+OxFVmR5qtvspdt89ewVIEHxtC6xRx1cyF2W7HuemI/lwSQ3sg6Mq6EdLblGPSHdJz754F3ocQZFNKk+mpFU7Yur6ZMv9ZdzTWEmA6bOloLptpl8JVeozNmqajCiDOAicMS52lNnXf05i4YC/mi3ToFsF0r1lHHxr9rZ23Kqbcsbeausac3ZgtHXJfypSsE/duKGyYRRi1C0w8+3ZEEZPWduj0qM2xlK+kyAuXQqSU4FLbegyuSWHInkKSzEakxDYN+pBown/wVmXQNnmFQ8cW2vG9V1X/AKZU5Zj/SuWFEadoMsqq4wC11ySp6GkfQMOEPqE3znn+2+8fIkgnyZ7piP2K9fX+NRnxWFXOz8g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(36756003)(86362001)(53546011)(41300700001)(64756008)(76116006)(71200400001)(4326008)(66946007)(66556008)(8676002)(2616005)(66476007)(91956017)(26005)(38070700005)(6506007)(186003)(6512007)(478600001)(6486002)(54906003)(6916009)(316002)(38100700002)(8936002)(66446008)(122000001)(33656002)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F4EB3ADD534EDA4A9D0C6A4BA3F78113@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7940
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dfbabdbb-0eed-449f-8405-08da85ce634d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jYpu7nDPwxtHIFPViMXgm4n5hCK3+GNUNP7K2ADOAmHxAPVF7N8U0yYYW0Ylgw1DvExuz5RdG4NHG0BHHEDqDz8M9F/own4rk4PGQ+3jcIsGbt4pAsLdGQCQK6Vgeic1Kld6l7RzRv/2mEuTjeFXxSTIFgzPJrgy5e24vMr8GN+TGF0g/qv90pILRuSJGxk0ngeYxZw1SC5gJDgXHLk9EywZNrQtU+VJiSTHU+MWAJBB2D8NvLiT+uzG0xpDZqww23TA/Zc98RpdkOzmj9TdXMF9eXtUp9MD8SxXQ39akkB+UZVIDPMsD+slWAKXTxc143Y0+lJ/bGiF6kHIYT2zptUuYNN/v4QvbAMiwXiT1idzP6R8KLhSdgv9h2a5Q47z9uOs1TiQGLhabPbonGwkPThnPka2DfICyFB8E07o/XaSbUqdqIF2yp7o8QuZkfi0Ai4op4wrcTirXHcdu6I3H0zA6pFrXfBjH7fADZkiCh326JRJZskHAm5WtuvvAqJCAxiuvG2pM/QXg0fgYUZ+k/IJcRT/Ll/xcEB5RLlWiQziGIa+5gbdi4aBm3wI2TtBMKzkqk+T6d8StK7Z+3eswbXoEnvWKVXmKDLNXzPtrEMtLALTfp1aZhAXJZa5wis6xVOvGj8aFaEdYe3uqH0FItKwYk4Xfs1quStrqcoEjWoTYtdK2LKRHstLEXbAUFgcbu/Q3UW48P+UUj+fkWOnqsCjLVypWlgc1Dcad5oeP7j/mGRr7nc/ZyX/JgiL9F+fJYfWua/tw/d+SO0sEqVoGA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(40470700004)(82740400003)(5660300002)(6512007)(33656002)(86362001)(6506007)(53546011)(6486002)(47076005)(82310400005)(81166007)(36756003)(8936002)(478600001)(356005)(6862004)(26005)(2616005)(54906003)(70206006)(336012)(316002)(186003)(107886003)(8676002)(4326008)(40460700003)(70586007)(40480700001)(2906002)(41300700001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 12:44:40.2612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 144e0f11-0005-4a1b-188b-08da85ce6959
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6978

Hi Jan,

> On 24 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> While Arm64 does so uniformly, for Arm32 only strchr() currently handles
> this properly. Add the necessary conversion also to strrchr(), memchr(),
> and memset().
>=20
> As to the placement in memset(): Putting the new insn at the beginning
> of the function is apparently deemed more "obvious". It could be placed
> later, as the code reachable without ever making it to the "1" label
> only ever does byte stores.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand
> ---
> v2: For memset() use the "more obvious" adjustment.
>=20
> --- a/xen/arch/arm/arm32/lib/memchr.S
> +++ b/xen/arch/arm/arm32/lib/memchr.S
> @@ -14,6 +14,7 @@
> 	.text
> 	.align	5
> ENTRY(memchr)
> +	and	r1, r1, #0xff
> 1:	subs	r2, r2, #1
> 	bmi	2f
> 	ldrb	r3, [r0], #1
> --- a/xen/arch/arm/arm32/lib/memset.S
> +++ b/xen/arch/arm/arm32/lib/memset.S
> @@ -15,6 +15,7 @@
> 	.align	5
>=20
> ENTRY(memset)
> +	and	r1, r1, #0xff
> 	ands	r3, r0, #3		@ 1 unaligned?
> 	mov	ip, r0			@ preserve r0 as return value
> 	bne	6f			@ 1
> --- a/xen/arch/arm/arm32/lib/strrchr.S
> +++ b/xen/arch/arm/arm32/lib/strrchr.S
> @@ -14,6 +14,7 @@
> 		.text
> 		.align	5
> ENTRY(strrchr)
> +		and	r1, r1, #0xff
> 		mov	r3, #0
> 1:		ldrb	r2, [r0], #1
> 		teq	r2, r1


