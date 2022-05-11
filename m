Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01C5236AB
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 17:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327029.549730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonuF-0004kA-GQ; Wed, 11 May 2022 15:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327029.549730; Wed, 11 May 2022 15:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonuF-0004hS-Ce; Wed, 11 May 2022 15:05:39 +0000
Received: by outflank-mailman (input) for mailman id 327029;
 Wed, 11 May 2022 15:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KGj=VT=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nonuE-0004hM-6t
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 15:05:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cff36aa6-d13b-11ec-a406-831a346695d4;
 Wed, 11 May 2022 17:05:36 +0200 (CEST)
Received: from DB8PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:100::35)
 by VI1PR0801MB1967.eurprd08.prod.outlook.com (2603:10a6:800:8c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 15:05:33 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::1a) by DB8PR06CA0022.outlook.office365.com
 (2603:10a6:10:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Wed, 11 May 2022 15:05:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 15:05:33 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Wed, 11 May 2022 15:05:33 +0000
Received: from b0417f0c1586.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA740A1C-4BFB-4FE0-ADAE-C1D33EBB52A3.1; 
 Wed, 11 May 2022 15:05:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0417f0c1586.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 15:05:23 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 DB6PR0802MB2584.eurprd08.prod.outlook.com (2603:10a6:4:98::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Wed, 11 May 2022 15:05:18 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 15:05:18 +0000
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
X-Inumbo-ID: cff36aa6-d13b-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bDTU5/kPdju0f6fLOdVmvPLX4/95Vc9IH3CDdI1XpxoKBTXfqv2Ijudyaq++uAZyDfTPh7iBLHpUP7JyaXQIqotGO6GWUAz//mW8SmmIKtuD3BpjELtS79zds44OPd8DiOde8GYGo+AuPa7ACJGurEn7IvuA8rfm6zOv1PUl2StteJStSBOw45epxj+dIIhH8j+anOwwVg+szZHQvQ656hM03UEU7HDR0vEPJPJ1vGryWh88oi7djNQI+aBllzVfYof15aJXmaYPOKROaAusybYuj+hI2bPEmyt4RJDMtnu6aB5nOTRS5vCDuSrhu0JG89zaRYgkW8gd3VssERYjzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiVtsKq0aqMUvBp7T3Ah9PZjuVixHInPTeLLx/d+cLI=;
 b=oOu4QMznXbLgpD7p9KWHu1CuKfUKcnV8HI6UGCdqtpwoHiNDtibTOJTF1bWI3/mxb1RKE3Y6WgvVVMtVWYzMNdKnCuI8duLMPu3rBOzigmpF2d/35XpsgGTvs8k6dErXUJm+c44WdSlUltgapUXII0LCms4DP6oLeDA8o3tBdClVQSJwyCe18FwmtpHWomhIBhQusCNHzg6v3JqorsUCOizni9qFH7AB+Ut2YdtmCdWA21SxhOx/OdN5IxrsMTyz0PCZ9gRAPPL+OeJLNP5llbgS73jUJSzbWpFBNhSy7LtT6HecAn2/w8T/bxRSAioWQQ8AbE7Wjih66Siv/3WKEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiVtsKq0aqMUvBp7T3Ah9PZjuVixHInPTeLLx/d+cLI=;
 b=7dURc6LjmVYbB1FMQFu4cYRP/z9H4l3T9iAmr6DhzSQXA9fVKbxdLYcY4U8DGqQgdhHhOVhIRXyUAGd0eHEAMQyfRSTaOvqR7jMyrQiHdaZ/3BGQl/8e18TCW6RrpYsp+faSq1936hDjubp0YUiXKgHUqt466XSHU/0k1WevMng=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a5bb1cb6f6a2461
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyfXWSNEVvf+DS5CJ7VFxmjmVIUuDVTDcsDd8zoTcUunMjW/EB0P/kvtUvqE/dFweae+aTCX/4SP/JXr1OXDN7Vo4koVRk2bZWnx+pMDBMydVJ2B0Wmh/howpOAujMbPee4Fr+XifOKN51km82sNF5H/p4egiKEz77IIOYqkDGdxIg/EgIct18PKQDTZKQjsrW10JSCw/JzSlUDwckTOcLNiwnraBnDno/4NMoMhTMPx1c4cTM5cFZpKzCq89pcxQ/3Y5Ah2hQtccipn/eQLn40LC/dgFH2hADDR4dmwM31YdcmKAuh4Aupl8Z+0y+6oA0VkciD7YOG1IrCuJ0i8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiVtsKq0aqMUvBp7T3Ah9PZjuVixHInPTeLLx/d+cLI=;
 b=TKSCT1xl9F3Z0uGQeQnWQlIslnIPvrJV0KSz1sjkq8Q3+GM0BiQT9Np/Bfs3mUuDieDb+kmPuOUcLtPWPuSoQuYHsqiFzJikACY0mwtb53Scn0K4FSAOQ7NBT88NZ6t3/bvT4zJwA+md0GQvL1G8tLGF5B7QGl6pmA9gm8z4Q73t9F5RQAS5pMpjg2+dE8S5HcwTloO7mHhpQkc+KPQ9eYEfa3C22HcUVccQIioOrHFzoxCx8vRhmA3t6VFx7ZZUgVJg+kFv/tZXt24TuJQs6k2y6LafMULPYjPs6tXhBTZcfEryUPVqaWB9m2f5O2x77EMZVBgqLZBPV0DyiEng9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiVtsKq0aqMUvBp7T3Ah9PZjuVixHInPTeLLx/d+cLI=;
 b=7dURc6LjmVYbB1FMQFu4cYRP/z9H4l3T9iAmr6DhzSQXA9fVKbxdLYcY4U8DGqQgdhHhOVhIRXyUAGd0eHEAMQyfRSTaOvqR7jMyrQiHdaZ/3BGQl/8e18TCW6RrpYsp+faSq1936hDjubp0YUiXKgHUqt466XSHU/0k1WevMng=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
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
 AQHYYBWH2ZK8TL5ueU+mSOXui+uVga0YVmwAgAABRACAAP62gIAADosAgAACPoCAAAaAgIAAAkiAgAAaewCAACa3AIAAHamAgAACD4A=
Date: Wed, 11 May 2022 15:05:18 +0000
Message-ID: <4D04ACBD-014A-4A74-8B2C-6BCFB8D562A0@arm.com>
References:
 <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
 <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
 <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com>
 <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
 <9707ACA4-711A-4691-BA2A-FCDDAFFD9DE8@arm.com>
 <10151DF3-A3C9-49FB-8F2B-B36407E5CE82@arm.com>
 <573e94c4-7de0-e442-c9d8-559b55ae3144@xen.org>
 <3AC1200B-4F64-4828-8EAF-E6039E3613F1@arm.com>
In-Reply-To: <3AC1200B-4F64-4828-8EAF-E6039E3613F1@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: af18c998-2d37-4ea4-75fe-08da335fb22e
x-ms-traffictypediagnostic:
	DB6PR0802MB2584:EE_|DBAEUR03FT043:EE_|VI1PR0801MB1967:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1967497FA9C32A25CE74BEC3FCC89@VI1PR0801MB1967.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dkoTFcR+YFbLsdVZC1LJbkH7jQQ9ZO88e6OnqBhScyWhS/nt4ZnJeHG3sSI+89yn3MpPhRmHZb+Xl7uV+vaiu0h5eqotUqtxl07Gr0KDg+NzhwpV6IgnDAwBQcwXAjPs4FoNAeLMOu6eZ4I+MZtDN4pxDf355grqAlZAre7Z0BboD83r9KOTQSpeYAfVpNANUcFXlwgl0L2XBjdY9v+W3uG2ZW3apIG86Q3gia+/XApqjowl0otkR9h/lNoQ+nRgj78yIRnxWuZ4GxmdYculg7BenTTjXsVobNYix5neTrzheU/JIWa5mplI6klHdGkVpGnEMlHbiRwXnMYBRZK6BjgddiBvD2Ugpd3yz9f2YUYK+Jo9ZzxairSrE0ZsfTwrfxMIlC1WYUg7R2tGx+qF7FwcW0WVy27dJZYIbvQrBpEeiGqII0DNEI9DEd8tc9R9YUYRATInpRx17dZ56f2JC3qkHRDs2kr6TEeS0nuSgQSTSlB2ZqKLQGpEor7NyP0iv1ZHkn62dzAbiTZ/dY0HUSKx9MUnlOQmcH8Cjp3jTpvPYt2UWyabkyXNNBHunUFGC9GjiMHoMrA8Qr5JjaTXCDW+h1NA2RJZCvrdr2TZSfCZU1oAaTp35wbZGnrf5IBnsQmu3D3wOSa38jKf35kzmP4DjW8pVn0qiz9Q2o0to1MetE9n2LBC5/nTKHlRV9yOuUHRBZy36nxEOPYA97FuRdi+ZBtjBsUdutwA6AveBUFwHYqN+z/vCH+mNJ7+9gkwWpYbQ8TJziuhM8U82o3qkw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(54906003)(38100700002)(8936002)(2906002)(33656002)(508600001)(6486002)(2616005)(5660300002)(6916009)(316002)(36756003)(186003)(122000001)(6506007)(86362001)(66556008)(4326008)(8676002)(76116006)(66446008)(66946007)(26005)(64756008)(66476007)(6512007)(91956017)(83380400001)(53546011)(71200400001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E96C8BF2DB4DC449E93F402CBE901A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2584
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15f85347-aaf9-4576-e580-08da335fa961
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ab1CnpLAxGo/pn0QjuzDvDBmFcDYJ/mjPN9KGqommDkwyCb9eWWpRxlOxtHcO7oIaoYFpVSyzYubaGh8Iku0oEPBn4WY9853pvAwR2pEx9y4cmJpuBMKxpZXIT+wjg/myrZrwaKup+p2c8UCzLQfwXvwtWouffoxKcYTFdXPZWjNSh/30kgv5BMqnEeOTe+Ea41IP79ySWdd6lAody9mmxx/fwE358S/Ir6mgxNfO+z9OcsgwUeWybDoZBL1cbsKuozBVTVk/LJWJr7gYKtJllrWxBIEDg/fQbpt236vcjod/EKM85C8VgyQMm/M9kL0lWAXAEpKEO+eF7zTbCJ59tt6T2CpI5JvMNXrJbtvRuoeCB4dLbcIEpjEHl4ePdN9+rBAA+YYGUnnG96UEU4ES0/pZSYC9sYpa8aFKHXYYmkI5oM52BoqMGU1RVc2VEdQ8Bvtz4XgZKjS8m59scthj6h8ZMMKzG2niqhjay0Iw17noUWFHkD56Kx0BaSLPi1xNdJQaz46DpAbf3mz0kHYoqg/Sb6jQYgUGgBiMzbwKQwOq/zIeeZAc6O9xvtmY6PlfDvl5a2j4s5meKwwxDUHT7NmG1HqsoiB6Mqeat0HzUYxa3QIkj6rYvdW3Y1tmkqdFZaxUCLiPSNwJ2cDdqHck2+E3VObT6v341M60YWLDVgq8BL8+S7z+mMETSCJJ5ae7em4zkSAJpP/dVVfVkIfww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(186003)(47076005)(70206006)(70586007)(36756003)(336012)(36860700001)(33656002)(82310400005)(6862004)(8936002)(26005)(83380400001)(5660300002)(2616005)(40460700003)(6512007)(4326008)(107886003)(8676002)(86362001)(508600001)(6506007)(54906003)(53546011)(6486002)(2906002)(81166007)(316002)(356005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:05:33.0489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af18c998-2d37-4ea4-75fe-08da335fb22e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1967

SGkgSnVsaWVuLA0KDQo+IE9uIDExIE1heSAyMDIyLCBhdCAzOjU3IHBtLCBSYWh1bCBTaW5naCA8
UmFodWwuU2luZ2hAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKdWxpZW4sDQo+IA0KPj4gT24g
MTEgTWF5IDIwMjIsIGF0IDI6MTEgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdy
b3RlOg0KPj4gDQo+PiBIaSBSYWh1bCwNCj4+IA0KPj4gT24gMTEvMDUvMjAyMiAxMTo1MywgUmFo
dWwgU2luZ2ggd3JvdGU6DQo+Pj4+IE9uIDExIE1heSAyMDIyLCBhdCAxMDoxOCBhbSwgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+
IEhpIEp1bGllbiwNCj4+Pj4gDQo+Pj4+PiBPbiAxMSBNYXkgMjAyMiwgYXQgMTA6MTAsIEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBIaSBCZXJ0cmFu
ZCwNCj4+Pj4+IA0KPj4+Pj4gT24gMTEvMDUvMjAyMiAwOTo0NiwgQmVydHJhbmQgTWFycXVpcyB3
cm90ZToNCj4+Pj4+Pj4gT24gMTEgTWF5IDIwMjIsIGF0IDA5OjM4LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEhpIEJlcnRyYW5kLA0KPj4+
Pj4+PiANCj4+Pj4+Pj4gT24gMTEvMDUvMjAyMiAwODo0NiwgQmVydHJhbmQgTWFycXVpcyB3cm90
ZToNCj4+Pj4+Pj4+PiBPbiAxMCBNYXkgMjAyMiwgYXQgMTc6MzUsIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEhpIFJhaHVsLA0KPj4+
Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uIDEwLzA1LzIwMjIgMTc6MzAsIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+Pj4+Pj4+Pj4gKyByYyA9IGV2dGNobl9hbGxvY191bmJvdW5kKCZhbGxvYyk7DQo+Pj4+
Pj4+Pj4+PiArIGlmICggcmMgKQ0KPj4+Pj4+Pj4+Pj4gKyB7DQo+Pj4+Pj4+Pj4+PiArIHByaW50
aygiRmFpbGVkIGFsbG9jYXRpbmcgZXZlbnQgY2hhbm5lbCBmb3IgZG9tYWluXG4iKTsNCj4+Pj4+
Pj4+Pj4+ICsgcmV0dXJuIHJjOw0KPj4+Pj4+Pj4+Pj4gKyB9DQo+Pj4+Pj4+Pj4+PiArDQo+Pj4+
Pj4+Pj4+PiArIGQtPmFyY2guaHZtLnBhcmFtc1tIVk1fUEFSQU1fU1RPUkVfRVZUQ0hOXSA9IGFs
bG9jLnBvcnQ7DQo+Pj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+PiArIHJldHVybiAwOw0KPj4+Pj4+
Pj4+Pj4gK30NCj4+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+IHN0YXRpYyBpbnQgX19pbml0IGNv
bnN0cnVjdF9kb21VKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+Pj4+Pj4+PiBjb25zdCBzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKm5vZGUpDQo+Pj4+Pj4+Pj4+PiB7DQo+Pj4+Pj4+Pj4+PiBAQCAtMzIx
NCw2ICszMjQzLDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21VKHN0cnVjdCBk
b21haW4gKmQsDQo+Pj4+Pj4+Pj4+PiBpZiAoIHJjIDwgMCApDQo+Pj4+Pj4+Pj4+PiByZXR1cm4g
cmM7DQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+ICsgaWYgKCBraW5mby5kb20wbGVzc19lbmhh
bmNlZCApDQo+Pj4+Pj4+Pj4+IEkgdGhpbmsgd2UgbmVlZCB0byBkbyBzb21ldGhpbmcgbGlrZSB0
aGlzIHRvIGZpeCB0aGUgZXJyb3IuDQo+Pj4+Pj4+Pj4+IGlmICggaGFyZHdhcmVfZG9tYWluICYm
IGtpbmZvLmRvbTBsZXNzX2VuaGFuY2VkICkNCj4+Pj4+Pj4+Pj4gew0KPj4+Pj4+Pj4+PiB9DQo+
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gSXMgdGhlcmUgYW55IHVzZSBjYXNlIHRvIHVzZSAiZG9tMGxl
c3NfZW5oYW5jZWQiIHdpdGhvdXQgZG9tMCAob3IgYSBkb21haW4gc2VydmljaW5nIFhlbnN0b3Jl
ZCk/DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBKdXN0IGJlaW5nIGN1cmlvdXMgaGVyZSBidXQgd291
bGQgaXQgZXZlbiBiZSBwb3NzaWJsZSB0byBoYXZlIG5vbiBkb20wIGRvbWFpbiBzZXJ2aWNpbmcg
eGVuc3RvcmVkID8NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFlvdSBjYW4gYnVpbGQgWGVuc3RvcmVkIGFn
YWluc3QgbWluaS1vcyBhbmQgY29uZmlndXJlIHRoZSBpbml0IHNjcmlwdCB0byBsYXVuY2ggeGVu
c3RvcmVkIGFzIGEgZG9tYWluLg0KPj4+Pj4+IFNvIGRvbTAgaXMgbm90IG1hbmRhdG9yeSBvciBz
aG91bGQgbWluaS1vcyBiZSBzdGFydGVkIGFzIERvbTAgZm9yIHRoaXMgdG8gd29yayA/DQo+Pj4+
PiANCj4+Pj4+IEluIG9yZGVyIHRvIGFsbG9jYXRlIHRoZSBldmVudCBjaGFubmVsLCB5b3UgbmVl
ZCB0byBrbm93IHRoZSBJRCBvZiB0aGUgZG9tYWluIHdoZXJlIFhlbnN0b3JlZCB3aWxsIHJ1bi4g
U3RlZmFubydzIHBhdGNoIGlzIHJlbHlpbmcgb24gWGVuc3RvcmVkIHRvIGJlIHJ1biBpbiBEb21h
aW4gMC4NCj4+Pj4+IA0KPj4+Pj4gVGhpcyB3b3VsZCBuZWVkIHRvIGJlIHVwZGF0ZWQgaWYgd2Ug
d2FudCB0byBydW4gaXQgaW4gYSBzZXBhcmF0ZSBkb21haW4uDQo+Pj4+IA0KPj4+PiBPayB0aGVu
IERvbTAgaXMgbWFuZGF0b3J5IGF0IHRoZSBtb21lbnQsIEkgYW0gb2sgd2l0aCB0aGF0Lg0KPj4+
PiANCj4+Pj4+IA0KPj4+Pj4+PiANCj4+Pj4+Pj4+PiBJZiBub3QsIHRoZW4gSSB3b3VsZCBjb25z
aWRlciB0byBmb3JiaWQgdGhpcyBjYXNlIGFuZCByZXR1cm4gYW4gZXJyb3IuDQo+Pj4+Pj4+PiBP
bmUgd2F5IG9yIGFuIG90aGVyIHdlIG5lZWQgdG8gc29sdmUgdGhlIGNyYXNoIGJ1dCBpZiBpdCBp
cyBmb3JiaWRkZW4gd2UgbXVzdCBwcmV2ZW50IGNvbWluZyB0byB0aGlzIHN0ZXAgZWFybGllciBh
cyBpdCBtZWFucyB0aGUgY29uZmlndXJhdGlvbiBpcyB3cm9uZy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+
IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgY2hlY2tlZCB3aGVuIHBhcnNpbmcgdGhlIGNvbmZpZ3Vy
YXRpb24uDQo+Pj4+Pj4gSWYgZG9tMCBpcyBtYW5kYXRvcnkgeWVzLCB3ZSBzaG91bGQgc3RpbGwg
bWFrZSBzdXJlIHRoYXQgdGhpcyBjb2RlIGNhbm5vdCBiZSByZWFjaGVkIHNvIGFuIEFTU0VSVCB3
b3VsZCBiZSBuaWNlIGhlcmUgYXQgbGVhc3QgaW4gY2FzZSBzb21lb25lIHRyaWVzIHRvIGFjdGl2
YXRlIHRoaXMgY29kZSB3aXRob3V0IGRvbTAgKHdoaWNoIG1pZ2h0IGhhcHBlbiB3aGVuIHdlIHdp
bGwgcHVzaCB0aGUgc2VyaWUgZm9yIHN0YXRpYyBldmVudCBjaGFubmVscykuDQo+Pj4+PiANCj4+
Pj4+IEkgYW0gZmluZSB3aXRoIGFuIEFTU0VSVCgpLg0KPj4+Pj4gDQo+Pj4+PiBBcmUgeW91IHNh
eWluZyB0aGF0IGRvbTBsZXNzX2VuaGFuY2VkIHdpbGwgYmUgc2V0IHRvIHRydWUgZm9yIHRoZSBz
dGF0aWMgZXZlbnQgY2hhbm5lbCBzZXJpZXM/DQo+Pj4+PiANCj4+Pj4+IElmIHllcywgdGhlbiBJ
IHRoaW5rIGRvbTBsZXNzX2VuaGFuY2VkIHdpbGwgbmVlZCB0byBiZSBhbiBlbnVtIHNvIHdlIGtu
b3cgd2hhdCBwYXJ0IG9mIFhlbiBpcyBleHBvc2VkLg0KPj4+PiANCj4+Pj4gTm8gaXQgd29u4oCZ
dCwgd2UganVzdCBuZWVkIHNvbWUgb2YgdGhlIGNoYW5nZXMgZG9uZSBidXQgd2l0aG91dCBzZXR0
aW5nIGRvbTBsZXNzX2VuaGFuY2VkLg0KPj4+PiBAUmFodWw6IGNhbiB5b3UgY29uZmlybS4NCj4+
Pj4gDQo+Pj4gV2UgbmVlZCB0byBzZXQgdGhlICJ4ZW4sZW5oYW5jZWTigJ0gZW5hYmxlZCBmb3Ig
ZG9tMGxlc3MgZG9tVSB0byBlbmFibGUNCj4+PiB0aGUgZXZlbnQtY2hhbm5lbCBpbnRlcmZhY2Ug
aW4gZG9tMGxlc3MgZ3Vlc3QuIElmIHdlIGRpZCBub3Qgc2V0IHRoaXMgcHJvcGVydHkgd2UgY2Fu
4oCZdA0KPj4+IHVzZSB0aGUgZXZlbnQtY2hhbm5lbCBpbnRlcmZhY2UgaW4gZG9tMGxlc3MgZG9t
VXMgZ3Vlc3RzLg0KPj4gDQo+PiBJcyB0aGlzIGJlY2F1c2UgdGhlIGRvbVUgd2lsbCBub3Qga25v
dyB3aGljaCBQUEkgd2lsbCBiZSB1c2VkIGZvciBub3RpZmljYXRpb24/DQo+IA0KPiBZZXMgeW91
IGFyZSByaWdodCBpZiB3ZSBkb27igJl0IHVzZSAieGVuLGVuaGFuY2Vk4oCdIGZvciBkb21Vcywg
ZG9tVXMgd2lsbCBub3Qga25vdyB3aGljaCBQUEkgd2lsbCBiZSB1c2VkLg0KPiBBbHNvIGlmIHdl
IGRvbuKAmXQgdXNlICJ4ZW4sZW5oYW5jZWTigJ0gdGhlcmUgaXMgbm8gaHlwZXJ2aXNvciBub2Rl
IGNyZWF0ZWQgZm9yIExpbnV4IGFuZCBpZiB0aGVyZSBpcw0KPiBubyBoeXBlcnZpc29yIG5vZGUg
dGhhdCBtZWFucyBubyB4ZW4gc3VwcG9ydCBkZXRlY3RlZC4NCj4gDQo+PiANCj4+IFRoZSBwcm9w
ZXJ0eSAieGVuLGVuaGFuY2VkIiB3aXRoIGFuIGVtcHR5IHN0cmluZyAob3Igd2l0aCB0aGUgdmFs
dWUgImVuYWJsZWQiKSBpcyBtZWFudCB0byBpbmRpY2F0ZSB0aGF0IFBWIGRyaXZlcnMgd2lsbCBi
ZSB1c2FibGUgaW4gdGhlIGRvbWFpbi4NCj4+IA0KPj4gQUZBSVUsIHlvdSBhcmUgc3VnZ2VzdGlu
ZyB0byBjaGFuZ2UgdGhlIG1lYW5pbmcgYmFzZWQgb24gZG9tMCB3aGV0aGVyIGhhcyBiZWVuIGNy
ZWF0ZWQuIEkgZG9uJ3QgcGFydGljdWxhcmx5IGxpa2UgdGhhdCBiZWNhdXNlIGEgdXNlciBtYXkg
c3BlbnQgYSB3aGlsZSB0byB1bmRlcnN0YW5kIHdoeSBYZW5zdG9yZWQgZG9lc24ndCB3b3JrLg0K
Pj4gDQo+PiBUaGUgY3VycmVudCBwcm9wb3NhbCBmb3IgeGVuLGVuaGFuY2VkIGFsbG93cyB1cyB0
byBkZWZpbmUgbmV3IHZhbHVlcyBpZiB3ZSB3YW50ZWQgdG8gb25seSBlbmFibGVkIHNlbGVjdGVk
IGludGVyZmFjZXMuIEFGQUlVLCBpbiB5b3VyIGNhc2UsIHlvdSBvbmx5IHdhbnQgdG8gZXhwb3Nl
IHRoZSBldmVudCBjaGFubmVsIGludGVyZmFjZSwgc28gSSB3b3VsZCBjcmVhdGUgYSBuZXcgdmFs
dWUgdG8gaW5kaWNhdGUgdGhhdCB0aGUgZXZlbnQgY2hhbm5lbCBpbnRlcmZhY2UgaXMgZXhwb3Nl
ZC4gWGVuIHdvdWxkIHRoZW4gY3JlYXRlIG9ubHkgdGhlIHBhcnQgZm9yIHRoZSBldmVudCBjaGFu
bmVsIChpLmUuIG5vIGV4dGVuZGVkIHJlZ2lvbnMsIGdyYW50IHRhYmxlcy4uLikuDQo+IA0KPiBP
ay4gSSB3aWxsIGNyZWF0ZSB0aGUgbmV3IHByb3BlcnR5IHNvbWV0aGluZyBsaWtlIOKAnHhlbixl
dnRjaG7igJ0gdG8gZW5hYmxlIHRoZSBldmVudC1jaGFubmVsIGZvciBkb20wbGVzcyBndWVzdHMu
IA0KPiBCYXNlZCBvbiDigJx4ZW4sZXZ0Y2hu4oCdIHByb3BlcnR5IEkgd2lsbCBjcmVhdGUgdGhl
IGh5cGVydmlzb3Igbm9kZSB3aXRoIG9ubHkgUFBJIGludGVycnVwdCBwcm9wZXJ0eS4NCg0KSWYg
d2UgZG9u4oCZdCB3YW50IHRvIGNyZWF0ZSB0aGUgbmV3IHByb3BlcnR5IHdlIGNhbiB1c2UgInhl
bixlbmhhbmNlZCA9IGV2dGNobuKAnSB0byANCmVuYWJsZSB0aGUgZXZlbnQtY2hhbm5lbCBpbnRl
cmZhY2Vmb3IgZG9tMGxlc3MgZ3Vlc3RzLg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

