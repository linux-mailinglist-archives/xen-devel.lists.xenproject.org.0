Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01F29C478
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 18:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13016.33540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXTDl-0000e0-4t; Tue, 27 Oct 2020 17:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13016.33540; Tue, 27 Oct 2020 17:57:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXTDl-0000dd-1f; Tue, 27 Oct 2020 17:57:21 +0000
Received: by outflank-mailman (input) for mailman id 13016;
 Tue, 27 Oct 2020 17:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4TT=EC=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kXTDj-0000dY-DF
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:57:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.89]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd0dd83c-ed96-4c5a-8bff-6fee2d90b3e2;
 Tue, 27 Oct 2020 17:57:17 +0000 (UTC)
Received: from MRXP264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::26)
 by VE1PR08MB5821.eurprd08.prod.outlook.com (2603:10a6:800:1b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 17:57:14 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::6f) by MRXP264CA0038.outlook.office365.com
 (2603:10a6:500:14::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 27 Oct 2020 17:57:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 17:57:14 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Tue, 27 Oct 2020 17:57:12 +0000
Received: from bfabdf19ea4b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0712E98F-97FF-44C4-B625-9EAB07C6B910.1; 
 Tue, 27 Oct 2020 17:57:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfabdf19ea4b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Oct 2020 17:57:05 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1654.eurprd08.prod.outlook.com (2603:10a6:4:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 17:57:03 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 17:57:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x4TT=EC=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kXTDj-0000dY-DF
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:57:19 +0000
X-Inumbo-ID: fd0dd83c-ed96-4c5a-8bff-6fee2d90b3e2
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.89])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fd0dd83c-ed96-4c5a-8bff-6fee2d90b3e2;
	Tue, 27 Oct 2020 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqWwbo+0I5dCDOVwwtBJrTZ2XYC/jsTBsx7WLk6ov+4=;
 b=mLy9myRFz0EYx5yhCvdKIIHbyUjVAU9GeOuA42WcM7vp4HVgwwMyMOiP5dgHrdk/G9DojPKN2/OH3lkvNFDoD1o0ZW7rWAKbPE1WF4tVOJol7QXdBf/m76OGQJQEjKvvYyvHLOS/QN4nLcoFaAflWDTuPMgJcw9x4Zw6lwdzlLc=
