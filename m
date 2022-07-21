Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBCB57C671
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 10:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372567.604365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERfb-0002qF-Kr; Thu, 21 Jul 2022 08:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372567.604365; Thu, 21 Jul 2022 08:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERfb-0002ng-Fl; Thu, 21 Jul 2022 08:36:31 +0000
Received: by outflank-mailman (input) for mailman id 372567;
 Thu, 21 Jul 2022 08:36:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTDz=X2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oERfZ-0002nM-Ia
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 08:36:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10055.outbound.protection.outlook.com [40.107.1.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36efe8de-08d0-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 10:36:28 +0200 (CEST)
Received: from DB6PR0301CA0045.eurprd03.prod.outlook.com (2603:10a6:4:54::13)
 by DB8PR08MB4060.eurprd08.prod.outlook.com (2603:10a6:10:a7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Thu, 21 Jul
 2022 08:36:25 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::8d) by DB6PR0301CA0045.outlook.office365.com
 (2603:10a6:4:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 21 Jul 2022 08:36:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 08:36:25 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Thu, 21 Jul 2022 08:36:25 +0000
Received: from 4b17e88d047a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21BDEF32-61E4-4760-A764-89CD66845E73.1; 
 Thu, 21 Jul 2022 08:36:19 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b17e88d047a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 08:36:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4673.eurprd08.prod.outlook.com (2603:10a6:20b:c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Thu, 21 Jul
 2022 08:36:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 08:36:10 +0000
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
X-Inumbo-ID: 36efe8de-08d0-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Sn2jFNUogXpPLaeNHTr1z8mODOk7KeGz0y5x8t/bZ3gabGFvXjQYu8sSVVZHyRLKJcsEbFWsJP1hKVFpFzjmY/mM+2Rqyhgnw1kJtMeuOMbQJTJWiXEMmtCWN7bfPI3ncTXt0NiiljGyPZnZK8x+BproW6WJB7aLrOIILNT1TRhYDEuvh6K/XzTyfokbIGuyUjW9DsIq5G8jet8pGh6I/JziF3g2mdx6ae49YmEjFHVeb10Us/VHDQ7gR5bzyUCbZUJkBuYMX9q9Dgbn5HZC5tLo/oMBmiPCsGrqr14lnr/YOj+Ud8e7FcTcWtsJZKPszmH1RgIrypheD0HN5xxCxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuZ4M4gHTq91mRmAjaPbTMmhEJh5TIjlu09hJWHueSA=;
 b=WyKHJpELvJ1Z1q9bifoMu+X4F9yXFXInCU5hkDEx9zMBV8yQa6IKwxvtx8hQKK34ZpkYk5cArGjYrebL8F5e/952pWyoBIrzB+26ChfzTODS1WWYcVYbmUUdiSOGdpmMT+kRU4VT8IQ2lfAp2VsNRokpd6+MsdPxoseWOWEPpJuhNF45bxvRl64nbP5PEdaDoiAVCX5GLukkc/36zN5lAHt6gJjnQ8yWjLSiz+MSxeShXhsYyRLSFJ/HAk0+/Zfa3u3OqiKdp/WVOUV4zbaKajiK1gFfEk1AV5+iKKxzT12p22jF+qO1SROcqGNB9nNXskSz+BZrKsLIpWfPrFtkfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuZ4M4gHTq91mRmAjaPbTMmhEJh5TIjlu09hJWHueSA=;
 b=2ikyBGejsbudp9aDwt14WImZidf34snYu63aI5vRl83CdH2tteTCNi0jbwyXsgsU00wulq9JHbIKXzljEEsD1E/W3qGuJcN9Hl0zQ6Lo9djk5wgBtVsz0uP7aE4EyJMVQ0hdSB7vzyIqcN1wQPm7i1qeHJHSAEHVUxcctim3lDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88c166eef50a2c5b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0CPn37bhR6uVKromApbS4n90VEcc4r8ubdGsrU95SvLfLtC2D3PcjRTW5+u7VxYUTsnpYa/iTFK8x4AbiSeAY5Tzm0ZUn+PY+yqcNV5gwe1ojqASUKaZITSmwXTYN+3AZ4OdkLUrpJa9b7CS9s5kl5FfRhx2ZeoKoKcWdKk7ny4xg/WLrOmh7zRO2wpy3nSmRS+Zx/4BSLJMvCh5g1tEElZ6LNX40KUjmTqxCDJ2yKfBZfFCxnUlYBNVxsHCWUW8BOKq0EQuqCe8M+V/eCTeyyVOxolQXdZxWFzuSoa3S/L8pV8b8rTb++hfP419GVyXBhwGMi4T4GlhyNSnA9T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuZ4M4gHTq91mRmAjaPbTMmhEJh5TIjlu09hJWHueSA=;
 b=IdLujCt1qO87yvH125j1vNAbc9KyzSJqBvSdM+szGb55WJpYB4XdB44+90k9e3Uhv7BP9B73JU88tYhRf2D1dVcEVaGKPzQHT6YP6C6028u5nIzGDtY9VA2NY/dXIAKgWFdIiepZ8SgwRhU8aF946Enqkvi2HF4FOCyb2QzjO3QjwGHRXGEOwRoAyb3n7dNPif1dpYSbjYTWUgWV+PNvCQYBflDs05aO+IMBpBscE7zL/R2NPJPj1ML693ruBpBwfignCXmHfRWxMw4JbguVcKZvOICFvf83doX1oIs5Ejb+qt9WTqSfNPCycMWCty1TMgd4v7NHv4vQOiQtfNGPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuZ4M4gHTq91mRmAjaPbTMmhEJh5TIjlu09hJWHueSA=;
 b=2ikyBGejsbudp9aDwt14WImZidf34snYu63aI5vRl83CdH2tteTCNi0jbwyXsgsU00wulq9JHbIKXzljEEsD1E/W3qGuJcN9Hl0zQ6Lo9djk5wgBtVsz0uP7aE4EyJMVQ0hdSB7vzyIqcN1wQPm7i1qeHJHSAEHVUxcctim3lDs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/5] xen/arm32: mm: Consolidate the domheap mappings
 initialization
Thread-Topic: [PATCH v2 2/5] xen/arm32: mm: Consolidate the domheap mappings
 initialization
Thread-Index: AQHYnGjbgtq6TqhSCkikJaFgpVJiDq2IgQiA
Date: Thu, 21 Jul 2022 08:36:09 +0000
Message-ID: <C678B0DB-B2B7-4BBA-BA19-59CB00C5FA84@arm.com>
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-3-julien@xen.org>
In-Reply-To: <20220720184459.51582-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 413555a3-bdad-4c2a-9f54-08da6af41971
x-ms-traffictypediagnostic:
	AM6PR08MB4673:EE_|DBAEUR03FT014:EE_|DB8PR08MB4060:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LkJtZFOzV1EUE15TJ6Kq2+rqRa04jVCKnu+XbPzikThodJVasTEltmhRzlgDufSxesrxRDpwmS0vniSyVH0QbUqG5p7wMyG89nTQQpzSzXh6rNVla0aNdyz+BOxAuUEUZiWmEW8Q8tB+OP2EakI4WXnA1jrOyDJrhH+B8RVEpqaMvjK3Heu70S+XuJaZx1pEKTLdGTTZ8y7lZ6bpIX3cRfwKcNZi0TzKNkmwt0Cc1+jVTJgSI39UEKbd7vYZOXG7akercPAwb/bzyiv3dsHnqL3nM2rgyXiitE1r4qGhOMLp4NyoyZalGKhAgTB2fZ2L85AQKOA1yyUwmlq15rPR0nJloox2WEzgLh6qheQ8gyycKkEgNQaSpJTobdV1jYQKET6boOiWZWadDcs/CjoFxErNyC48iVqAip/jsAqzudDzf3rB4pmu/dXw0pV4FEOwSFfNWtE5d2qlQyxSnv7Q7OoPn475lBgA6USvXPRDeOH+wLCcG62/jnVqYpOlzR0PKxy8WZUzq9P+MP0esfU99+tbufqztERWFb+s4ainLvG5BuiAjnNc9SQ62/5NZwrwTButRMmUsGqns+S/IE0Q+pjg0IKbSqKJw6u+WHN4eVuFMjXL1QnsRlxRHS56Of4LGMm3j+OdCBevan0frfWoXjjuCY5shFarl35MGgZ53rYEQ42g+Sd40L2IKTkC5/EQE7Nt41sJG55Y2wK1XeqfTbq+Cu9JypDiMgNwNa6/MdvIN1Ns3YEo0+KPRJLqGlwdkIVEj1h0Ufs2B6gXG/xmbnnLghNSHm3KyqBJHVlQuq9t0+7ztU3jKf/JXH/L3ecv73wQpJo01qlp6foToH1KeA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(66556008)(186003)(66476007)(8676002)(83380400001)(4326008)(54906003)(71200400001)(6486002)(66946007)(66446008)(6916009)(76116006)(64756008)(91956017)(2616005)(6506007)(53546011)(2906002)(6512007)(26005)(33656002)(36756003)(86362001)(38070700005)(5660300002)(41300700001)(316002)(38100700002)(478600001)(122000001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <638717F2C245764EA6F61EA55B98034D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4673
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	775b8254-0af0-4efe-d180-08da6af40fda
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4mbYCKHtECwotpExqdQnn0LdkLqTJTv8+7v3ylXsOrNnvqW9umL1GK0lfDcmd0Zr0gkbshqDImaRVFYRQXAycjDbVw8aUoJFW4k01fKS5+/vMj0SGMqEf/h1tZVcXJkoqzivk2UBYt3DdVl+00LfEpye4z+yMuIUjB3GuLPYYxjhUMd0b/aDTmtc+PoqC8KZEeJLmLwb9Kcgkrj6MRYWOX6PkRFflNH7ee3TxQSQM4JlH8xxQzIdXk0LZ3oWtYaVo9aGPWAznH97iX6JiMvYez0FowWRL7K1OE+UHojEtHYKXcA7YXb+tPGYb21UXfT79DDULjbUmM6NyacprE+w79Cb7RmPrOebJtk4nLc+LpGaQBpDKFXrwXzjDW4cFP8ljf9WoYSXvmkEYhgA9zBDZQwc+AKnf4+zvi7kMWHgdYg6C98XXvjNQW8QedKXrBcY79lCJe+iKyuaxgQdvbffyFJqA7hikZpYYl9YcH+1YZKv43APyQanZdctph6/++28kkR5sJO6KzMvLXcTlRnd6rCA363ANeNCxixrZUrqAbB1+LTfxd/0Wvgawih7NvfWBRUe9TAHoNBUkPBxtq/i6mZv/V1Qox6zvlnWqgvyr6NftqIelryhbk4iVwFbyPcrNhdpTsZonayAVylJRHMh9ecDkYMAGaf0BghiYduSFnSKenwCqnFp188X1MB8kxirJSBK4iVY/W8bfPW8WkHypp/4s1+EgIXC562XEg7e0T/YIf5+rLMIzy8uluEUPTIU3QUvWLhmLqhuIVTecanZAzUkkcMF6LZjATQebtMg/1Ar49TEbLm1WeHdk9HRGvPF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(40470700004)(36840700001)(46966006)(6512007)(186003)(83380400001)(86362001)(53546011)(26005)(41300700001)(47076005)(316002)(6486002)(107886003)(478600001)(2616005)(6506007)(81166007)(356005)(36860700001)(336012)(8676002)(36756003)(2906002)(82310400005)(4326008)(40480700001)(6862004)(82740400003)(54906003)(40460700003)(70586007)(70206006)(33656002)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 08:36:25.7631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 413555a3-bdad-4c2a-9f54-08da6af41971
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4060

SGkgSnVsaWVuLA0KDQo+IE9uIDIwIEp1bCAyMDIyLCBhdCAxOTo0NCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPg0KPiANCj4gQXQgdGhlIG1vbWVudCwgdGhlIGRvbWhlYXAgbWFwcGluZ3MgaW5p
dGlhbGl6YXRpb24gaXMgZG9uZSBzZXBhcmF0ZWx5IGZvcg0KPiB0aGUgYm9vdCBDUFUgYW5kIHNl
Y29uZGFyeSBDUFVzLiBUaGUgbWFpbiBkaWZmZXJlbmNlIGlzIGZvciB0aGUgZm9ybWVyDQo+IHRo
ZSBwYWdlcyBhcmUgcGFydCBvZiBYZW4gYmluYXJ5IHdoaWxzdCBmb3IgdGhlIGxhdHRlciB0aGV5
IGFyZQ0KPiBkeW5hbWljYWxseSBhbGxvY2F0ZWQuDQo+IA0KPiBJdCB3b3VsZCBiZSBnb29kIHRv
IGhhdmUgYSBzaW5nbGUgaGVscGVyIHNvIGl0IGlzIGVhc2llciB0byByZXdvcmsNCj4gb24gdGhl
IGRvbWhlYXAgaXMgaW5pdGlhbGl6ZWQuDQo+IA0KPiBGb3IgQ1BVMCwgd2Ugc3RpbGwgbmVlZCB0
byB1c2UgcHJlLWFsbG9jYXRlZCBwYWdlcyBiZWNhdXNlIHRoZQ0KPiBhbGxvY2F0b3JzIG1heSB1
c2UgZG9tYWluX21hcF9wYWdlKCksIHNvIHdlIG5lZWQgdG8gaGF2ZSB0aGUgZG9taGVhcA0KPiBh
cmVhIHJlYWR5IGZpcnN0LiBCdXQgd2UgY2FuIHN0aWxsIGRlbGF5IHRoZSBpbml0aWFsaXphdGlv
biB0byBzZXR1cF9tbSgpLg0KPiANCj4gSW50cm9kdWNlIGEgbmV3IGhlbHBlciBpbml0X2RvbWhl
YXBfbWFwcGluZ3MoKSB0aGF0IHdpbGwgYmUgY2FsbGVkDQo+IGZyb20gc2V0dXBfbW0oKSBmb3Ig
dGhlIGJvb3QgQ1BVIGFuZCBmcm9tIGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoKQ0KPiBmb3Ig
c2Vjb25kYXJ5IENQVXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFs
bEBhbWF6b24uY29tPg0KDQpXaXRoIGEgc21hbGwgdHlwbyBtZW50aW9uZWQgYWZ0ZXIgd2hpY2gg
Y2FuIGJlIGZpeGVkIG9uIGNvbW1pdDoNCg0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMg
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCg0KPiANCj4gLS0tLQ0KPiAgICBDaGFuZ2VzIGlu
IHYyOg0KPiAgICAgICAgLSBGaXggZnVuY3Rpb24gbmFtZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UN
Cj4gICAgICAgIC0gUmVtb3ZlIGR1cGxpY2F0ZWQgJ2JlZW4nIGluIHRoZSBjb21tZW50DQo+IC0t
LQ0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtMzIvbW0uaCB8ICAyICsNCj4geGVuL2Fy
Y2gvYXJtL21tLmMgICAgICAgICAgICAgICAgICAgfCA5MiArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLQ0KPiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICB8ICA4ICsrKw0K
PiAzIGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9tbS5oIGIveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTMyL21tLmgNCj4gaW5kZXggNmIwMzlkOWNlYWEyLi41
NzUzNzNhZWI5ODUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0z
Mi9tbS5oDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9tbS5oDQo+IEBA
IC0xMCw2ICsxMCw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX21mbnNfaW5fZGlyZWN0bWFw
KHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIG5yKQ0KPiAgICAgcmV0dXJuIGZhbHNl
Ow0KPiB9DQo+IA0KPiArYm9vbCBpbml0X2RvbWhlYXBfbWFwcGluZ3ModW5zaWduZWQgaW50IGNw
dSk7DQo+ICsNCj4gI2VuZGlmIC8qIF9fQVJNX0FSTTMyX01NX0hfXyAqLw0KPiANCj4gLyoNCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMNCj4gaW5k
ZXggMDE3N2JjNmIzNGQyLi45MzExZjM1MzAwNjYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9tbS5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+IEBAIC0zNzIsNiArMzcyLDU4IEBA
IHZvaWQgY2xlYXJfZml4bWFwKHVuc2lnbmVkIGludCBtYXApDQo+IH0NCj4gDQo+ICNpZmRlZiBD
T05GSUdfRE9NQUlOX1BBR0UNCj4gKy8qDQo+ICsgKiBQcmVwYXJlIHRoZSBhcmVhIHRoYXQgd2ls
bCBiZSB1c2VkIHRvIG1hcCBkb21oZWFwIHBhZ2VzLiBUaGV5IGFyZQ0KPiArICogbWFwcGVkIGlu
IDJNQiBjaHVua3MsIHNvIHdlIG5lZWQgdG8gYWxsb2NhdGUgdGhlIHBhZ2UtdGFibGVzIHVwIHRv
DQo+ICsgKiB0aGUgMm5kIGxldmVsLg0KPiArICoNCj4gKyAqIFRoZSBjYWxsZXIgc2hvdWxkIG1h
a2Ugc3VyZSB0aGUgcm9vdCBwYWdlLXRhYmxlIGZvciBAY3B1IGhhcyBiZWVuDQo+ICsgKiBhbGxv
Y2F0ZWQuDQo+ICsgKi8NCj4gK2Jvb2wgaW5pdF9kb21oZWFwX21hcHBpbmdzKHVuc2lnbmVkIGlu
dCBjcHUpDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgaW50IG9yZGVyID0gZ2V0X29yZGVyX2Zyb21f
cGFnZXMoRE9NSEVBUF9TRUNPTkRfUEFHRVMpOw0KPiArICAgIGxwYWVfdCAqcm9vdCA9IHBlcl9j
cHUoeGVuX3BndGFibGUsIGNwdSk7DQo+ICsgICAgdW5zaWduZWQgaW50IGksIGZpcnN0X2lkeDsN
Cj4gKyAgICBscGFlX3QgKmRvbWhlYXA7DQo+ICsgICAgbWZuX3QgbWZuOw0KPiArDQo+ICsgICAg
QVNTRVJUKHJvb3QpOw0KPiArICAgIEFTU0VSVCghcGVyX2NwdSh4ZW5fZG9tbWFwLCBjcHUpKTsN
Cj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogVGhlIGRvbWhlYXAgZm9yIGNwdTAgaXMgYmVmb3Jl
IHRoZSBoZWFwIGlzIGluaXRpYWxpemVkLiBTbyB3ZQ0KDQpUaGVyZSBpcyBhIOKAnGluaXRpYWxp
emVk4oCdIG1pc3NpbmcuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiArICAgICAqIG5lZWQgdG8g
dXNlIHByZS1hbGxvY2F0ZWQgcGFnZXMuDQo+ICsgICAgICovDQo+ICsgICAgaWYgKCAhY3B1ICkN
Cj4gKyAgICAgICAgZG9taGVhcCA9IGNwdTBfZG9tbWFwOw0KPiArICAgIGVsc2UNCj4gKyAgICAg
ICAgZG9taGVhcCA9IGFsbG9jX3hlbmhlYXBfcGFnZXMob3JkZXIsIDApOw0KPiArDQo+ICsgICAg
aWYgKCAhZG9taGVhcCApDQo+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4gKw0KPiArICAgIC8q
IEVuc3VyZSB0aGUgZG9taGVhcCBoYXMgbm8gc3RyYXkgbWFwcGluZ3MgKi8NCj4gKyAgICBtZW1z
ZXQoZG9taGVhcCwgMCwgRE9NSEVBUF9TRUNPTkRfUEFHRVMgKiBQQUdFX1NJWkUpOw0KPiArDQo+
ICsgICAgLyoNCj4gKyAgICAgKiBVcGRhdGUgdGhlIGZpcnN0IGxldmVsIG1hcHBpbmcgdG8gcmVm
ZXJlbmNlIHRoZSBsb2NhbCBDUFVzDQo+ICsgICAgICogZG9taGVhcCBtYXBwaW5nIHBhZ2VzLg0K
PiArICAgICAqLw0KPiArICAgIG1mbiA9IHZpcnRfdG9fbWZuKGRvbWhlYXApOw0KPiArICAgIGZp
cnN0X2lkeCA9IGZpcnN0X3RhYmxlX29mZnNldChET01IRUFQX1ZJUlRfU1RBUlQpOw0KPiArICAg
IGZvciAoIGkgPSAwOyBpIDwgRE9NSEVBUF9TRUNPTkRfUEFHRVM7IGkrKyApDQo+ICsgICAgew0K
PiArICAgICAgICBscGFlX3QgcHRlID0gbWZuX3RvX3hlbl9lbnRyeShtZm5fYWRkKG1mbiwgaSks
IE1UX05PUk1BTCk7DQo+ICsgICAgICAgIHB0ZS5wdC50YWJsZSA9IDE7DQo+ICsgICAgICAgIHdy
aXRlX3B0ZSgmcm9vdFtmaXJzdF9pZHggKyBpXSwgcHRlKTsNCj4gKyAgICB9DQo+ICsNCj4gKyAg
ICBwZXJfY3B1KHhlbl9kb21tYXAsIGNwdSkgPSBkb21oZWFwOw0KPiArDQo+ICsgICAgcmV0dXJu
IHRydWU7DQo+ICt9DQo+ICsNCj4gdm9pZCAqbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChtZm5fdCBt
Zm4pDQo+IHsNCj4gICAgIHJldHVybiB2bWFwKCZtZm4sIDEpOw0KPiBAQCAtNjMzLDE2ICs2ODUs
NiBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlz
X29mZnNldCkNCj4gICAgICAgICBwW2ldLnB0LnhuID0gMDsNCj4gICAgIH0NCj4gDQo+IC0jaWZk
ZWYgQ09ORklHX0FSTV8zMg0KPiAtICAgIGZvciAoIGkgPSAwOyBpIDwgRE9NSEVBUF9TRUNPTkRf
UEFHRVM7IGkrKyApDQo+IC0gICAgew0KPiAtICAgICAgICBwW2ZpcnN0X3RhYmxlX29mZnNldChE
T01IRUFQX1ZJUlRfU1RBUlQraSpGSVJTVF9TSVpFKV0NCj4gLSAgICAgICAgICAgID0gcHRlX29m
X3hlbmFkZHIoKHVpbnRwdHJfdCkoY3B1MF9kb21tYXAgKw0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpICogWEVOX1BUX0xQQUVfRU5UUklFUykpOw0KPiAtICAg
ICAgICBwW2ZpcnN0X3RhYmxlX29mZnNldChET01IRUFQX1ZJUlRfU1RBUlQraSpGSVJTVF9TSVpF
KV0ucHQudGFibGUgPSAxOw0KPiAtICAgIH0NCj4gLSNlbmRpZg0KPiAtDQo+ICAgICAvKiBCcmVh
ayB1cCB0aGUgWGVuIG1hcHBpbmcgaW50byA0ayBwYWdlcyBhbmQgcHJvdGVjdCB0aGVtIHNlcGFy
YXRlbHkuICovDQo+ICAgICBmb3IgKCBpID0gMDsgaSA8IFhFTl9QVF9MUEFFX0VOVFJJRVM7IGkr
KyApDQo+ICAgICB7DQo+IEBAIC02ODYsNyArNzI4LDYgQEAgdm9pZCBfX2luaXQgc2V0dXBfcGFn
ZXRhYmxlcyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQpDQo+IA0KPiAjaWZkZWYgQ09O
RklHX0FSTV8zMg0KPiAgICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkgPSBjcHUwX3BndGFibGU7
DQo+IC0gICAgcGVyX2NwdSh4ZW5fZG9tbWFwLCAwKSA9IGNwdTBfZG9tbWFwOw0KPiAjZW5kaWYN
Cj4gfQ0KPiANCj4gQEAgLTcxOSwzOSArNzYwLDI4IEBAIGludCBpbml0X3NlY29uZGFyeV9wYWdl
dGFibGVzKGludCBjcHUpDQo+ICNlbHNlDQo+IGludCBpbml0X3NlY29uZGFyeV9wYWdldGFibGVz
KGludCBjcHUpDQo+IHsNCj4gLSAgICBscGFlX3QgKmZpcnN0LCAqZG9taGVhcCwgcHRlOw0KPiAt
ICAgIGludCBpOw0KPiArICAgIGxwYWVfdCAqZmlyc3Q7DQo+IA0KPiAgICAgZmlyc3QgPSBhbGxv
Y194ZW5oZWFwX3BhZ2UoKTsgLyogcm9vdCA9PSBmaXJzdCBsZXZlbCBvbiAzMi1iaXQgMy1sZXZl
bCB0cmllICovDQo+IC0gICAgZG9taGVhcCA9IGFsbG9jX3hlbmhlYXBfcGFnZXMoZ2V0X29yZGVy
X2Zyb21fcGFnZXMoRE9NSEVBUF9TRUNPTkRfUEFHRVMpLCAwKTsNCj4gDQo+IC0gICAgaWYgKCBk
b21oZWFwID09IE5VTEwgfHwgZmlyc3QgPT0gTlVMTCApDQo+ICsgICAgaWYgKCAhZmlyc3QgKQ0K
PiAgICAgew0KPiAtICAgICAgICBwcmludGsoIk5vdCBlbm91Z2ggZnJlZSBtZW1vcnkgZm9yIHNl
Y29uZGFyeSBDUFUlZCBwYWdldGFibGVzXG4iLCBjcHUpOw0KPiAtICAgICAgICBmcmVlX3hlbmhl
YXBfcGFnZXMoZG9taGVhcCwgZ2V0X29yZGVyX2Zyb21fcGFnZXMoRE9NSEVBUF9TRUNPTkRfUEFH
RVMpKTsNCj4gLSAgICAgICAgZnJlZV94ZW5oZWFwX3BhZ2UoZmlyc3QpOw0KPiArICAgICAgICBw
cmludGsoIkNQVSV1OiBVbmFibGUgdG8gYWxsb2NhdGUgdGhlIGZpcnN0IHBhZ2UtdGFibGVcbiIs
IGNwdSk7DQo+ICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICAgICB9DQo+IA0KPiAgICAgLyog
SW5pdGlhbGlzZSByb290IHBhZ2V0YWJsZSBmcm9tIHJvb3Qgb2YgYm9vdCB0YWJsZXMgKi8NCj4g
ICAgIG1lbWNweShmaXJzdCwgY3B1MF9wZ3RhYmxlLCBQQUdFX1NJWkUpOw0KPiArICAgIHBlcl9j
cHUoeGVuX3BndGFibGUsIGNwdSkgPSBmaXJzdDsNCj4gDQo+IC0gICAgLyogRW5zdXJlIHRoZSBk
b21oZWFwIGhhcyBubyBzdHJheSBtYXBwaW5ncyAqLw0KPiAtICAgIG1lbXNldChkb21oZWFwLCAw
LCBET01IRUFQX1NFQ09ORF9QQUdFUypQQUdFX1NJWkUpOw0KPiAtDQo+IC0gICAgLyogVXBkYXRl
IHRoZSBmaXJzdCBsZXZlbCBtYXBwaW5nIHRvIHJlZmVyZW5jZSB0aGUgbG9jYWwgQ1BVcw0KPiAt
ICAgICAqIGRvbWhlYXAgbWFwcGluZyBwYWdlcy4gKi8NCj4gLSAgICBmb3IgKCBpID0gMDsgaSA8
IERPTUhFQVBfU0VDT05EX1BBR0VTOyBpKysgKQ0KPiArICAgIGlmICggIWluaXRfZG9taGVhcF9t
YXBwaW5ncyhjcHUpICkNCj4gICAgIHsNCj4gLSAgICAgICAgcHRlID0gbWZuX3RvX3hlbl9lbnRy
eSh2aXJ0X3RvX21mbihkb21oZWFwICsgaSAqIFhFTl9QVF9MUEFFX0VOVFJJRVMpLA0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1UX05PUk1BTCk7DQo+IC0gICAgICAgIHB0ZS5w
dC50YWJsZSA9IDE7DQo+IC0gICAgICAgIHdyaXRlX3B0ZSgmZmlyc3RbZmlyc3RfdGFibGVfb2Zm
c2V0KERPTUhFQVBfVklSVF9TVEFSVCtpKkZJUlNUX1NJWkUpXSwgcHRlKTsNCj4gKyAgICAgICAg
cHJpbnRrKCJDUFUldTogVW5hYmxlIHRvIHByZXBhcmUgdGhlIGRvbWhlYXAgcGFnZS10YWJsZXNc
biIsIGNwdSk7DQo+ICsgICAgICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIGNwdSkgPSBOVUxMOw0K
PiArICAgICAgICBmcmVlX3hlbmhlYXBfcGFnZShmaXJzdCk7DQo+ICsgICAgICAgIHJldHVybiAt
RU5PTUVNOw0KPiAgICAgfQ0KPiANCj4gLSAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCBjcHUpID0g
Zmlyc3Q7DQo+IC0gICAgcGVyX2NwdSh4ZW5fZG9tbWFwLCBjcHUpID0gZG9taGVhcDsNCj4gLQ0K
PiAgICAgY2xlYXJfYm9vdF9wYWdldGFibGVzKCk7DQo+IA0KPiAgICAgLyogU2V0IGluaXRfdHRi
ciBmb3IgdGhpcyBDUFUgY29taW5nIHVwICovDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
c2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+IGluZGV4IDg1ZmY5NTZlYzJlMy4uMDY4
ZTg0YjEwMzM1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiArKysgYi94
ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiBAQCAtNzgzLDYgKzc4MywxNCBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfbW0odm9pZCkNCj4gICAgIHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MocmFt
X3N0YXJ0LCByYW1fZW5kKTsNCj4gICAgIG1heF9wYWdlID0gUEZOX0RPV04ocmFtX2VuZCk7DQo+
IA0KPiArICAgIC8qDQo+ICsgICAgICogVGhlIGFsbG9jYXRvcnMgbWF5IG5lZWQgdG8gdXNlIG1h
cF9kb21haW5fcGFnZSgpIChzdWNoIGFzIGZvcg0KPiArICAgICAqIHNjcnViYmluZyBwYWdlcyku
IFNvIHdlIG5lZWQgdG8gcHJlcGFyZSB0aGUgZG9taGVhcCBhcmVhIGZpcnN0Lg0KPiArICAgICAq
Lw0KPiArICAgIGlmICggIWluaXRfZG9taGVhcF9tYXBwaW5ncyhzbXBfcHJvY2Vzc29yX2lkKCkp
ICkNCj4gKyAgICAgICAgcGFuaWMoIkNQVSV1OiBVbmFibGUgdG8gcHJlcGFyZSB0aGUgZG9taGVh
cCBwYWdlLXRhYmxlc1xuIiwNCj4gKyAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKTsN
Cj4gKw0KPiAgICAgLyogQWRkIHhlbmhlYXAgbWVtb3J5IHRoYXQgd2FzIG5vdCBhbHJlYWR5IGFk
ZGVkIHRvIHRoZSBib290IGFsbG9jYXRvci4gKi8NCj4gICAgIGluaXRfeGVuaGVhcF9wYWdlcyht
Zm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQpLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
IG1mbl90b19tYWRkcih4ZW5oZWFwX21mbl9lbmQpKTsNCj4gLS0gDQo+IDIuMzIuMA0KPiANCg0K

