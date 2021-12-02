Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A91546619A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 11:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236463.410190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjVX-0001i0-CX; Thu, 02 Dec 2021 10:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236463.410190; Thu, 02 Dec 2021 10:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjVX-0001eX-8G; Thu, 02 Dec 2021 10:40:07 +0000
Received: by outflank-mailman (input) for mailman id 236463;
 Thu, 02 Dec 2021 10:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cBvN=QT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1msjVV-0001bX-TT
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 10:40:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35437018-535c-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 11:40:04 +0100 (CET)
Received: from FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15) by
 VI1PR08MB3888.eurprd08.prod.outlook.com (2603:10a6:803:b8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23; Thu, 2 Dec 2021 10:39:55 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:0:cafe::70) by FRYP281CA0005.outlook.office365.com
 (2603:10a6:d10::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9 via Frontend
 Transport; Thu, 2 Dec 2021 10:39:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 10:39:54 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Thu, 02 Dec 2021 10:39:54 +0000
Received: from 90981674843d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 573632C0-527C-40F0-93D1-188FC0DFB732.1; 
 Thu, 02 Dec 2021 10:39:47 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90981674843d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Dec 2021 10:39:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6549.eurprd08.prod.outlook.com (2603:10a6:20b:33d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 2 Dec
 2021 10:39:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4734.028; Thu, 2 Dec 2021
 10:39:44 +0000
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
X-Inumbo-ID: 35437018-535c-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsUQIDAe0CbTwEUnhPlTtYPfkoUGm12GPg7RZaThfCg=;
 b=NwsZsGS6eHdPiEQXqVy3ksQYv28SWeHGQ1lQluqal8I0i9b+/nbjPwkeRtnrPzU4z0jQw7YGrCI5qmWRQVeWb0Sd4mR7n3UBsmuP7iNbJhhLA1Yk0xF3yTBBbaFBJysH3xvh1sB3htZJdNPGk9lFo2IG6wwACQKb3XWpJEp59wU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce4a97108863e540
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOkP0kxpD2cztXh9QtPZiyVdGG/lflVG6CS1JUNbsyTcEhRvphydbyjcMywc3tmrHHLig99pUO56i8iCRp9tw/Rex5viIOoYNOivHFCtjt73KMcfTGucXEBOKIcf52exe2XFqAYvMO5aYRHjczaarHV0WCLjXnuPEx7T/f+J4pCkWLnovebR3UBF+I2IVWy6ZXR6S7FhETg0YKFYr1TNvw1qzI9SBUtoevR+g/QM+x6eZ8sDNKMhllNk2ecr5yOHvs5eSNKUfWjXqbswd1mizeHszh1rp1YRmpsnuBp8N5vpLXZgeMVZM28EMo8PHGFirj77ZAYImOAEe2azl2aTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsUQIDAe0CbTwEUnhPlTtYPfkoUGm12GPg7RZaThfCg=;
 b=D6RP3TkQ7rEb1xI5vpW0bTb6Kl1w3sc24C7iMdofcUTtFWszCIMZaFcxCAb1FpzjIKpaR6io2ZiQQ0IVyAEJv/bTKZLafK1Okq6V5NR+rNmTzLzCZCaAn3WLWQ3m8iTCrzoKcj/RwvJkJMzPzVXr3Q8p7g4J8AXTrJJDVD5u2gHRAtvPSgl8sYfFptIIFFRqKBXibpjN3zdTSaRGPrZuN1ohLkDUe9Zz6qHP2TuLEHX3J0nbNPorJEng3Lo7B80WhlENSYaJRXSYVle4yfRPX+ipRL5t3o8P6KMizz/LGusWlp1vuIM8Q7afyHpclrUPHucHB/Bhd7En1jw42guH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsUQIDAe0CbTwEUnhPlTtYPfkoUGm12GPg7RZaThfCg=;
 b=NwsZsGS6eHdPiEQXqVy3ksQYv28SWeHGQ1lQluqal8I0i9b+/nbjPwkeRtnrPzU4z0jQw7YGrCI5qmWRQVeWb0Sd4mR7n3UBsmuP7iNbJhhLA1Yk0xF3yTBBbaFBJysH3xvh1sB3htZJdNPGk9lFo2IG6wwACQKb3XWpJEp59wU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 0/2] xsm: Further fixes
Thread-Topic: [PATCH 0/2] xsm: Further fixes
Thread-Index: AQHX5qTgcr9QGJZxvkaRDr/n3UQDXKwfBIwA
Date: Thu, 2 Dec 2021 10:39:44 +0000
Message-ID: <5B401EB8-A0D7-42A0-83D3-B60998795D81@arm.com>
References: <20211201111555.16408-1-andrew.cooper3@citrix.com>
In-Reply-To: <20211201111555.16408-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 751b211a-75d2-40dc-f10e-08d9b5801418
x-ms-traffictypediagnostic: AS8PR08MB6549:|VI1PR08MB3888:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3888190B50992F945B36893E9D699@VI1PR08MB3888.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ENQAM9IObRcu60xtoXBwHlpDVUGULaSmEw+eX5/i0ls+VztdM3YZvQ9Yhd2/KQsF+0qA38oTebbg4S5jnE1dkWpmsIAVZ8R6QypALoXKUHzEMmiDhzKyW0yM9YaB2BW2XI/KnCs6jzqcVdkct3LyIXB5xUB6HiMt34d5Czy6uLKd3LiB3qFSvGOb1kyX7WJzK4zQ2umgSsDELtrZ3fjt2COkPMwDKsf8WfhgekCsqil/jJNxYyeTHsMO7UtQLqBRLiALU/lcIYwtOEO+zSOVJU0/GWp4sE//V/GG5HGyZO46IxUoHVDzCi/VDwzuywBiHo3itCBrkNMa8AqtW/dAOER/THf5fePZCXXcS1FPQ5Cdzz46PPJJxOTuBKVArSKnnwZmB/NkRpjALL3QZHB+WVkeRqEvtAuM/mHSCwATBRHHFLaugk83/mojpJLFtTmjTVB5A2JE3WD0vHPQqiqiZxrQd5fzeLyjt4CyaWS4n+BbOYX6OAKn752X8JYnHcv4vFgWquJ3hVYOapEC7WYmeoGH+k79uqjlhIrxa7D0oq+DnJ7Lfuw/voT9GsJCaXTLUAhYm1jNNxjKV2cluBgYpH9yuFYl6SA8ty/onWc83TfP893DwBdVj3z5gBrnA+4F4N3ng7f1oDrKznAfaEABHGeIG+uxoezTUPxoBf1KVQ9AxKTaEhregqB4b4csLkkqLxpt8EctSoih7y6zCP4MJI9aojJGJ3bHsE/qCfD9lghyOFUeOPwS0vZLnD7QQMuS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(558084003)(66446008)(6506007)(508600001)(91956017)(8936002)(6486002)(36756003)(33656002)(66556008)(6916009)(26005)(2616005)(71200400001)(8676002)(38070700005)(76116006)(38100700002)(86362001)(5660300002)(66476007)(4326008)(186003)(66946007)(53546011)(316002)(122000001)(2906002)(54906003)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <867939B1ED86914794BDB881C201D56A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6549
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aae64653-3e2a-4c44-5662-08d9b5800e44
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zKDvXfoe0RhwQo7MkmXyJ4/sd4oD7Pm1wjL9+ZpmFrxXP0eChpX6vuLD6QIbj4HnvAU6HEzjK2cPt7HCIjO0qwGgc9lSyvZYUNrhpgsVxU4Ub6UuwixrDC3GDw1TuHBtDI2fpGw/YHwDIHlZOF3DFRJwb28tz9+bushJR+bOhU7xsWEYWycphDbFWoSPNdeaK7Nk12eqQLIHi2Oz6t10I+A7xzKLHpD2MrJ1Vspj0UoZJnrF2sw801ewD1Cd1ME4C5g1VR7qxDF+weZCkRXZYUSlQiQvWo3mvY1OXpEu5ClnN7nthmYvqS85rwnxg5R2asgx6TqPwhTz5ubonwgTZCalaRsdYcmaowosQw6I2t/bx/tpvcYHTxfc13gjaIVSWuXBOATeIbT/0dOMZ61DJU6YSchUTJ7hmmqvZxYc/jE1T9rxHbDQPUolrinfCCP+w1VAI/5NKJtBdGZx9X3/q9x5XuBuKCnnZjEvMdoSWrLnBzoKE+6H/x2NQTsLysq1FfuS6VAtnQQU87fD2nj5lzkWKK/gbdRNAH05RpYCFwVO4p41ZE7pE9YhpTqk07VSDZS/pdjT/SBXufKKoX+sMpfruT+sAuO320LjSw9SMZY8lOsLYfvgqneSjrRN6KMXKpwlz9qSfE9EOp1Qd9siOHEYu6nzkLoAf5LlIFBPadqWIDpdqImWDyEoJ05cWfJr/Ar4U+XFHKiLEPLAOFVQRQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(558084003)(186003)(6862004)(36756003)(81166007)(5660300002)(86362001)(47076005)(8936002)(36860700001)(316002)(356005)(53546011)(8676002)(508600001)(2616005)(6486002)(2906002)(336012)(82310400004)(4326008)(107886003)(70206006)(70586007)(26005)(6506007)(6512007)(33656002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 10:39:54.6162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 751b211a-75d2-40dc-f10e-08d9b5801418
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3888



> On 1 Dec 2021, at 11:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> Andrew Cooper (2):
>  xsm: Switch xsm_ops to __alt_call_maybe_initdata
>  xsm: Drop extern of non-existent variable

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>


