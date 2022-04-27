Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF575114E0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314847.533102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njexs-0000SO-2L; Wed, 27 Apr 2022 10:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314847.533102; Wed, 27 Apr 2022 10:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njexr-0000QG-Ug; Wed, 27 Apr 2022 10:32:07 +0000
Received: by outflank-mailman (input) for mailman id 314847;
 Wed, 27 Apr 2022 10:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njexq-0000Ma-QS
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:32:07 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe09::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4822cb55-c615-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 12:32:05 +0200 (CEST)
Received: from DB7PR05CA0071.eurprd05.prod.outlook.com (2603:10a6:10:2e::48)
 by HE1PR08MB2810.eurprd08.prod.outlook.com (2603:10a6:7:37::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Wed, 27 Apr
 2022 10:32:01 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::92) by DB7PR05CA0071.outlook.office365.com
 (2603:10a6:10:2e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Wed, 27 Apr 2022 10:32:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 10:32:00 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 27 Apr 2022 10:32:00 +0000
Received: from 18b0e8e7a600.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 848905E9-CEA4-4FEF-A2BC-8F21197FE4B4.1; 
 Wed, 27 Apr 2022 10:31:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18b0e8e7a600.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 10:31:49 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AS1PR08MB7514.eurprd08.prod.outlook.com (2603:10a6:20b:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Wed, 27 Apr
 2022 10:31:47 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%9]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:31:47 +0000
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
X-Inumbo-ID: 4822cb55-c615-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eTs1R2inM40Fop8O2Rx+BQY7yz2GtTm/6iFuoqjZZygmNKb54OFAbgglo72mZ4Ito7PX8BrzMxla74ZBh47CuZMmkYeKlMbo/S+MeYRK2S/FUu5c3w7MX0/SO6qMnrv8xSmdVTMlZr3d4GGqrmx2MtXR6aKcfEHg6X6MpyzqZkpMa38SSJyi+p5c9BM6+8V+cvL3xdA2A2peQP4Fy6unUyfKAWfnQ3RweRISs7xkbkMKTWXfuQpHpvyjNnbqjm1J8kKIq4cqbkLde9sv3BwTs64XlslA73he6Tn0dQEJfsSzCTmHjggalD7CU7o7YY29M4Mf2SQzdE1Mn+07Nh1Wng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM7MWqmL5pFftgoohB0muhAA5IdoLr9JxzahZUAs0XE=;
 b=Ge2dNKJ0xwIg3+jrX3/4jrmUtinqdagWDCzMmhvbgZAZA8Jt/aSyP6AUe3GLQSCwq09+wmeTVx3uD+pfvM1GTHkX9AZz5UAZRJjguI1uQB6oR/Mu/Kk2H69KTKN1URDguJy9GKRj4JhDqe0kX1irUyK1Y/Kie0QHDp/+MdQwBFgjKaGVwQFtef6M3B1x7L2OIP2XwWQ/512p6OVvjGRvDC5tp+GqoEBsAo/2ZPYwA1upnNCx7emXw0a5YqOq4c3gSYI9Tl2S+DzwRq5FMwGeI9Y/ThxHlxjDJoY9czV+IQNojPhLAwT6QULZ0WVBqWFW4y9vGcn4O5+x3yKIIdvjjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM7MWqmL5pFftgoohB0muhAA5IdoLr9JxzahZUAs0XE=;
 b=UgJMua7iA1w4SKPtCdkECxc3gdkDLLWfpKWBE2BX8bmVcRxvs2OzEiPmVwi1/PUGj5OVnHlXFrjmSb7tvoYaGDFbo/wIp4N2dcSddWUOmnm22SGFLzCsMkPtB+JxxO0UoSWvXkXEqfEeLoImT5aHVvHQ1pWC6/NoRA5HqQI/9IE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUtwmQtX4LuhUS3olBX69lGkp2gQuXGjbOZ/XfsNnWELtX5j8Z984zMRA2Q5CySsgBCad8tyBGp+UEVzykbOObfI3MVcl1bKcQfHxae69yonY7V3BhGg/Cfj+TMpIxl4i3HScldRwC0rDxrCPBXs0VXWwpx07QmxmONsv8Hj4OrZ9zLvh8zs7b+NF3znRWSVhcdmo2P4G/eLGq+UqbpAMMsZ68CykRZYt3FLHfIP1+ShXMJR956q/rtZnsoUarFoRa8+aG7uK0741B5z3/pA7DJlBdggv875arqBsKnfw824oAIgKkAq8zbYNwcQoi3FyBpn8iyqfnsA4Rr8jSqhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM7MWqmL5pFftgoohB0muhAA5IdoLr9JxzahZUAs0XE=;
 b=XRNENRfbqp1gCVr19scDm7UNK7bLms0psFQw4ZLjnyo5poJXBWYNdgnaxABVF1YjU2FQr+vcr9pKw7Hajmx61bQGWhYhIpWOgaRPljKOGqpKzrGzWmK2s7/uXCAFFsGXVb0C0D5SoYf/J+VRv3nkHc923urMN84bJvy/iaIGhSohPbXZOuISDyZ7iVwu24A41ejEvx1am/VFYCztV6j8a/7MnbKPEDT/p9woS/IZGSfiHVYhb/wIIp1sXkxGs41Dv3AXL2WBLbRbMbmO1HHAG8AXWtPBfKbtOUn8iNEMIgtEUWRLaR5/J34IwfJag4QkO8pyKxz0fkiPGRMqHzBZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM7MWqmL5pFftgoohB0muhAA5IdoLr9JxzahZUAs0XE=;
 b=UgJMua7iA1w4SKPtCdkECxc3gdkDLLWfpKWBE2BX8bmVcRxvs2OzEiPmVwi1/PUGj5OVnHlXFrjmSb7tvoYaGDFbo/wIp4N2dcSddWUOmnm22SGFLzCsMkPtB+JxxO0UoSWvXkXEqfEeLoImT5aHVvHQ1pWC6/NoRA5HqQI/9IE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYWhk9pvmpyYf9yk6PCG0TATWN+q0DifWAgAAAvZCAAALDgIAAAKBg
Date: Wed, 27 Apr 2022 10:31:47 +0000
Message-ID:
 <DU2PR08MB73250C2576634910269805CFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-6-Penny.Zheng@arm.com>
 <95b1d82e-92fa-7468-d3aa-038f0de937d9@xen.org>
 <DU2PR08MB73250D118F81DF1FF2C89DAFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <433f9e2a-9da7-662f-04b5-0379eca7496f@xen.org>
In-Reply-To: <433f9e2a-9da7-662f-04b5-0379eca7496f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0A04D3E68C4DBA46AFB508680CD40F79.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b0cf5223-5090-4815-91fc-08da283929ae
x-ms-traffictypediagnostic:
	AS1PR08MB7514:EE_|DB5EUR03FT045:EE_|HE1PR08MB2810:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2810508179391819BA4B44B4F7FA9@HE1PR08MB2810.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2vwtZy+2WDiAjBj/NXQGsaZn7vtoS4zmNrIGuauS9WjENwW7vP5XBAoYZEy+DoHapIQq/jV6Qibepm/lWMOg1sdMBmzhZ0bOqD8NflwVmCbf7YXd0Sy15855ccZ2hoLukDL1ZTjCP15BswQ/KKCKuj7BZbR6XodrZmftGMxW3h0hj5lV64Y1vFrppO8nC3geI0mDlsOzkLWJGucYQBOpXMUmBf7fTPhbdad3uIl6Xjla6ScIHJeIrmsygMYEHXTayyCw856cPOIaawC/g/wGXdo641w50YS87nbBUJRrr5sG6pM0fkXYExjnbvuBOQISnfOeLH0qCyMn/FlwLPSHH9RnDIXk18dK1jKPHCzR7Pyt61u0XirRJ58hEYDlDKwIGj5duCOhpCT85QXk50I/VzvxrZVIEfICBm5tY4bxbB3Iwa/HmkK8A/A7MYkEDehNwG/wRusMnMz2p0xscGUcMgiP0myCN5KF8sr7fKugzDQZrDki2fm2zOmpnt4ilF/HXhYjZs1HtdjoohTRDnJOsPtfld+7oZzKTotXGg0bhTIHsuSI/xGe9EMkisiibzAof92WLCzef20R8sr0mF/bDEs2FYGRy+lSQGLfnLLvUm3a+7Z8HNS4/NUmxjOvIfYaRDUeAxCVbLsErtOu+n3Ek2MfkSx4nLu10o26V2htXz7fkVCLPPQQVk7PqGnpDvqimW0jZtLZwpw7scZ3/YSH9RdNdwtXdiBDvzRuK0VU2m8C+o42u9v1MEEJP0xq93sf
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(64756008)(53546011)(76116006)(54906003)(83380400001)(86362001)(508600001)(26005)(4326008)(33656002)(9686003)(5660300002)(55016003)(71200400001)(66476007)(186003)(6506007)(8676002)(316002)(122000001)(52536014)(38100700002)(66556008)(66946007)(110136005)(2906002)(38070700005)(66446008)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7514
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb33fc0c-c974-4446-3ba8-08da283921db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5HRGUShpSpPBlK3EtK8ClpTHlW55CxWIo+ukcbaaSYlTXncvhjpKSo/4GTbKe+1dk+epacDaRIF2fY8IsUS0/qPXiCIXjgLRzJJxDO1ltBzBC8ERNYvDK3bQCXzJo/6dIT6/BvI+OK3DRjqpYFbSDr8JxIUBZt+IlDy2Qv1s6/x089Ok1DMAipP/EpNUFbI9vubgcCX8oRujnDOyGo75cajI6vQMIYxxiVC+JwyrhNQ7eyi89QiZcecWb0GndiXSqyXS4PJR/Jh1Kun41y/Z+ONntzERJn+Hegx8ILLOcQnXVtC1GkHAHoX0forE+bTUMSLvHfVziBSCnv6MMNShDrNG40Ea9dZ3TD6IXLjnPMHOeZtERCXDJvgkVpnOTS/bgfIvMC/kHrmCefy2AmqjD8VfPHOxg5K71UyvBWCgxpDVKPlCnh91RnmOS9I2sQVbHmcZk96EIkjNPXVtnNawxKje5qatnhknvAyKpoz2eyZK6WGyE9Dk9J+E+/OBjbBNjnacdjhOUzWwCEImKKEIABStFmlLPbDPZb5/rKrTuuhjdCXWm24wR6rPEKbb/54m3+pCZ4NPgKeUp9mUQemAJF06J58Lu3YdKFetwH0o31IyyZdtV92QyM02RZ6r/3bCgLIHBT2AwFnz3CmpngpwRhwcG8hYOqoDxVisdZTJnuGolCwP37l46GWQ3rWxcMwS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(110136005)(52536014)(508600001)(54906003)(186003)(8676002)(70206006)(70586007)(4326008)(33656002)(86362001)(336012)(2906002)(8936002)(47076005)(26005)(5660300002)(82310400005)(83380400001)(55016003)(40460700003)(36860700001)(53546011)(9686003)(316002)(6506007)(7696005)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:32:00.3743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cf5223-5090-4815-91fc-08da283929ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2810

SGkganVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyNywgMjAy
MiA2OjIzIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5j
b20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+Ow0KPiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsNCj4gSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyA1LzZdIHhlbi9hcm06IHVucG9wdWxhdGUgbWVtb3J5IHdoZW4gZG9tYWlu
IGlzDQo+IHN0YXRpYw0KPiANCj4gSGkgUGVubnksDQo+IA0KPiBPbiAyNy8wNC8yMDIyIDExOjE5
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+ICsvKg0KPiA+Pj4gKyAqIFB1dCBmcmVlIHBhZ2Vz
IG9uIHRoZSByZXN2IHBhZ2UgbGlzdCBhZnRlciBoYXZpbmcgdGFrZW4gdGhlbQ0KPiA+Pj4gKyAq
IG9mZiB0aGUgIm5vcm1hbCIgcGFnZSBsaXN0LCB3aGVuIHBhZ2VzIGZyb20gc3RhdGljIG1lbW9y
eSAgKi8NCj4gPj4+ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPj4+ICsjZGVmaW5l
IGFyY2hfZnJlZV9oZWFwX3BhZ2UoZCwgcGcpICh7ICAgICAgICAgICAgICAgICAgIFwNCj4gPj4+
ICsgICAgcGFnZV9saXN0X2RlbChwZywgcGFnZV90b19saXN0KGQsIHBnKSk7ICAgICAgICAgICAg
IFwNCj4gPj4+ICsgICAgaWYgKCAocGcpLT5jb3VudF9pbmZvICYgUEdDX3Jlc2VydmVkICkgICAg
ICAgICAgICAgIFwNCj4gPj4+ICsgICAgICAgIHBhZ2VfbGlzdF9hZGRfdGFpbChwZywgJihkKS0+
cmVzdl9wYWdlX2xpc3QpOyAgIFwNCj4gPj4+ICt9KQ0KPiA+Pj4gKyNlbmRpZg0KPiA+Pg0KPiA+
PiBJIGFtIGEgYml0IHB1enpsZWQgaG93IHRoaXMgaXMgbWVhbnQgdG8gd29yay4NCj4gPj4NCj4g
Pj4gTG9va2luZyBhdCB0aGUgY29kZSwgYXJjaF9mcmVlX2hlYXBfcGFnZSgpIHdpbGwgYmUgY2Fs
bGVkIGZyb20NCj4gPj4gZnJlZV9kb21oZWFwX3BhZ2VzKCkuIElmIEkgYW0gbm90IG1pc3Rha2Vu
LCByZXNlcnZlZCBwYWdlcyBhcmUgbm90DQo+ID4+IGNvbnNpZGVyZWQgYXMgeGVuIGhlYXAgcGFn
ZXMsIHNvIHdlIHdvdWxkIGdvIGluIHRoZSBlbHNlIHdoaWNoIHdpbGwNCj4gPj4gZW5kIHVwIHRv
IGNhbGwgZnJlZV9oZWFwX3BhZ2VzKCkuDQo+ID4+DQo+ID4+IGZyZWVfaGVhcF9wYWdlcygpIHdp
bGwgZW5kIHVwIHRvIGFkZCB0aGUgcGFnZSBpbiB0aGUgaGVhcCBhbGxvY2F0b3INCj4gPj4gYW5k
IGNvcnJ1cHQgdGhlIGQtPnJlc3ZfcGFnZV9saXN0IGJlY2F1c2UgdGhlcmUgYXJlIG9ubHkgb25l
IGxpbmsgbGlzdC4NCj4gPj4NCj4gPj4gV2hhdCBkaWQgSSBtaXNzPw0KPiA+Pg0KPiA+DQo+ID4g
SW4gbXkgZmlyc3QgY29tbWl0ICJkbyBub3QgZnJlZSByZXNlcnZlZCBtZW1vcnkgaW50byBoZWFw
IiwgSSd2ZQ0KPiA+IGNoYW5nZWQgdGhlIGJlaGF2aW9yIGZvciByZXNlcnZlZCBwYWdlcyBpbiBm
cmVlX2hlYXBfcGFnZXMoKQ0KPiA+ICsgICAgaWYgKCBwZy0+Y291bnRfaW5mbyAmIFBHQ19yZXNl
cnZlZCApdGhhdA0KPiA+ICsgICAgICAgIC8qIFJlc2VydmVkIHBhZ2Ugc2hhbGwgbm90IGdvIGJh
Y2sgdG8gdGhlIGhlYXAuICovDQo+ID4gKyAgICAgICAgcmV0dXJuIGZyZWVfc3RhdGljbWVtX3Bh
Z2VzKHBnLCAxVUwgPDwgb3JkZXIsIG5lZWRfc2NydWIpOw0KPiA+ICsNCj4gDQo+IEhtbW0uLi4g
c29tZWhvdyB0aGlzIGUtbWFpbCBpcyBuZWl0aGVyIGluIG15IGluYm94IG5vciBpbiB0aGUgYXJj
aGl2ZXMgb24NCj4gbG9yZS5rZXJuZWwub3JnLg0KPiANCg0KT2guLi4uIEkganVzdCBnb3QgZW1h
aWwgZnJvbSB0ZXNzaWFuIHRoYXQgdGhleSBoZWxkIG15IGZpcnN0IGNvbW1pdCwgYW5kIG5lZWRl
ZCBteQ0KY29uZmlybWF0aW9uIHRvIHNlbmQuIFNvIHNvcnJ5IGFib3V0IHRoYXQhISENCg0KSSds
bCByZS1zZW5kIG15IGZpcnN0IGNvbW1pdCBBU0FQLg0KDQo+IENoZWVycywNCj4gLS0NCj4gSnVs
aWVuIEdyYWxsDQo=