Received: from MRXP264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::26)
 by VE1PR08MB5821.eurprd08.prod.outlook.com (2603:10a6:800:1b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 17:57:14 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::6f) by MRXP264CA0038.outlook.office365.com
 (2603:10a6:500:14::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 27 Oct 2020 17:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 17:57:14 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Tue, 27 Oct 2020 17:57:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2869ff47589fdbd
X-CR-MTA-TID: 64aa7808
Received: from bfabdf19ea4b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0712E98F-97FF-44C4-B625-9EAB07C6B910.1;
	Tue, 27 Oct 2020 17:57:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfabdf19ea4b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Oct 2020 17:57:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfyUj8WzktkOiKbz7kxkX4CUgYMJZ9DIY/ctqdnMffaivQDovhzLc2/yC/tofuAxsWPhut35xVuGv6Ee0HRvluYKaE8qESu+IeF8n7AOzy+GBnSImqLnR+s+DZ5k0VP6Y7ozoRir5s9gd8ap96KJuNGpC7kMoqT4bP+Y8HM6UG9nMbsBwnEVyOS+dSaWDb3cz3cUi/LFAc26pj5qpe9otcTihEsSpeRQP1zJEI9q2BcoMcennAnE8mbS6biTPYPdDan6e+0ekVmk1cI2eaKExVu7C2xcG4DYE+mqKdgtfTuKxfQL+7wMIj+PuqSXCzszfyJZ5fY304HuDfX4SO/LLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqWwbo+0I5dCDOVwwtBJrTZ2XYC/jsTBsx7WLk6ov+4=;
 b=Zoj6z8wux9j0JbrW3QxEUikQKWq8tjDM3BYn36FWGcdvBlCjZ4TuT/q91FW0AEPTZy3Z3DpONxGLv6zI7bEAJR8Lct/VQn9gKdrqqcVgEcll0HJmY6Oweua/yyiLV3HOF7TTgHtYOy63uyC8P8mgNIO5FEcQ6V45zwAaHO7aMRwuv3ur1bqD7zmZQltvgTj6Y43VWrxrfTmx00scuXL8qw9al6V5VhFUQJCZpAIuQEKsGf3K6GX7bljl7r3C6uydUt9hg8DHImLx7URUuYMR1Td7pXEfkEhSeukSoH4xvWZlj/DtOr82vZwunIFqWlE99XuWEI6257drzw6YijP+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqWwbo+0I5dCDOVwwtBJrTZ2XYC/jsTBsx7WLk6ov+4=;
 b=mLy9myRFz0EYx5yhCvdKIIHbyUjVAU9GeOuA42WcM7vp4HVgwwMyMOiP5dgHrdk/G9DojPKN2/OH3lkvNFDoD1o0ZW7rWAKbPE1WF4tVOJol7QXdBf/m76OGQJQEjKvvYyvHLOS/QN4nLcoFaAflWDTuPMgJcw9x4Zw6lwdzlLc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1654.eurprd08.prod.outlook.com (2603:10a6:4:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 17:57:03 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 17:57:03 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ash Wilding <Ash.Wilding@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvyGh0jWzCHpk6w/U7XN+08x6mgw0AAgAEzsQCAAWItgIABA+GAgADBXQCAABfAAIAAGI8AgAAORwCABG97AIAAEvKAgABzxQCAAUKcAIAABQSAgAA3qQA=
Date: Tue, 27 Oct 2020 17:57:02 +0000
Message-ID: <15D396A4-707C-44C2-B6F0-87BDB42171C4@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
 <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
 <BF2E5EF7-575B-4A8F-BC00-3F2B73754886@arm.com>
 <9cf9f8d3-b699-de3c-781f-f7ad1b498899@xen.org>
 <F573C8D3-3473-43CD-BA98-8D59E0188AF8@arm.com>
 <13baac40-8b10-0def-4e44-0d8f655fcaf1@xen.org>
In-Reply-To: <13baac40-8b10-0def-4e44-0d8f655fcaf1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2edb1bc-7c4e-47d1-e6d9-08d87aa1bc85
x-ms-traffictypediagnostic: DB6PR0801MB1654:|VE1PR08MB5821:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB582133756C4D1DB2917B8E759D160@VE1PR08MB5821.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 V76SM3TRk37lRkzezuHvzZDpvgPjJK5Cy68yQ1ap5x5fC/FXv8+w433RJem/FikIhTsJ8jzw1xrYvIDbBK5qDN5HjXBheKguDrnpeU12jkykoJs9cdci93GRADwRy81x0LS4LeTI2ENKjN9bLTrB4Zf7LTUxrOiaussecUfHgZPqNMCiKJAdWbZjOiZz94SA7DlS3QGvC4Zor3XbalTxMgiL/+8k5tGGcxrGwanVA+vBr9lJmT6kHI+rjYtAbDTGxc4Wn09KyCPxCT6mHdbnf6H9CK2Ca1wA1ZFeerHLM41eBtnQIK0A1QYHeQwEYeIoYxPw0Fh/Ni93EzXmz5JcEQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(478600001)(83380400001)(66946007)(6916009)(4326008)(26005)(36756003)(316002)(2906002)(186003)(66476007)(76116006)(66556008)(64756008)(91956017)(6506007)(53546011)(66446008)(86362001)(5660300002)(6512007)(2616005)(33656002)(6486002)(71200400001)(8676002)(54906003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 frmrzOZGLXEzDCxey3GlPL/QIXRmaMq+sXdxNKklB7WbG211MJ+MFRiDce59umgKNuBmP5rxfrX4Q1SfX6OIcWtycwECL9t3QDxaddhWuK3cXr7+/bTU0NgdR4OPrJhatx45AbA7Rc52hN3MIBSWFN3+LXOOPYAtfmvOf1G2vyenG22Ic1riIg6slTRLkRgfs6D3cxEcLuK+c7EhF757ClzjPrH7csfas29XM9jpaD0yG2T14E15Q+xLdMAgGKrfx3oTvTeImlQ4FM3Hh1UAaaGYI/CBGw6y3urxC7fgsltMAyATs6NPrBB6kn44+4qaKB/6wjzuscqUFPXFYNZ7+2o/VB9/aX1QmDQLfaD386waprEOvWbxFdMLXTjXETkFmYFqH0rPNINirZB2rFzST2kbwwm8CerDQ/eHiWI9gpdBpk/mwZrR5XzeLFT2QxPz0kLgsYIReUmdD7zUl7S2rsbS4Z3K9wd64WQ3ySiWZuCljAunJ01cYusnbG99xmkHP77aXtdcmaZWuNQoB0QSVhIpWpn6rTkWSII0AwRh0Pma50hGtO7RjO8AYgB1y1oDMS/9yPHq+RFcq8tycMidn0rT+b7f+BGlOiIUWwmoWVXWOuohA6Ds1xqCfMnonWW2b5pl/0eSmo4qJSJWnmNXew==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B7556D11E69D184EB103F98D2E904F4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1654
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16aabdf8-b1bc-446c-de32-08d87aa1b5ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7KBnhaw+EMCV7hIxm55EKm9PablEQicWaHL0luYsF5ErswnVavhiR7hC/U8cuhRhM2RmpHr0G+1dzHpFmdTWKeRu8ld0vmTFzGBFatrAQ5I087gRR3bkeQIxnNImYAsXnf48tjNS0+mG8bv0N6tkFGXhgAJbJxxBSE7h2ixejMeLcsBA94xQyxPyuKVA73RLDs4C0AUn4aGW0ib0+ExOOpZJt654KMm9lWrBLr0t8H3FxMwsPjYD2X5t8LscBQh3YnIKNXoyAfPZjLjoFgOGEX74cXfw00jYrXAtJRA855/2lKD5N7jslvvCQ9GvaFjQIECsR7Sbm4xO0gDC+RlBVT3LLImkn3QdshZUvnkS/6FDh1fhUQCe1H7pR2QFFotnY1Mij3IB+Qs33VjKzja/+A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39850400004)(46966005)(6862004)(81166007)(4326008)(36906005)(186003)(107886003)(36756003)(356005)(54906003)(83380400001)(86362001)(33656002)(8676002)(478600001)(70586007)(70206006)(6512007)(6506007)(47076004)(336012)(6486002)(316002)(82310400003)(2616005)(53546011)(26005)(8936002)(2906002)(82740400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 17:57:14.2121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2edb1bc-7c4e-47d1-e6d9-08d87aa1bc85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5821

Hi Julien,

> On 27 Oct 2020, at 14:37, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 27/10/2020 14:19, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 26 Oct 2020, at 19:05, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> On 26/10/2020 12:10, Ash Wilding wrote:
>>>> Hi,
>>>=20
>>> Hi Ash,
>>>=20
>>>>> 1. atomic_set_release
>>>>> 2. atomic_fetch_andnot_relaxed
>>>>> 3. atomic_cond_read_relaxed
>>>>> 4. atomic_long_cond_read_relaxed
>>>>> 5. atomic_long_xor
>>>>> 6. atomic_set_release
>>>>> 7. atomic_cmpxchg_relaxed might be we can use atomic_cmpxchg that is
>>>>>    implemented in XEN need to check.
>>>>> 8. atomic_dec_return_release
>>>>> 9. atomic_fetch_inc_relaxed
>>>> If we're going to pull in Linux's implementations of the above atomics
>>>> helpers for SMMUv3, and given the majority of SMMUv3 systems are v8.1+
>>>> with LSE, perhaps this would be a good time to drop the current
>>>> atomic.h in Xen completely and pull in both Linux's LL/SC and LSE
>>>> helpers,
>>>=20
>>> When I originally answered to the thread, I thought about suggesting im=
porting LSE. But I felt it was too much to ask in order to merge the SMMUv3=
 code.
>>>=20
>>> However, I would love to have support for LSE in Xen as this would solv=
e other not yet fully closed security issue with LL/SC (see XSA-295 [2]).
>>>=20
>>> Would Arm be willing to add support for LSE before merging the SMMUv3?
>> We are willing to work on LSE but I cannot commit on me and my team to s=
tart working on this subject before the end of the year.
>=20
> That's fine. There are other way we can bridge the gap between Xen and Li=
nux in order to get the latest version (see more below).
>=20
>> So I think it would be good to integrate this version of SMMUv3 and we c=
an then update it to the latest Linux one once LSE has been added.
>=20
> As I pointed out in my first e-mail on this thread, I am quite concerned =
that we are going to (re-)introduce bugs that have been fixed in Linux.
> Did you investigate that this is not going to happen?

We will take the action to check changes in Linux in the driver since the v=
ersion we are based on to make sure no critical fixes have been done
that are needed in our code.

>=20
> However, I think we can manage to get the latest version without requirin=
g LSE. It should be possible to provide dumb version of most the helpers.

If this is done, there would still be after a big work on switching to the =
newer code from Linux, testing and reviewing it.

Updating the driver after those dumb versions are added would still be poss=
ible.

Cheers
Bertrand

>=20
>> I think it make sense in the meantime to discuss how this should be desi=
gned but it might be a good idea to make a specific discussion thread for t=
hat.
>=20
> Make sense. Can you start a new thread?
>=20
> Cheers,
>=20
> --=20
> Julien Grall


