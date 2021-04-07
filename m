Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A4356CE2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 15:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106641.203895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU7s3-0007sX-7z; Wed, 07 Apr 2021 13:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106641.203895; Wed, 07 Apr 2021 13:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU7s3-0007s8-4k; Wed, 07 Apr 2021 13:05:23 +0000
Received: by outflank-mailman (input) for mailman id 106641;
 Wed, 07 Apr 2021 13:05:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IknL=JE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lU7s1-0007s3-Gi
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 13:05:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7cf94e6-23cd-47fc-9cfb-f57ab671300f;
 Wed, 07 Apr 2021 13:05:19 +0000 (UTC)
Received: from AM5PR0301CA0006.eurprd03.prod.outlook.com
 (2603:10a6:206:14::19) by AM0PR08MB3346.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 13:05:17 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::c) by AM5PR0301CA0006.outlook.office365.com
 (2603:10a6:206:14::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 13:05:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 13:05:16 +0000
Received: ("Tessian outbound b610e7b4d771:v90");
 Wed, 07 Apr 2021 13:05:16 +0000
Received: from ed1cd8645b77.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CEFAA410-6E66-468E-A585-2941F333D672.1; 
 Wed, 07 Apr 2021 13:05:05 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed1cd8645b77.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 13:05:05 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4160.eurprd08.prod.outlook.com (2603:10a6:803:ea::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 13:05:02 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 13:05:02 +0000
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
X-Inumbo-ID: e7cf94e6-23cd-47fc-9cfb-f57ab671300f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58YeYyN7AD/5ayoMnTKbrRW7IWUcHLWTX2CkyFboBWA=;
 b=7rjsTElRB3efR8Sxs23jVtZW+b/3M3jKX0zMGJASYoLBoOAz0SRdCBERPPcQJRUyKMowuP6xhgYLpVNAB6N38jlDRP35C7fKv3cLfY1z01h7JmtmFJr/ZxfC8v5RUykWMUn3IM6jiUmcHBiLK/+krVAGnI3xj52fO322fd+us7E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec09601209d34ea4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBxNskj1vYH+nH08S+lM4i1juFXfbQZHYpuf5ewEpx3KZDvlxxpt/ZNApuJj1JCLGtX9V8DbCXBC62K9D5xZTWHGYPxnYlxra/An2Al09C7XIukiFJyLZu1y68h58aHKWhlGdkG8QHU9I6LHl1tYIXRtUDZ114oUzJ4fRlshfhyO1HmEHJO/kirYLzESh3DG6kDh4X7SGr/zpeP3Muh1/pMu2UErPyPHv0NcrWEMLPPCYjSOQmzpnS9AeF23p3b6FqRMZGC3GzJKmqS3n5iKAie9yAaULXYQaWQUtSYCVkxxLdV5GRkyRc092cLMznRN/9J579wMUmZyfn+eLjahyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58YeYyN7AD/5ayoMnTKbrRW7IWUcHLWTX2CkyFboBWA=;
 b=TbSqjtM8muANF7KPqb0/Ght7nhf7n/sUzNgTIpJ2NOqZnJNR5ofc8gKuSmeSfNnFku8SWBUcV9s9VxABZZbcenaMrg0DpsEJQjplxps+ar87pshzDvL26Jk74jxpbXzfqcf2E2muX3cJ4hNtkvcvdXEm9NU18dMFF23li4/xS9kXx23mALq1otXLBVOlmqC3b16rPK0WWOjXMA5h2//Et8RTlC0IiS0sQgI8CqUDaRq9OsBfrlUYT3FicA/Velx2X4oeVQhamDkJJg2/RZ+2IxHupvIHLnFDJ+lLRd1EV++RcN0JcLMAnlJwdc/X9lSDXQjnL9hgDBinOPBfVHUzlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58YeYyN7AD/5ayoMnTKbrRW7IWUcHLWTX2CkyFboBWA=;
 b=7rjsTElRB3efR8Sxs23jVtZW+b/3M3jKX0zMGJASYoLBoOAz0SRdCBERPPcQJRUyKMowuP6xhgYLpVNAB6N38jlDRP35C7fKv3cLfY1z01h7JmtmFJr/ZxfC8v5RUykWMUn3IM6jiUmcHBiLK/+krVAGnI3xj52fO322fd+us7E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/3] Use Doxygen and sphinx for html documentation
Thread-Topic: [PATCH 0/3] Use Doxygen and sphinx for html documentation
Thread-Index: AQHXKtDMN2t79z0BVUq4bhKNFfdfZaqnYUoAgACfooCAAOg0AIAAHnqA
Date: Wed, 7 Apr 2021 13:05:02 +0000
Message-ID: <FBE77A52-92EB-4E65-81DA-2E3858A87A73@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <225d7e0a-c5c6-a954-9141-ba1d859f400a@citrix.com>
 <alpine.DEB.2.21.2104061418360.31460@sstabellini-ThinkPad-T480s>
 <51bce878-89a3-d940-f40d-bfde794a0f4f@citrix.com>
In-Reply-To: <51bce878-89a3-d940-f40d-bfde794a0f4f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [212.20.154.75]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f2cc7295-e5f7-4263-0c8e-08d8f9c5ca1f
x-ms-traffictypediagnostic: VI1PR08MB4160:|AM0PR08MB3346:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB334686C843B3E6671B2070FE9D759@AM0PR08MB3346.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NWfK83K0wvaCQjSd3brFZGYkn6YjruIVyTXeih2zAksrnZQ5mNO8O9BJNAgZBWzvSYNNoyZ3wOb3+LWIKT/YaSzBhfYTvvYgyloFitxHy+2b+p4JF0BDzpvZsq4hIIL/Mvvur7IargN8nWw5jJVcYBDGL8LRarqJ0qEJFiEx8LxCDoKfTxD0KJ3nhhW39+TvdXrm7vNdhCUSWppIrw5YNPAaJ/syy/o8V/RB2N9hhqA/xQPsyZiNsxbHy4j8xHCT7m4fNDFlelxZC/Gdhuj5RyOD7wB0zLcYKW+3f+QYI/Od+MmlSwE/xlGfL3tpKx6yGHZbr8SR9/CDvTIsn9oh8fklXV4vWDB2bwQr8+c6c5P+rTeywlE72ypzIYdvjFc4pC2bxN+Hmkd2OXoHPw6zNP1KUZgBvF2npuNDLAK7MxRE+98ZN8CK+cyOUkFq/AT9KAVgb4sU2popSbu2J3alzI9neiUjc/hSaGMA7k5neZAGQQfj6y7eoMEtR9ZFBNkCN0vHMC+1fK/ZLZCTa+ZLA28E04MbBVVHvRKZPwrKk77cK+7r/UXIL9TZEXzJIMuo5jVTlW6KW4Pvozo8zsnpxyEfqWy2Y4BJsfYOCoOJCF56tB8vIuOXwLrDEuzRLaJCS9pWcS9rxxJFyLUzgaAiQngk79YDza+qXjVS/vVNggwWN5W0InKnp+usUF4L0z5Ls4UbJKecJQbx2brhkIIlaZLcwT7twZnnyTouPxVsxVF8lIxKUec/IePH+h1I+nkUUH3mUU9zb9jLUiGjH9UXcw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(86362001)(4326008)(33656002)(316002)(6512007)(8676002)(71200400001)(6486002)(2616005)(186003)(966005)(54906003)(6506007)(8936002)(478600001)(38100700001)(91956017)(5660300002)(2906002)(76116006)(64756008)(53546011)(66556008)(83380400001)(6916009)(66446008)(26005)(66946007)(66476007)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?B8l2NsbWFCKbBr73p1HQN/6iZAGFdQg5Lsdcqnr7iLBSOkBuUkBqRr8tEuj7?=
 =?us-ascii?Q?/sd4pmoXsZTQe8POY91jYjFIIHSCnXEkr6hUgR/xvwn2ryIIJtE1JuDTB18l?=
 =?us-ascii?Q?5G5PvB4KGcYn28HBZIAo9+70uNqk8MjApeEYkPWrtVGBfjs0wLNP70YwBV+r?=
 =?us-ascii?Q?I3c9voFxacD68ER+KYXTPJORHa+6rB2i4bjsSRYwmwvhagDB6wHWhRUvcX5O?=
 =?us-ascii?Q?cSVBDKAx/0IvUjIiel4W8lfPgtv7SORiQbx1IdUGBg7QUuDI8GY46mjkPR7t?=
 =?us-ascii?Q?0DSJa1FzpDY7bpr/3ZQBiRo/Srz5h4KZXxY9hfYKaDDVLeMd/iWoUstu7zPn?=
 =?us-ascii?Q?+L/gZaWxIGOirvjW+IUMVFSDR9EFpioh9cZcDPhp7M+iAnushNIvfYL97MRn?=
 =?us-ascii?Q?1LrBbDnaK5s9smVGwYYqbg/rqBzQWWIN0gJEdN9YW/T/Sfrtjz++dfgNuQ8o?=
 =?us-ascii?Q?GUHhtWLzf5RN7+skTAld9XMqpYohsPFwd9CIaau6zQaRe+LdU4aPH7W1qNlg?=
 =?us-ascii?Q?J6GHR9l6QJuBtcZ6hz0UnmLUHcETb6LqtDaMXMrZXR1ptQjLV7DB+AI2EKCv?=
 =?us-ascii?Q?xUlJW6h4BEwihM6K0vgVaCt1us4RfxwpsDXMdkZldE1fHMPefteH2HniLt1+?=
 =?us-ascii?Q?DUvNAd8U6zfcXyoWYp1MVuPFFiR/SvkV6sdWlTmfIdPLmXJL3P24KbVopQoc?=
 =?us-ascii?Q?6PN0zU++Hx/mrc0heC+BbX8eDfg6R8SEsrCEzpI187FLZtFBZREBlDVhR+D7?=
 =?us-ascii?Q?zT7ILAzTRImUB7kFOQjGlH9VZAIhgVSrSjsa75bg648tmCWIWkh3FwXMJshb?=
 =?us-ascii?Q?ILKiox1Wn72BQDGYX4KOLI7Jkpcr6SmcYT8YEmoog2WEP77RPPWpc9Ps/zb4?=
 =?us-ascii?Q?C4xfD/wkPY2mXrQ3yDdzoDFnWts1gX84OHXyM0jE6pKVewUh48lQ2Ppj6KDJ?=
 =?us-ascii?Q?qaUGY0lBjQleORlzooEcYq/nK7EL7H/KIqN5EWDPG507sQyRuuMzr68pliy9?=
 =?us-ascii?Q?3KVaA9EtUWRviczXn1C8cuTpFbnLmokBO5VhPLLFugxp/z5nCNhadmuLaLxF?=
 =?us-ascii?Q?c9spHxL+0i9QCRbMkxqC2kvBAraIoya3+74OE3lZhdyxDYIwRpJIIjKHsLLx?=
 =?us-ascii?Q?BE1ORdjf7ERzeIQi7mBMtYjeMpXWFVsrLcmxFNxroopqMeFN6BDjoOkSqMTy?=
 =?us-ascii?Q?UK9xCs1Got649tWuQDrXaTTA3mU9DCAGba+zJlGM0+JSdlqVI0/x4B7WiRKO?=
 =?us-ascii?Q?HN9vIvAGRHiFXi8S3eVM/W0rqYjtPOqpm0Kd3+scuoiIn4FfzYsa4ngmV5+e?=
 =?us-ascii?Q?vXShPQH8IbcpsXS40EWbOhUA?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4D07F061EC65604F920B2317706AC0B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4160
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf202b10-2163-45a2-4b99-08d8f9c5c1b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mHDD7nxZgudg0KHB9OpVFk/zt1CWh9U1H9f/ffjb3HR4L7tEbN26kmdtShpxfCKj/XkTL99/SjvcjoMJuMGZZx41al50pl0ltbnKqjqHmuBXDGWarBxtIIxeLrRfKHZ5fYuKwGpA1U1UvVACigjAiMmuVcrJojxNlJ+KfCc0luXHzNmQsZMxdALjSJhNFdMBHJziBCmDuFjIirRLWMicy+wmoSfFEInQ+mEbzAR+0NK1mrU8qO8BSnCdwQqSkSqTE3o+FZdt8Pus/t1wCQDLyyBRak+yWM4HU0t15W9DmsBAp65muP5oZSZOkMm+VoaPTf500fA+NSnnImBScFTB6rpZc7X5KblLFN97atdtfq+jhXEyx42r2ou6izXbdbKuToaGK/m/Nmr109Hl4G/Ep4x8Bqf+uz8guv/YI4CN1bA6thiszTbKlRJMMCbVBHL4PUjEPXHDWUkGiwIKLg82vfiwNEBfXFLmRik3amIP5s59DCtLU+mo1+eEKuBAiuMbf4It0z+6ge1FjyXTVjXd7OWugwUBdMIftlWECU0Pn6GmmSaXFZb4FPHQxwmbOrdmr21YIjOMFRuT17a+wkYvWUyRSmvj/e50kWzTvb64frpvThJg7VnYWmruyR1YbkUIJT3eXK4C7QUlZp7Dmw+OrCHr2vOuxHNp4fzibuAuGProCXk9RaEY/V0IKslEdOxSeKdmma2Ma2UjSrkB+11q4I7Zt6e3HzSWt01UQiyN7Sg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(36756003)(186003)(2906002)(6486002)(2616005)(33656002)(5660300002)(316002)(478600001)(26005)(83380400001)(4326008)(36860700001)(82310400003)(336012)(966005)(70206006)(6512007)(82740400003)(356005)(86362001)(8936002)(6506007)(53546011)(81166007)(47076005)(8676002)(6862004)(54906003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 13:05:16.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cc7295-e5f7-4263-0c8e-08d8f9c5ca1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3346

Hi Andrew,

> On 7 Apr 2021, at 12:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 06/04/2021 22:24, Stefano Stabellini wrote:
>> On Tue, 6 Apr 2021, Andrew Cooper wrote:
>>> On 06/04/2021 11:36, Luca Fancellu wrote:
>>>> This serie introduce doxygen in the sphinx html docs generation.
>>>> One benefit is to keep most of the documentation in the source
>>>> files of xen so that it's more maintainable, on the other hand
>>>> there are some limitation of doxygen that must be addressed
>>>> modifying the current codebase (for example doxygen can't parse
>>>> anonymous structure/union).
>>>>=20
>>>> To reproduce the documentation xen must be compiled because
>>>> most of the headers are generated on compilation time from
>>>> the makefiles.
>>>>=20
>>>> Here follows the steps to generate the sphinx html docs, some
>>>> package may be required on your machine, everything is suggested
>>>> by the autoconf script.
>>>> Here I'm building the arm64 docs (the only introduced for now by
>>>> this serie):
>>>>=20
>>>> ./configure
>>>> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-g=
nu-" menuconfig
>>>> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-g=
nu-"
>>>> make -C docs XEN_TARGET_ARCH=3D"arm64" sphinx-html
>>>>=20
>>>> now in docs/sphinx/html/ we have the generated docs starting
>>>> from the index.html page.
>>> Do you have a sample rendered output?
>>>=20
>>> The plan was to try and use Linux's kernel-doc plugin for Sphinx, which
>>> is very doxygen-like.  Did you experiment with this option?
>> As you probably know the end goal for Luca (and the Xen FuSa SIG as a
>> whole) is to generate all FuSa documents, including requirements docs,
>> interface docs, etc.
>>=20
>> FuSa requires us to follow the famous V model, where the high level
>> requirements are linked to the lower level requirements, which are
>> linked to the interface docs, which are linked all the way down to the
>> code.
>>=20
>> Maintaining the linking is difficult and typically done with expensive
>> proprietary FuSa tools.
>>=20
>> Fortunately, an engineer working with the Zephyr project developed a set
>> of scripts for Doxygen that are able to generate the required FuSa docs
>> and also links from in-code comments and markdown/rst docs in the tree.
>>=20
>> This is great work, and in the FuSa SIG we thought it would be best to
>> align ourselves with Zephyr to be able to pull our efforts together on
>> the tooling side instead of doing the same thing again on our own.
>>=20
>> This is the reason why we ended up with Doxygen.
>=20
> So are we're saying that Doxygen is a hard dependency because there is
> an extension for Doxygen to generate other safety docs?

hard no as we could find other solution but the current strategy we take to=
gether
with Zephyr project is based on using Doxygen for requirement linking.

Also an other argument is that the documentation generated is actually nice=
 and
that could also be useful for developers and users (see [1] for Zephyr doc)=
.

Our global idea is also that using doxygen we can extract a big part of the
documentation (which will partly be used as certification) directly from th=
e
code which will make it a lot easier for developers to maintain.

Regards
Bertrand


[1] https://docs.zephyrproject.org/latest/


>=20
> ~Andrew
>=20


