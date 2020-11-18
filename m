Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CD42B78FC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29418.58803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ5h-0006SJ-Lj; Wed, 18 Nov 2020 08:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29418.58803; Wed, 18 Nov 2020 08:45:25 +0000
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
	id 1kfJ5h-0006Ru-I6; Wed, 18 Nov 2020 08:45:25 +0000
Received: by outflank-mailman (input) for mailman id 29418;
 Wed, 18 Nov 2020 08:45:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xcH=EY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kfJ5f-0006Ri-JK
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:45:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 094ff0f9-15c8-4d3c-9555-e420c1bfcdc8;
 Wed, 18 Nov 2020 08:45:22 +0000 (UTC)
Received: from AM5PR0601CA0062.eurprd06.prod.outlook.com (2603:10a6:206::27)
 by DB6PR08MB2919.eurprd08.prod.outlook.com (2603:10a6:6:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:45:17 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::1f) by AM5PR0601CA0062.outlook.office365.com
 (2603:10a6:206::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 08:45:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 08:45:17 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Wed, 18 Nov 2020 08:45:17 +0000
Received: from 5caa43e8644d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E74829A7-F97E-4708-9BD7-E67829069F1E.1; 
 Wed, 18 Nov 2020 08:45:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5caa43e8644d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Nov 2020 08:45:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1656.eurprd08.prod.outlook.com (2603:10a6:4:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 08:45:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 08:45:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1xcH=EY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kfJ5f-0006Ri-JK
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:45:23 +0000
X-Inumbo-ID: 094ff0f9-15c8-4d3c-9555-e420c1bfcdc8
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.81])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 094ff0f9-15c8-4d3c-9555-e420c1bfcdc8;
	Wed, 18 Nov 2020 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzqAOmxlnpmCBeIgsOCIljyb4qxmTfi6iORSlNXxTIQ=;
 b=W+O1FTeL768a/RV9COaGUBjsudSDiXNzAVAT3dziqg87xExPiBiWsP4+nhL/zskdWmk7G8dq5bqboNQ3s974OGzTcAmtDW3iG0jhEta3pjeCYPYq3FhoFEeBOyYKvlknfQZ1CQe4dx7hfV/MWknUFUamENTiR4Xh0oFo+OSYUAo=
