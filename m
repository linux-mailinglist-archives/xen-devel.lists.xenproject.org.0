Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40515574B23
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367519.598576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwPM-0007f2-Tq; Thu, 14 Jul 2022 10:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367519.598576; Thu, 14 Jul 2022 10:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwPM-0007bs-QH; Thu, 14 Jul 2022 10:49:24 +0000
Received: by outflank-mailman (input) for mailman id 367519;
 Thu, 14 Jul 2022 10:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZjPX=XT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBwPK-0007bH-RN
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:49:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e152cff-0362-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 12:49:21 +0200 (CEST)
Received: from AS8PR04CA0065.eurprd04.prod.outlook.com (2603:10a6:20b:313::10)
 by DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 10:49:19 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::7a) by AS8PR04CA0065.outlook.office365.com
 (2603:10a6:20b:313::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15 via Frontend
 Transport; Thu, 14 Jul 2022 10:49:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 10:49:18 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Thu, 14 Jul 2022 10:49:18 +0000
Received: from 09ccef1bb25c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0EEF6103-3ED4-4850-8C3F-77C2B457AB81.1; 
 Thu, 14 Jul 2022 10:49:12 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09ccef1bb25c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 10:49:12 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB6PR0802MB2182.eurprd08.prod.outlook.com (2603:10a6:4:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 10:49:09 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 10:49:09 +0000
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
X-Inumbo-ID: 9e152cff-0362-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bRd8aEs3FQhkkDLCMCRH2tQQ9H+iINtqrAosvwFylx4qioqIa5kHMwpvRHUGaH/0w5bCpugM4hY/ardyR71xh/rtLqxA9yJcIrbqh2hzT5bUJ+lJkGucZnvZhmjsG6ohp2sSpFf2orWhMI1KCa9OvzMA0ByvxwR18EMSTF59YT9xwTT7+IcDvcvy+IJH5mdmf54sykBPLnyFgqh7GUb7E1ArphfnZQz9dfCeBgk3rSHFwKX0vnnIJZaSqr+ro/XjSGwysSzl9gaa9QdDyoA1uoauiOU+19Kqnf7Fg+I7Yr1pedyq+2tukrrK0KaDdJF1J5TLDQFzeKp3+Fr5Q+RmZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEdrk124nRAavj0rfG9jQ9C/87PocluAQuXl930QdYk=;
 b=bN0tIIX+NU2p/cwX15JXAnn4DX5oXk4BlCnIWFEb3lf/DNKzw8zXlKE7+bXpAgbVbgqY8xIwoSxI+sTexl2pITXMnKLcaWD+RGvaTUQeaCph/wA4EJFhIv3A6HZvvVIFixNa6JOrSlD2agJiWbi+Qtk8dWyM0YUPReKYg0tKCtUc9mBjCGgFQuWhyNVZCHYK2LojETrmvHm0IGi6zwEPUF00O0OLgUX7K80jV7Iz9e+f4Q3ZHKLlEcgjCJv7XEjsgEznZDyqAyTQltjxzNdZ93fWLtHf5X1xthCUY9Pepltzk0jeDd1m5IyiXlzM4jTBcoF+KvZa1QkepsFHbwbhsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEdrk124nRAavj0rfG9jQ9C/87PocluAQuXl930QdYk=;
 b=HmY1rYfgDY4JCl56iXfKNSLrr8wK9N3vbZ2Ug8jKl8izEIwv7LAjNys0TSjnPuYqQA1QIyt3u5FJeKoaIvaXXAwKaBOWouQlOWGPnMRvYEK1pyAZlblE20iprNvtNRkNwOoKmLHz2hPDvIqNUbcJSD5HeDI1GziZcGi3pU0+CVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvXxIw6wmjfr/ehqo4rb9tb4cNWek/PsgO9JdxRVWO3SxbmjpoQ03kkyNJhpU7X7+OMQ/OqkCYdEQCvz3YlfkhoHoAPhcQvk9wuYodQksIcbFw8azR8m/fc64I5/Hy3umJFoNFBvuk2+w2qsQVQr79Pvj30bACqynaPbc8pFHG2In6rmA7FKBa8Ht8DwN2Hypr1YvflGiirfG7OM1fNoViXy7jd4XAUQ/lMKRrBlHXUI1Eh6OvuFU2+Ej+uM3wNxsHlTsZmdKSxDuLK3LM5uMnrMSFpK5OUDTiPuotzA3q1V0B0IE26gEfq44H2Ddi3wUquXUX567w3eEj5dHecyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEdrk124nRAavj0rfG9jQ9C/87PocluAQuXl930QdYk=;
 b=eGXYkBuuD+LtchwM54l4ca66RAf6dVHIExgm4HLIwCVVchlvPmcqfsm4Q2m6eeFKtUnY+w+kGiPFZBt38qDHZFNXh83E6+vTax/c9Fm++lAUe9qc50zQ4Qw/xguFPHDBtgwN/1K7nxj1I8vmpK0JN5yFsUV2lBLqSGlh2ymooNnKceCBSYYqCY5joybe8TrrCThOOMXjJ4S88+5+XE+3JZkQ9CBgz9NrQL+OU8aRQMBXbezGvENapne472YQHALwF/SMXGjpZqnJtZnadk7OKTFNBtcC3ntkqL7JiiaxkxCL5Uy/n6vBEyKFcz0u3Bv3Evfcw20PCCaiHk8ZbLQ+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEdrk124nRAavj0rfG9jQ9C/87PocluAQuXl930QdYk=;
 b=HmY1rYfgDY4JCl56iXfKNSLrr8wK9N3vbZ2Ug8jKl8izEIwv7LAjNys0TSjnPuYqQA1QIyt3u5FJeKoaIvaXXAwKaBOWouQlOWGPnMRvYEK1pyAZlblE20iprNvtNRkNwOoKmLHz2hPDvIqNUbcJSD5HeDI1GziZcGi3pU0+CVs=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Topic: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Index:
 AQHYktrASbKlS5xyGUK27wSgSLVuo616tdwAgALfc0CAAA5jAIAABItggAACa4CAAAWRQIAABX2AgAAC1iA=
Date: Thu, 14 Jul 2022 10:49:09 +0000
Message-ID:
 <PAXPR08MB74206EF1995F61B23F4C60609E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
 <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
 <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
In-Reply-To: <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5F46BAD4ED097D49A0010A54F27D6A39.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5ef0b44c-e93e-4525-2c8f-08da658680ef
x-ms-traffictypediagnostic:
	DB6PR0802MB2182:EE_|VE1EUR03FT055:EE_|DB7PR08MB3500:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mAmyxOcVE50BH0LR8AwF4odDzCpXTCnxVZxWTVszyEB1pQ7Rfzd+J7l+okP2QGeof1G6C26XuxpBQId4mZbQO/IsBLMyF5poPMgWGzKK+ArwjgRDSP2HoniFsOTs12tVwiN+WVazx4VehzQY0540WjkNKNrOGjnv5o3tgdL7oF0hcgG1daNdAR5xRsDqBCDQ3bGNvilOqB/Gww6/BqWWW3UJKAHSNCwfgv9SsVYwVYbRXxcZAsElAaezLfOhzxgT9vOdPVIFs/LUxTeJ5qs79Yarm30FC+NpNEYtx2eUL+GXd8W3hUunD+Zv7s7CUl7kOB102QiBDZsM95ADtdeUlWG7EhR9zsESOmlWuhtc1FuDbsjB5b29IIlAWs+cfzlapzpm2wc7B8XdQNUphI9doPxRAoRQR9omGtDeeN4n8dLDW6plx5fxvTDhbXqJCR46f+x7I1o+PLYEemGpR/zXi7pzFwNQBHVCl7+0BlU7SBBCrIUYPu1UVFpd+xSJH1J+uQhqsgdBOGJ6lhO2+BODDRMwsVbNIcCvRv9DYMnAvrE4omh76myDdBHEAkJAMBJt0JgpdKoz425eDmumfe2O6I5i03SE8sye0s0pVbQVLdgi6n+OQPCIrvJ6iVeMH9Yu77/2cyt1KQL2+NviX90Tj/nslFX7VQrem03yPIt5GJZALJaEtIQiRwkhlAwRIwxmc6v1upy16B3b2IkwBrEyUbFZFo81VTrVAdzipTga126kUqzzm1e7pOPalfDGyPqQ237aHKsB1SL6nqU2OF9xmUUG9zDNs1y8ilV59NgFfHKqqndyVGzZqPef1N+fVhm2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(66946007)(478600001)(38100700002)(66446008)(53546011)(52536014)(71200400001)(38070700005)(26005)(9686003)(8676002)(66556008)(66476007)(86362001)(76116006)(4326008)(5660300002)(54906003)(6916009)(64756008)(186003)(122000001)(41300700001)(316002)(2906002)(55016003)(7696005)(8936002)(33656002)(83380400001)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2182
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee984122-2bd3-4383-17eb-08da65867b14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iNGR24apmt8xuEEnYqY3J5hdiASImlcBddQmziIQ5JaUK6ZfhLiy5TQyU7pnzeyh/zHdeR3mlC0qEA3o76IaHaeZ4HfsxbV0pu20Rl7x+PV8xt2uMFm+xpHHvlZLXBhZ14m22oGHGqQlFOSL5+jzXAIg+f4w/yesonESGqhzqv6TI4tSHCj9l8YzMhH9N0SYRENbVKiqhGHL5Gtm4TTbAMj0o4WEXZXXt/ppVsYs2iut7+HSgUHZp/Upc91SEWkdSbIrKKfvqH9So4mXbjQpQ2n3arDTJ7kxBZpPLzC8vLMvY/N7krSPjRnN0sQzv0z0olv+875pcBaczXML/9nh5Ybj39gNslkB1wIXK9gS7/V055yR5mYSE5QQ5ThoxSUl1jrEMwfJlqrvJ9Dbxlh2xCyjflDxk6PqKMGTql2mg20NjqA9pcm9QMi3zjuWWfoc+v4GAIMHu1YehS9vfaU/9KLm9xUYertocx/Fa4ngyuhvmHXAbinM3bIK0RyaIPzfNssZWv3v/i65n9RFk+dPv/1Oivn4scCnB6xncQ9IEBcGB8yE1H22y8T1Qq/bodgr/Oe+lHMe1QLBphhW2GRxhYAC/hbfCmurUWsQWta9Z+YZHlww163Wmcrw7jR63vpr05gFmbwoT2I1tQpqEBz6Ekh10ZwU448fe5nQOdLb11OyZ32ptZMCFto2UFLO6F5ZURqUYTuO5rTDQsDD8BCF2oOgFkLY/xlsKnMGTl6vqw0+RiRIczE+4+F7p/0XsllcJFufgnApsPlY2QOgJ/UhCnyx6uJ0OLGmxa862tZwlMHDUT032g1xXBnJqEOGgp/J
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(40470700004)(46966006)(316002)(478600001)(186003)(70586007)(53546011)(83380400001)(2906002)(82740400003)(70206006)(40460700003)(4326008)(7696005)(54906003)(6506007)(81166007)(8676002)(41300700001)(33656002)(336012)(86362001)(5660300002)(36860700001)(55016003)(6862004)(26005)(40480700001)(47076005)(82310400005)(9686003)(52536014)(356005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:49:18.8439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef0b44c-e93e-4525-2c8f-08da658680ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3500

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxNOaXpSAxODozNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
Mi85XSB4ZW4veDg2OiBVc2UgZW51bWVyYXRpb25zIHRvIGluZGljYXRlIE5VTUENCj4gc3RhdHVz
DQo+ID4+DQo+ID4+IFdlbGwsIHRoaXMgbWFrZXMgdGhlIHRhYmxlIGNvbXBsZXRlLCBidXQgaXQg
ZG9lc24ndCBleHBsYWluIGhvdyB5b3UNCj4gbWVhbg0KPiA+PiB0byBmb2xkIHRoZSBzZXR0aW5n
cyBvZiB0aGUgdHdvIGNvbW1hbmQgbGluZSBvcHRpb25zIGludG8gb25lIHZhcmlhYmxlLg0KPiA+
Pg0KPiA+DQo+ID4gTm8gbWF0dGVyIGhvdyBtYW55IHNlcGFyYXRlICJudW1hPSIgcGFyYW1ldGVy
cyBoYXZlIGJlZW4gcGFyc2VkIGZyb20NCj4gPiBDb21tYW5kIGxpbmUsIHRoZSB2YWx1ZXMgb2Yg
dGhlc2Ugb3JpZ2luYWwgdmFyaWFibGVzIGFyZSBkZXRlcm1pbmVkDQo+ID4gYWZ0ZXIgcGFyc2lu
ZyB0aGUgY29tbWFuZCBsaW5lLiBTbyB0aGUgZGV0ZXJtaW5lZCBzdGF0dXMgY2FuIGJlIG1hcHBl
ZA0KPiA+IHRvIHRoZSBuZXcgb25lIHZhcmlhYmxlIGZyb20gYWJvdmUgdGFibGUuDQo+IA0KPiBI
bW0sIEkgd2FzIHBhcnRseSB3cm9uZyAtIHRoZSBpbml0aWFsIHZhbHVlcyBvZiBib3RoIHZhcmlh
YmxlcyBhcmUNCj4gaW5kZWVkIHNldCBmcm9tIGp1c3QgdGhlIHNpbmdsZSAibnVtYT0iIHBhcnNp
bmcuIEJ1dCBsYXRlciBvbiB0aGV5DQo+ICJldm9sdmUiIGluZGVwZW5kZW50bHksIGFuZCBtdWx0
aXBsZSAibnVtYT0iIG9uIHRoZSBjb21tYW5kIGxpbmUNCj4gY2FuIGFsc28gaGF2ZSAiaW50ZXJl
c3RpbmciIGVmZmVjdHMuIEknbSBhZnJhaWQgSSBzdGlsbCBjYW4ndA0KDQpDYW4geW91IHByb3Zp
ZGUgc29tZSBleGFtcGxlcz8gVGhpcyB3YXkgSSBjYW4gYmV0dGVyIHVuZGVyc3RhbmQgeW91cg0K
Y29uY2VybnMuDQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4gY29udmluY2UgbXlzZWxmIHRoYXQg
dGhlIG5ldyBtYXBwaW5nIGZ1bGx5IHJlcHJlc2VudHMgYWxsIG9yaWdpbmFsbHkNCj4gcG9zc2li
bGUgY29tYmluYXRpb25zIChub3IgY2FuIEkgY29udmluY2UgbXlzZWxmIHRoYXQgaW4gdGhlIGV4
aXN0aW5nDQo+IGNvZGUgZXZlcnl0aGluZyBpcyB3b3JraW5nIGFzIGludGVuZGVkKS4NCj4gDQo+
IEphbg0K