Received: from AM5PR0601CA0062.eurprd06.prod.outlook.com (2603:10a6:206::27)
 by DB6PR08MB2919.eurprd08.prod.outlook.com (2603:10a6:6:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:45:17 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::1f) by AM5PR0601CA0062.outlook.office365.com
 (2603:10a6:206::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 08:45:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 08:45:17 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Wed, 18 Nov 2020 08:45:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50319fd9ffc283d4
X-CR-MTA-TID: 64aa7808
Received: from 5caa43e8644d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E74829A7-F97E-4708-9BD7-E67829069F1E.1;
	Wed, 18 Nov 2020 08:45:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5caa43e8644d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Nov 2020 08:45:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XS1WIsknv2NKOvqKgvsAhRASFpiwvCjKe2omQH0PijeQTQTtncdpGt5effQHBCo7T73g/l3l7vfPDeSRGjkouaZwSNVQXKTZJodQRT6TBLQjw/m9+57kQ8h3WGFM2nJs330oSb2maaM7Nb7c1uP/kc0UoEOmYGdunZXkgmDTZuSPtOd2fp+Vz+d7aXejZUt9fW59TeK6p63LSZ4OhtesmieOBhtmbKsfZk3qtQ92Isi1NkdtZB2cYU1ZB0NR7oXbsX6v/nW/7QzAKQvG9AftLDLUTJT/CD2L92DRLYE7hBtjoj5HUATSdakFS+2+tWiPDJ4mJ+HXN5CqidRjRYuViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzqAOmxlnpmCBeIgsOCIljyb4qxmTfi6iORSlNXxTIQ=;
 b=mpuVEyUmfuztlMtxuI6mu1vn2TMhpkiMFztBmtglnsqruQHWfAm2vJtXhfKjPwyg5vCOnRRP5oDfhaVd+CaoXA4q72R1jCY5CkleM/AhVNbV45oIsAimnbwtvEkRaeK2oVZG1+qN62rBNd2s5OAbgHxGUdSHNFX2/28H5q+6n515ECGlYMHecGSUk/Ti+LCvOvwocfehx3UTLqhTohiH/ZVUEYl3ba3iCX8ZWnDJnXl5vw8YfRzX2IPs4YNyFxSS4VkeIPVGYt7R+Am2vdG1ju7rC8kSfgdYWnVWMB1nFJCmxMMvG721Uq+HpLrsaEpZfxndRqIliduPNUbqE3m/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzqAOmxlnpmCBeIgsOCIljyb4qxmTfi6iORSlNXxTIQ=;
 b=W+O1FTeL768a/RV9COaGUBjsudSDiXNzAVAT3dziqg87xExPiBiWsP4+nhL/zskdWmk7G8dq5bqboNQ3s974OGzTcAmtDW3iG0jhEta3pjeCYPYq3FhoFEeBOyYKvlknfQZ1CQe4dx7hfV/MWknUFUamENTiR4Xh0oFo+OSYUAo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1656.eurprd08.prod.outlook.com (2603:10a6:4:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 08:45:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 08:45:08 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Topic: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Index: AQHWvUT1dGbwa+YaakuAH1PIoRpzaanNk7GA
Date: Wed, 18 Nov 2020 08:45:07 +0000
Message-ID: <0A50C952-B9D8-44C3-9326-A0555B435693@arm.com>
References: <20201118005051.26115-1-sstabellini@kernel.org>
In-Reply-To: <20201118005051.26115-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9a7b953f-1414-4398-f499-08d88b9e4648
x-ms-traffictypediagnostic: DB6PR0801MB1656:|DB6PR08MB2919:
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB291907F5B10B073CDEF8458C9DE10@DB6PR08MB2919.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZexJUnefE1/jH63pKYd/UwIHmynC2KYnQRj6JfzVtSYTwTqdoIAAIZLvtxshGGxKicIJXD1hLX14P+ygVpPZKN3IcGetgSw7nwrMAKFcB9f8pugMaRCzQRNIyED09c3LKjwh9RSfTnPTE/s7yibc3E9C5WXG3voOHKfB5OZvxSupT3Rr9Vq3jtCR341JCuzpaWtDoS0DKCY0q674FPDgTcNprYLiGTpCN/iKGSSe9ZPCVvnjHffmDI+xSbltn2Z6V/bw3/SLo3JEG47EmdaIpbjPvfktmskeFtfNtRHj9eB7HG85dAfzWcV53t805xdSYvmBCmlqm3pSRIslGt5tf8ICWTzvDFg9FSe03xqICsujpC1CF3yNalUW94qZ8i4eJ8FBxlzJBBdNhoezPrII3Wwry9Jp22gIbbJ4ZBnslZxwdzcHMNj9iRt1X0ytVqe97a7HYrp4dEXcgcIaccxXQQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(6512007)(5660300002)(83380400001)(6916009)(2906002)(86362001)(54906003)(66476007)(64756008)(4326008)(66946007)(91956017)(66446008)(186003)(53546011)(6486002)(66556008)(478600001)(26005)(71200400001)(76116006)(2616005)(36756003)(316002)(6506007)(33656002)(8676002)(8936002)(966005)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Q9ISNhp3Gvu9PD2+W0r5uMzyIw1lhgwE42Qhmd+sWNaa0f0tqJTd/G8PC48TbgQzXJXhGw0Gd2cAx8tOxvrE/jJPHhXK9MtRvAx+J39JDzD+lwj1Oh7LDhXPUvY4cObuP735PPqtLjZ/63z07YRCbQpV2hXl7YVNWAgnYMe/6nIxNMr17r8Df2f5fUHaesFLeUi7hwO0bGD0RMcm3DFC6Lf98WTbmkuC/5SBnbVM+tdUm5N05OwV9U5E9HuDGMKYqm2w3V+ho8Rv81njf2J3Q0RsK2uIY+2oQQlZ7eCiduK1TorgmEtv5VjsxaD3jOXtNL6icJNUp2LzDsoAuVcDogM4E2clyusuXPq2avIAvi8YWJTXObQ9JO0t0jeG2gKoY5pDqvcLWSEuvNy6d5N29I6aVUPLmUm+BY6HAIeUnMQYehpUQ4e5pTR7csAHKovuUmg2NcbKBUgWi6SduHQE85O2l1+3eaK+nxpOILruGyJesidf2NRwWem7f2pt4/MP2q1MRGX76JOJEggC8eNFNIgQrVqd7VUwjbdUxYjQe/Qcz5RdVewQB0ionTjHD5Sz7orZid9IFB+jgVS26wjde8aO7BdOUNHBuaCriOa/Cm+orgL+IPkmri5qtcuNQYAAAeVKGUtPs/AwgaYfVb3WDg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BA35AFF8A9C46459F8299B8886372EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1656
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04830b8d-d78d-4f0c-591e-08d88b9e40c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t0LD2M64udtaNu14R2K7IgErdyLf1p9Kq4Wdz1kAM4eOPjoPiWVZ9wwcFbcfA45Nv+MAIEdoMtZgES4KPDtV3RrFpBiGPeJOrtcmrHEfPtm+8s6C/3bjuwWdBYmT54z7hP49+ay3XDXSwh62EYKgrKa4UC4S2eQk+84+o2AUNSq0VvnQEDAX8ZzxIQkqJ6hMZ4wmqdDkUGYckX65BeoNjGtN5ynoykvuABeUWY1D8A6MnAaiJqMTU8g6tLn1ikGpOoBlGzNt0O8U/WXJC9Tzak8t/YVJLYztF4ZLwi2lrP+5POoYV90vZlGkAMvDOITUUE9QoM0u61vhngMdkut29lVW5yLRD3qzwgpvHADzUIjIj8q6wppyMMDOOLGKkuCvJsYkR87ptE/MrZxpAc9Toe/Dhb9xpzes85vej1nuvK8s53XJUNLByctfSmN0B4xh4GzDZ1zqLVEp2U50K8mJ8NbMSHDH0r9ghuHAB4uQ9eWdWbLatRuc84NvGVL+quLn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(33656002)(81166007)(6486002)(47076004)(478600001)(82310400003)(6506007)(70206006)(356005)(336012)(186003)(82740400003)(5660300002)(26005)(70586007)(53546011)(8676002)(83380400001)(8936002)(36756003)(2616005)(2906002)(6512007)(86362001)(36906005)(316002)(6862004)(54906003)(4326008)(966005)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:45:17.2465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7b953f-1414-4398-f499-08d88b9e4648
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2919

SGkgU3RlZmFubywNCg0KPiBPbiAxOCBOb3YgMjAyMCwgYXQgMDA6NTAsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPiANCj4gQSByZWNl
bnQgdGhyZWFkIFsxXSBoYXMgZXhwb3NlZCBhIGNvdXBsZSBvZiBpc3N1ZXMgd2l0aCBvdXIgY3Vy
cmVudCB3YXkNCj4gb2YgaGFuZGxpbmcgRVhQRVJULg0KPiANCj4gMSkgSXQgaXMgbm90IG9idmlv
dXMgdGhhdCAiQ29uZmlndXJlIHN0YW5kYXJkIFhlbiBmZWF0dXJlcyAoZXhwZXJ0DQo+IHVzZXJz
KSIgaXMgYWN0dWFsbHkgdGhlIGZhbW91cyBFWFBFUlQgd2Uga2VlcCB0YWxraW5nIGFib3V0IG9u
IHhlbi1kZXZlbA0KPiANCj4gMikgSXQgaXMgbm90IG9idmlvdXMgd2hlbiB3ZSBuZWVkIHRvIGVu
YWJsZSBFWFBFUlQgdG8gZ2V0IGEgc3BlY2lmaWMNCj4gZmVhdHVyZQ0KPiANCj4gSW4gcGFydGlj
dWxhciBpZiB5b3Ugd2FudCB0byBlbmFibGUgQUNQSSBzdXBwb3J0IHNvIHRoYXQgeW91IGNhbiBi
b290DQo+IFhlbiBvbiBhbiBBQ1BJIHBsYXRmb3JtLCB5b3UgaGF2ZSB0byBlbmFibGUgRVhQRVJU
IGZpcnN0LiBCdXQgc2VhcmNoaW5nDQo+IHRocm91Z2ggdGhlIGtjb25maWcgbWVudSBpdCBpcyBy
ZWFsbHkgbm90IGNsZWFyICh0eXBlICcvJyBhbmQgIkFDUEkiKToNCj4gbm90aGluZyBpbiB0aGUg
ZGVzY3JpcHRpb24gdGVsbHMgeW91IHRoYXQgeW91IG5lZWQgdG8gZW5hYmxlIEVYUEVSVCB0bw0K
PiBnZXQgdGhlIG9wdGlvbi4NCg0KVGhpcyBpcyBhIGdyZWF0IGNoYW5nZSB0aGF0IG1ha2VzIGNv
bmZpZ3VyYXRpb24gbW9yZSBjbGVhci4NCg0KPiANCj4gU28gdGhpcyBwYXRjaCBtYWtlcyB0aGlu
Z3MgZWFzaWVyIGJ5IGRvaW5nIHR3byB0aGluZ3M6DQo+IA0KPiAtIGludHJvZHVjZSBhIG5ldyBr
Y29uZmlnIG9wdGlvbiBVTlNVUFBPUlRFRCB3aGljaCBpcyBjbGVhcmx5IHRvIGVuYWJsZQ0KPiAg
VU5TVVBQT1JURUQgZmVhdHVyZXMgYXMgZGVmaW5lZCBieSBTVVBQT1JULm1kDQo+IA0KPiAtIGNo
YW5nZSBFWFBFUlQgb3B0aW9ucyB0byBVTlNVUFBPUlRFRCB3aGVyZSBpdCBtYWtlcyBzZW5zZTog
a2VlcA0KPiAgZGVwZW5kaW5nIG9uIEVYUEVSVCBmb3IgZmVhdHVyZXMgbWFkZSBmb3IgZXhwZXJ0
cw0KPiANCj4gLSB0YWcgdW5zdXBwb3J0ZWQgZmVhdHVyZXMgYnkgYWRkaW5nIChVTlNVUFBPUlRF
RCkgdG8gdGhlIG9uZS1saW5lDQo+ICBkZXNjcmlwdGlvbg0KPiANCj4gLSBjbGFyaWZ5IHRoZSBF
WFBFUlQgb25lLWxpbmUgZGVzY3JpcHRpb24NCg0KU2hvdWxkIHdlIGFsc28gZm9sbG93IHRoZSBz
Y2hlbWUgYW5kIGFkZCAoRVhQRVJUKSBpbiB0aGUgdGV4dCBmb3IgZXhwZXJ0IG9wdGlvbnMgPw0K
DQphbmQgb25lIHNtYWxsIGZpeA0KDQo+IA0KPiBbMV0gaHR0cHM6Ly9tYXJjLmluZm8vP2w9eGVu
LWRldmVsJm09MTYwMzMzMTAxMjI4OTgxDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPiBDQzogYW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbQ0KPiBDQzogZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tDQo+IENDOiBp
d2pAeGVucHJvamVjdC5vcmcNCj4gQ0M6IGpiZXVsaWNoQHN1c2UuY29tDQo+IENDOiBqdWxpZW5A
eGVuLm9yZw0KPiBDQzogd2xAeGVuLm9yZw0KPiANCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+
IC0gaW50cm9kdWNlIFVOU1VQUE9SVEVEIGFzIGEgc2VwYXJhdGUgbmV3IG9wdGlvbg0KPiAtIGRv
bid0IHN3aXRjaCBhbGwgRVhQRVJUIG9wdGlvbnMgdG8gVU5TVVBQT1JURUQNCj4gLS0tDQo+IHhl
bi9LY29uZmlnICAgICAgICAgICAgICB8IDExICsrKysrKysrKystDQo+IHhlbi9hcmNoL2FybS9L
Y29uZmlnICAgICB8IDEwICsrKysrLS0tLS0NCj4geGVuL2FyY2gveDg2L0tjb25maWcgICAgIHwg
IDggKysrKy0tLS0NCj4geGVuL2NvbW1vbi9LY29uZmlnICAgICAgIHwgIDQgKystLQ0KPiB4ZW4v
Y29tbW9uL3NjaGVkL0tjb25maWcgfCAgNiArKystLS0NCj4gNSBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vS2Nv
bmZpZyBiL3hlbi9LY29uZmlnDQo+IGluZGV4IDM0YzMxOGJmYTIuLjU5NDAwYzQ3ODggMTAwNjQ0
DQo+IC0tLSBhL3hlbi9LY29uZmlnDQo+ICsrKyBiL3hlbi9LY29uZmlnDQo+IEBAIC0zNCw4ICsz
NCwxNyBAQCBjb25maWcgREVGQ09ORklHX0xJU1QNCj4gCW9wdGlvbiBkZWZjb25maWdfbGlzdA0K
PiAJZGVmYXVsdCBBUkNIX0RFRkNPTkZJRw0KPiANCj4gK2NvbmZpZyBVTlNVUFBPUlRFRA0KPiAr
CWJvb2wgIkNvbmZpZ3VyZSBVTlNVUFBPUlRFRCBmZWF0dXJlcyINCj4gKwloZWxwDQo+ICsJICBU
aGlzIG9wdGlvbiBhbGxvd3MgdW5zdXBwb3J0ZWQgWGVuIG9wdGlvbnMgdG8gYmUgZW5hYmxlZCwg
d2hpY2gNCj4gKwkgIGluY2x1ZGVzIG5vbi1zZWN1cml0eS1zdXBwb3J0ZWQsIGV4cGVyaW1lbnRh
bCwgYW5kIHRlY2ggcHJldmlldw0KPiArCSAgZmVhdHVyZXMgYXMgZGVmaW5lZCBieSBTVVBQT1JU
Lm1kLiBYZW4gYmluYXJpZXMgYnVpbHQgd2l0aCB0aGlzDQo+ICsJICBvcHRpb24gZW5hYmxlZCBh
cmUgbm90IHNlY3VyaXR5IHN1cHBvcnRlZC4NCj4gKwlkZWZhdWx0IG4NCj4gKw0KPiBjb25maWcg
RVhQRVJUDQo+IC0JYm9vbCAiQ29uZmlndXJlIHN0YW5kYXJkIFhlbiBmZWF0dXJlcyAoZXhwZXJ0
IHVzZXJzKSINCj4gKwlib29sICJDb25maWd1cmUgRVhQRVJUIGZlYXR1cmVzIg0KPiAJaGVscA0K
PiAJICBUaGlzIG9wdGlvbiBhbGxvd3MgY2VydGFpbiBiYXNlIFhlbiBvcHRpb25zIGFuZCBzZXR0
aW5ncw0KPiAJICB0byBiZSBkaXNhYmxlZCBvciB0d2Vha2VkLiBUaGlzIGlzIGZvciBzcGVjaWFs
aXplZCBlbnZpcm9ubWVudHMNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIv
eGVuL2FyY2gvYXJtL0tjb25maWcNCj4gaW5kZXggZjkzOGRkMjFiZC4uNTk4MWU3MzgwZCAxMDA2
NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gKysrIGIveGVuL2FyY2gvYXJtL0tj
b25maWcNCj4gQEAgLTMyLDcgKzMyLDcgQEAgbWVudSAiQXJjaGl0ZWN0dXJlIEZlYXR1cmVzIg0K
PiBzb3VyY2UgImFyY2gvS2NvbmZpZyINCj4gDQo+IGNvbmZpZyBBQ1BJDQo+IC0JYm9vbCAiQUNQ
SSAoQWR2YW5jZWQgQ29uZmlndXJhdGlvbiBhbmQgUG93ZXIgSW50ZXJmYWNlKSBTdXBwb3J0IiBp
ZiBFWFBFUlQNCj4gKwlib29sICJBQ1BJIChBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBQb3dl
ciBJbnRlcmZhY2UpIFN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gCWRl
cGVuZHMgb24gQVJNXzY0DQo+IAktLS1oZWxwLS0tDQo+IA0KPiBAQCAtNDksNyArNDksNyBAQCBj
b25maWcgR0lDVjMNCj4gCSAgSWYgdW5zdXJlLCBzYXkgWQ0KPiANCj4gY29uZmlnIEhBU19JVFMN
Cj4gLSAgICAgICAgYm9vbCAiR0lDdjMgSVRTIE1TSSBjb250cm9sbGVyIHN1cHBvcnQiIGlmIEVY
UEVSVA0KPiArICAgICAgICBib29sICJHSUN2MyBJVFMgTVNJIGNvbnRyb2xsZXIgc3VwcG9ydCAo
VU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPiAgICAgICAgIGRlcGVuZHMgb24gR0lDVjMg
JiYgIU5FV19WR0lDDQo+IA0KPiBjb25maWcgSFZNDQo+IEBAIC03OSw3ICs3OSw3IEBAIGNvbmZp
ZyBTQlNBX1ZVQVJUX0NPTlNPTEUNCj4gCSAgU0JTQSBHZW5lcmljIFVBUlQgaW1wbGVtZW50cyBh
IHN1YnNldCBvZiBBUk0gUEwwMTEgVUFSVC4NCj4gDQo+IGNvbmZpZyBBUk1fU1NCRA0KPiAtCWJv
b2wgIlNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzcyBEaXNhYmxlIiBpZiBFWFBFUlQNCj4gKwlib29s
ICJTcGVjdWxhdGl2ZSBTdG9yZSBCeXBhc3MgRGlzYWJsZSAoVU5TVVBQT1JURUQpIiBpZiBVTlNV
UFBPUlRFRA0KPiAJZGVwZW5kcyBvbiBIQVNfQUxURVJOQVRJVkUNCj4gCWRlZmF1bHQgeQ0KPiAJ
aGVscA0KPiBAQCAtODksNyArODksNyBAQCBjb25maWcgQVJNX1NTQkQNCj4gCSAgSWYgdW5zdXJl
LCBzYXkgWS4NCj4gDQo+IGNvbmZpZyBIQVJERU5fQlJBTkNIX1BSRURJQ1RPUg0KPiAtCWJvb2wg
IkhhcmRlbiB0aGUgYnJhbmNoIHByZWRpY3RvciBhZ2FpbnN0IGFsaWFzaW5nIGF0dGFja3MiIGlm
IEVYUEVSVA0KPiArCWJvb2wgIkhhcmRlbiB0aGUgYnJhbmNoIHByZWRpY3RvciBhZ2FpbnN0IGFs
aWFzaW5nIGF0dGFja3MgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gCWRlZmF1bHQg
eQ0KPiAJaGVscA0KPiAJICBTcGVjdWxhdGlvbiBhdHRhY2tzIGFnYWluc3Qgc29tZSBoaWdoLXBl
cmZvcm1hbmNlIHByb2Nlc3NvcnMgcmVseSBvbg0KPiBAQCAtMTA2LDcgKzEwNiw3IEBAIGNvbmZp
ZyBIQVJERU5fQlJBTkNIX1BSRURJQ1RPUg0KPiAJICBJZiB1bnN1cmUsIHNheSBZLg0KPiANCj4g
Y29uZmlnIFRFRQ0KPiAtCWJvb2wgIkVuYWJsZSBURUUgbWVkaWF0b3JzIHN1cHBvcnQiIGlmIEVY
UEVSVA0KPiArCWJvb2wgIkVuYWJsZSBURUUgbWVkaWF0b3JzIHN1cHBvcnQgKFVOU1VQUE9SVEVE
KSIgaWYgVU5TVVBQT1JURUQNCj4gCWRlZmF1bHQgbg0KPiAJaGVscA0KPiAJICBUaGlzIG9wdGlv
biBlbmFibGVzIGdlbmVyaWMgVEVFIG1lZGlhdG9ycyBzdXBwb3J0LiBJdCBhbGxvd3MgZ3Vlc3Rz
DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnDQo+IGluZGV4IDI0ODY4YWE2YWQuLmQ0ZTIwZTlkMzEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9LY29uZmlnDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+IEBAIC0xMDIs
OCArMTAyLDggQEAgY29uZmlnIEhWTQ0KPiAJICBJZiB1bnN1cmUsIHNheSBZLg0KPiANCj4gY29u
ZmlnIFhFTl9TSFNUSw0KPiAtCWJvb2wgIlN1cGVydmlzb3IgU2hhZG93IFN0YWNrcyINCj4gLQlk
ZXBlbmRzIG9uIEhBU19BU19DRVRfU1MgJiYgRVhQRVJUDQo+ICsJYm9vbCAiU3VwZXJ2aXNvciBT
aGFkb3cgU3RhY2tzIChVTlNVUFBPUlRFRCkiDQo+ICsJZGVwZW5kcyBvbiBIQVNfQVNfQ0VUX1NT
ICYmIFVOU1VQUE9SVEVEDQoNClRoaXMgb25lIGlzIG5vdCBmb2xsb3dpbmcgdGhlIHN0YW5kYXJk
IHNjaGVtZSB3aXRoIOKAnGlmIFVOU1VQUE9SVEVEIg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4g
CWRlZmF1bHQgeQ0KPiAJLS0taGVscC0tLQ0KPiAJICBDb250cm9sLWZsb3cgRW5mb3JjZW1lbnQg
VGVjaG5vbG9neSAoQ0VUKSBpcyBhIHNldCBvZiBmZWF0dXJlcyBpbg0KPiBAQCAtMTY1LDcgKzE2
NSw3IEBAIGNvbmZpZyBIVk1fRkVQDQo+IAkgIElmIHVuc3VyZSwgc2F5IE4uDQo+IA0KPiBjb25m
aWcgVEJPT1QNCj4gLQlib29sICJYZW4gdGJvb3Qgc3VwcG9ydCIgaWYgRVhQRVJUDQo+ICsJYm9v
bCAiWGVuIHRib290IHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gCWRl
ZmF1bHQgeSBpZiAhUFZfU0hJTV9FWENMVVNJVkUNCj4gCXNlbGVjdCBDUllQVE8NCj4gCS0tLWhl
bHAtLS0NCj4gQEAgLTI1MSw3ICsyNTEsNyBAQCBjb25maWcgSFlQRVJWX0dVRVNUDQo+IGVuZGlm
DQo+IA0KPiBjb25maWcgTUVNX1NIQVJJTkcNCj4gLQlib29sICJYZW4gbWVtb3J5IHNoYXJpbmcg
c3VwcG9ydCIgaWYgRVhQRVJUDQo+ICsJYm9vbCAiWGVuIG1lbW9yeSBzaGFyaW5nIHN1cHBvcnQg
KFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gCWRlcGVuZHMgb24gSFZNDQo+IA0KPiBl
bmRtZW51DQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tj
b25maWcNCj4gaW5kZXggM2UyY2YyNTA4OC4uYmVlZDUwNzcyNyAxMDA2NDQNCj4gLS0tIGEveGVu
L2NvbW1vbi9LY29uZmlnDQo+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZw0KPiBAQCAtMTUxLDcg
KzE1MSw3IEBAIGNvbmZpZyBLRVhFQw0KPiAJICBJZiB1bnN1cmUsIHNheSBZLg0KPiANCj4gY29u
ZmlnIEVGSV9TRVRfVklSVFVBTF9BRERSRVNTX01BUA0KPiAtICAgIGJvb2wgIkVGSTogY2FsbCBT
ZXRWaXJ0dWFsQWRkcmVzc01hcCgpIiBpZiBFWFBFUlQNCj4gKyAgICBib29sICJFRkk6IGNhbGwg
U2V0VmlydHVhbEFkZHJlc3NNYXAoKSAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPiAg
ICAgLS0taGVscC0tLQ0KPiAgICAgICBDYWxsIEVGSSBTZXRWaXJ0dWFsQWRkcmVzc01hcCgpIHJ1
bnRpbWUgc2VydmljZSB0byBzZXR1cCBtZW1vcnkgbWFwIGZvcg0KPiAgICAgICBmdXJ0aGVyIHJ1
bnRpbWUgc2VydmljZXMuIEFjY29yZGluZyB0byBVRUZJIHNwZWMsIGl0IGlzbid0IHN0cmljdGx5
DQo+IEBAIC0yNzIsNyArMjcyLDcgQEAgY29uZmlnIExBVEVfSFdET00NCj4gCSAgSWYgdW5zdXJl
LCBzYXkgTi4NCj4gDQo+IGNvbmZpZyBBUkdPDQo+IC0JYm9vbCAiQXJnbzogaHlwZXJ2aXNvci1t
ZWRpYXRlZCBpbnRlcmRvbWFpbiBjb21tdW5pY2F0aW9uIiBpZiBFWFBFUlQNCj4gKwlib29sICJB
cmdvOiBoeXBlcnZpc29yLW1lZGlhdGVkIGludGVyZG9tYWluIGNvbW11bmljYXRpb24gKFVOU1VQ
UE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gCS0tLWhlbHAtLS0NCj4gCSAgRW5hYmxlcyBhIGh5
cGVyY2FsbCBmb3IgZG9tYWlucyB0byBhc2sgdGhlIGh5cGVydmlzb3IgdG8gcGVyZm9ybQ0KPiAJ
ICBkYXRhIHRyYW5zZmVyIG9mIG1lc3NhZ2VzIGJldHdlZW4gZG9tYWlucy4NCj4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vc2NoZWQvS2NvbmZpZyBiL3hlbi9jb21tb24vc2NoZWQvS2NvbmZpZw0K
PiBpbmRleCA2MTIzMWFhY2FhLi45NGM5ZTIwMTM5IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9u
L3NjaGVkL0tjb25maWcNCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9LY29uZmlnDQo+IEBAIC0x
NSw3ICsxNSw3IEBAIGNvbmZpZyBTQ0hFRF9DUkVESVQyDQo+IAkgIG9wdGltaXplZCBmb3IgbG93
ZXIgbGF0ZW5jeSBhbmQgaGlnaGVyIFZNIGRlbnNpdHkuDQo+IA0KPiBjb25maWcgU0NIRURfUlRE
Uw0KPiAtCWJvb2wgIlJURFMgc2NoZWR1bGVyIHN1cHBvcnQgKEVYUEVSSU1FTlRBTCkiDQo+ICsJ
Ym9vbCAiUlREUyBzY2hlZHVsZXIgc3VwcG9ydCAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRF
RA0KPiAJZGVmYXVsdCB5DQo+IAktLS1oZWxwLS0tDQo+IAkgIFRoZSBSVERTIHNjaGVkdWxlciBp
cyBhIHNvZnQgYW5kIGZpcm0gcmVhbC10aW1lIHNjaGVkdWxlciBmb3INCj4gQEAgLTIzLDE0ICsy
MywxNCBAQCBjb25maWcgU0NIRURfUlREUw0KPiAJICBpbiB0aGUgY2xvdWQsIGFuZCBnZW5lcmFs
IGxvdy1sYXRlbmN5IHdvcmtsb2Fkcy4NCj4gDQo+IGNvbmZpZyBTQ0hFRF9BUklOQzY1Mw0KPiAt
CWJvb2wgIkFSSU5DNjUzIHNjaGVkdWxlciBzdXBwb3J0IChFWFBFUklNRU5UQUwpIg0KPiArCWJv
b2wgIkFSSU5DNjUzIHNjaGVkdWxlciBzdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQUE9S
VEVEDQo+IAlkZWZhdWx0IERFQlVHDQo+IAktLS1oZWxwLS0tDQo+IAkgIFRoZSBBUklOQzY1MyBz
Y2hlZHVsZXIgaXMgYSBoYXJkIHJlYWwtdGltZSBzY2hlZHVsZXIgZm9yIHNpbmdsZQ0KPiAJICBj
b3JlcywgdGFyZ2V0ZWQgZm9yIGF2aW9uaWNzLCBkcm9uZXMsIGFuZCBtZWRpY2FsIGRldmljZXMu
DQo+IA0KPiBjb25maWcgU0NIRURfTlVMTA0KPiAtCWJvb2wgIk51bGwgc2NoZWR1bGVyIHN1cHBv
cnQgKEVYUEVSSU1FTlRBTCkiDQo+ICsJYm9vbCAiTnVsbCBzY2hlZHVsZXIgc3VwcG9ydCAoVU5T
VVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPiAJZGVmYXVsdCB5DQo+IAktLS1oZWxwLS0tDQo+
IAkgIFRoZSBudWxsIHNjaGVkdWxlciBpcyBhIHN0YXRpYywgemVybyBvdmVyaGVhZCBzY2hlZHVs
ZXIsDQo+IC0tIA0KPiAyLjE3LjENCj4gDQoNCg==

