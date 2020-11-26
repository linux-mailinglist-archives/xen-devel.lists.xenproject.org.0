Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D22C50E1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 10:05:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38314.71058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiDCn-0006V5-N1; Thu, 26 Nov 2020 09:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38314.71058; Thu, 26 Nov 2020 09:04:45 +0000
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
	id 1kiDCn-0006Uf-JT; Thu, 26 Nov 2020 09:04:45 +0000
Received: by outflank-mailman (input) for mailman id 38314;
 Thu, 26 Nov 2020 09:04:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kiDCl-0006Ua-Ck
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:04:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.58]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd90020a-1ff3-4d7c-9084-455ba474bcbc;
 Thu, 26 Nov 2020 09:04:42 +0000 (UTC)
Received: from DB7PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:10:72::16)
 by AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:04:35 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::10) by DB7PR03CA0075.outlook.office365.com
 (2603:10a6:10:72::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 09:04:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 09:04:35 +0000
Received: ("Tessian outbound 082214a64d39:v71");
 Thu, 26 Nov 2020 09:04:34 +0000
Received: from f9916890ed0d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4496F37-1511-4CDD-9F5F-75BE5D70224C.1; 
 Thu, 26 Nov 2020 09:04:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9916890ed0d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Nov 2020 09:04:28 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:04:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 09:04:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kiDCl-0006Ua-Ck
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:04:43 +0000
X-Inumbo-ID: bd90020a-1ff3-4d7c-9084-455ba474bcbc
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.58])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bd90020a-1ff3-4d7c-9084-455ba474bcbc;
	Thu, 26 Nov 2020 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7FYCXLKpq3GugLNHqEUXAZJx5k0nXUoNo1QFsUcmow=;
 b=q6NeNfgd6MGuATU36I1DA26VaFKKQlFBFnmuyWSlot/xCHXkjr+Biq5ITab/qebVyKrbWoFx7nwYaQWc+jvcTOVK7ZgIw/lknDY7sY1hecimlhFMXVrqivW6x1bi4A8f7KA7jqSuuZeH7bbuHxWrSoamWzcrfcKN8ymbcsQNiqU=
Received: from DB7PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:10:72::16)
 by AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:04:35 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::10) by DB7PR03CA0075.outlook.office365.com
 (2603:10a6:10:72::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 09:04:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 09:04:35 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Thu, 26 Nov 2020 09:04:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4d613cb1f479c8d
X-CR-MTA-TID: 64aa7808
Received: from f9916890ed0d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E4496F37-1511-4CDD-9F5F-75BE5D70224C.1;
	Thu, 26 Nov 2020 09:04:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9916890ed0d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Nov 2020 09:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhSUTa3+SXsKXjkFBpRCCZWhLhAOIe/I97oAK1JviYopMcx5bH9qMs8ZFpG7/SyrHVcxl8pD9GgYrMRXPzxISOasiFm99ck2E7axyk0dRb1Qfn1Bfo3/ipBWkYUpW45jiWjR7bysO4E6MSrITGHZNwclQ9HaQhQwGtBMyGbTXBx6xadXFmEUaV6739Axqryy02RUA4cNGPjvXo612exN69ggTDaCyZ54z1961YFVgaa6l8Tid1hBDKNNa7yvNfRL2VC8cEXMgXrbNLq5/sALukW+gDG8Prxc7SjnBqkqpXczM2U4QlT3lX98rNFusgqR/FsraCoCVkZXzA65E9S/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7FYCXLKpq3GugLNHqEUXAZJx5k0nXUoNo1QFsUcmow=;
 b=UP16/5HLfS8GgErgG+A2erLbsE97nRZkOmjSBaT1Hwe7JQK+Ts28rkKDk2M3ztU3sj4FDcqdnBXU01VvjrXALrxxZ+sfZRuxbItuDa1+AQZkiOvKap4OSRBf2JrbWza381buGy/5lJ+tpN2dxXwREL4hc56+Iv9gA0GElC3LxoD09AA7q48Hq7D+x8cuwgtEjGH8nbH17kR0SPd5FbEX5ivYa3FZWT04QvWr78tvzmEAvToMuU48mFmYXLoYEVUD0BresDA1LXsSryJF9nFzyhyygjPCuByI99Ib+rX5MtEkSDK9AYaiwyrR28dseH3hOwqfnZTtRHcF7Zes5Txblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7FYCXLKpq3GugLNHqEUXAZJx5k0nXUoNo1QFsUcmow=;
 b=q6NeNfgd6MGuATU36I1DA26VaFKKQlFBFnmuyWSlot/xCHXkjr+Biq5ITab/qebVyKrbWoFx7nwYaQWc+jvcTOVK7ZgIw/lknDY7sY1hecimlhFMXVrqivW6x1bi4A8f7KA7jqSuuZeH7bbuHxWrSoamWzcrfcKN8ymbcsQNiqU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:04:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 09:04:27 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/3] xen/pci: Move x86 specific code to x86 directory.
Thread-Topic: [PATCH v4 1/3] xen/pci: Move x86 specific code to x86 directory.
Thread-Index: AQHWw1crc3wbvvllAUG9bYTTFcj66qnaH5kA
Date: Thu, 26 Nov 2020 09:04:27 +0000
Message-ID: <57E71345-E9D4-439D-B959-E520BC473F7D@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <3500f44e3b6f8f05f9d05fa170817d5bc6f39f22.1606326929.git.rahul.singh@arm.com>
In-Reply-To:
 <3500f44e3b6f8f05f9d05fa170817d5bc6f39f22.1606326929.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20379137-24c6-482c-62b5-08d891ea4ba7
x-ms-traffictypediagnostic: DBAPR08MB5752:|AM6PR08MB3208:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB32084A1596DF3006EE30191E9DF90@AM6PR08MB3208.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f/Jr8kAZV1C9dOzS2I4MzLj/mngVpZrGKJh9vZxk6lr+dT0iZN0316b2YkPBwLk20Xc9+dwrBsXkhNT531lrEG3q4E4FNEfEIt45jMI7fWzgI0tvRlnCpWngLZ/n34IGhV0cVz4d4viYofi6uv3Dto0O3uOoplATrfVyr7OVyNL+xkjxGdWllP8qsK0bZz+ELZawbNtm0dn5TVN6YCbNQYLs90YKx3W4le1Fqj8LjknjZG5ya7ClKAeqjpK8Cz99JigjewT9Q3S6E2wfklBbCRs0PryGVm/2Xq3X5p33GTYeV3aSVWrcwi9CUgsSHaEB1kHXzlC6phFFrBwhDM8u6SE0mq2Jtyx9YQAJe+PlvHghN4Msnu0uyzuaeAd8oNkP43lto9wN6VkbxIz18Wdufg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(6506007)(86362001)(6512007)(186003)(8936002)(6636002)(316002)(33656002)(53546011)(6862004)(26005)(37006003)(6486002)(2616005)(2906002)(5660300002)(8676002)(54906003)(76116006)(91956017)(4326008)(36756003)(66476007)(66556008)(66946007)(66446008)(83380400001)(71200400001)(478600001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ZPzQ22ycQrz3u0HxcrY2sT/H0YJN88W4AwjJogqWSA/ogcXEDIutSA2j0cLh?=
 =?us-ascii?Q?7NlSj0+5QlEkMGprksta3YPsH7bHzLqGym40OYQrgc3deARUNuJfp/oSYjr4?=
 =?us-ascii?Q?iGNhQotAGFgk0usCSE2v9NAX1IFsQX5PpI8bToNE6A8r0odOdm4zUnxytRzS?=
 =?us-ascii?Q?JtGQTd2caKZ6K3JHYGdhoh6mzUvhjbfRJDX0tRqri9CACKYz2NqY+V1+8s9C?=
 =?us-ascii?Q?H4SMKICPkLbf+yXiwyPy3NBNzD/eR46b3hbYPbSUJa3Grv8P7/4UyV7/bHWO?=
 =?us-ascii?Q?Z1ZABDiK6wg4lr/5Vegg0B1SmjrN3OkTUQYOBNIO+m0QrgWY8sqACXk2/fxl?=
 =?us-ascii?Q?T6Mkhsdza+Uu/wILqmGmZRX2iOzJLo/9Ko72F7po6PNU7TVOuZoj9yMMHS+1?=
 =?us-ascii?Q?r9/DtN7wiLJXvIp+TsigZZa3b5wMAqR4dhGoCFqWFnsdpMuhwZWpUMCCWQfW?=
 =?us-ascii?Q?WoOOZNKHAqtYygiNV8H71thH3t7OO4CQ3n/sBzfSfPtZckMk3tvFuSyanwPX?=
 =?us-ascii?Q?hZJWF0yDxtKHwik1McPw14WggI+JdejWOntimSstaKkaLjZKM2Ushmbb2VNA?=
 =?us-ascii?Q?WBCjyZOR4/q7dLkvAG/u40j0LjGKL8Cin24APyxJrTvvMagB4V8hidqaEWC5?=
 =?us-ascii?Q?wrBsi148b/RHiemv/Lu2Q6HYA+z6Hl7QXjLbc6v4scOA0aEmJ0yrFwt/92SC?=
 =?us-ascii?Q?iBV1V+cGPb5AjG6fdNRvGnYi8rc+V9fNtjuz9+z9soxFZM/b8nMYcKsb/b6K?=
 =?us-ascii?Q?SxYFqs2l1Xdvv4A2QSB8GQ5Md76vU3SpL9s0pN+ozxXQ4GlQNPfUhmSMvMrB?=
 =?us-ascii?Q?8C9Q+nGSmIkfNBKZdCMXJO6fXPqR0DMDBjnPKrU8ukA8KqceJXLt5ImSjhgU?=
 =?us-ascii?Q?GNqUdwr2LCBsMeT5Q8gSx7+HSE/cAP3AbpjL+mVZnqw8AypTOAJRXtx8GP/F?=
 =?us-ascii?Q?6jOm/rSzZAqnYPL9GpX/rBn53vi6ajxFTPWY5CwSM3zq/Sa7uiHWd6dx7Kdj?=
 =?us-ascii?Q?mvmp?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6CFF37332EDAFD45BF176D075271F592@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50a2ef6a-8e85-4ff6-d78a-08d891ea4706
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KVFWVzL0sLnoffW2gW3W0tiUljNITdauBRKtsDDFXVfu0gD+olV1AhgFdPlXYmGZ0m5wi3Lfol6Q1taPP3LVBI5HZayUqExX3ZQ6kzHIyCQ4EA232R9nLreWwhVp4HPYqc9Ire8lh1HVmb8kQqjU2MeRzdeuZShLdOzWSoto+tQE+eYr4OAQfLaaKLK8nR2CJ1PpD0TGKO9VarPYKqWvZ+iRQnxyG0l/br+nz7705iYQAxPmsAJCxjhUt8VWfIT8c01reriuo2cG2/I4hbizTuooR4vFAL0WnXWDF7cTKMAQr9UeFGaXCq0EHHNOhrG4Gyy+lwCV1R1mCcG5kvMewuT3c6q813ZelBygDV1rOQkQz3rI+UD4iSJEz6ig+90Cbiz7MeQTmRNN2YuemEPyK/uiPrHH7uKRJCxSNC8pp36tcbXJNfejS0faYp4fxJGsdgCemFislCc63bMJ9rqZaas5clWy0TAtHq+UyEIPLfA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(70206006)(4326008)(54906003)(6512007)(81166007)(36756003)(8676002)(70586007)(356005)(6862004)(83380400001)(82740400003)(316002)(8936002)(47076004)(6636002)(33656002)(336012)(86362001)(186003)(26005)(37006003)(478600001)(6506007)(53546011)(2616005)(6486002)(2906002)(82310400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 09:04:35.0481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20379137-24c6-482c-62b5-08d891ea4ba7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3208



> On 25 Nov 2020, at 18:16, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> passthrough/pci.c file is common for all architecture, but there is x86
> specific code in this file.
>=20
> Move x86 specific code to the drivers/passthrough/io.c file to avoid
> compilation error for other architecture.
>=20
> As drivers/passthrough/io.c is compiled only for x86 move it to
> x86 directory and rename it to hvm.c.
>=20
> No functional change intended.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Changes in v4:
> - fixed compilation error when CONFIG_HVM is disabled=20
> - remove iommu_update_ire_from_msi from the patch will send another patch
>  to fix.
>=20
> ---
> xen/drivers/passthrough/Makefile            |  3 -
> xen/drivers/passthrough/pci.c               | 71 +--------------------
> xen/drivers/passthrough/x86/Makefile        |  1 +
> xen/drivers/passthrough/{io.c =3D> x86/hvm.c} | 66 +++++++++++++++++++
> xen/include/xen/pci.h                       |  9 +++
> 5 files changed, 77 insertions(+), 73 deletions(-)
> rename xen/drivers/passthrough/{io.c =3D> x86/hvm.c} (95%)
>=20
> diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/M=
akefile
> index e973e16c74..cc646612c7 100644
> --- a/xen/drivers/passthrough/Makefile
> +++ b/xen/drivers/passthrough/Makefile
> @@ -6,6 +6,3 @@ obj-$(CONFIG_ARM) +=3D arm/
> obj-y +=3D iommu.o
> obj-$(CONFIG_HAS_PCI) +=3D pci.o
> obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device_tree.o
> -
> -x86-$(CONFIG_HVM) :=3D io.o
> -obj-$(CONFIG_X86) +=3D $(x86-y)
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index 51e584127e..3c6ab1bcb6 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -14,9 +14,6 @@
>  * this program; If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> -#include <xen/sched.h>
> -#include <xen/pci.h>
> -#include <xen/pci_regs.h>
> #include <xen/pci_ids.h>
> #include <xen/list.h>
> #include <xen/prefetch.h>
> @@ -24,7 +21,6 @@
> #include <xen/irq.h>
> #include <xen/param.h>
> #include <xen/vm_event.h>
> -#include <asm/hvm/irq.h>
> #include <xen/delay.h>
> #include <xen/keyhandler.h>
> #include <xen/event.h>
> @@ -842,71 +838,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>     return ret;
> }
>=20
> -static int pci_clean_dpci_irq(struct domain *d,
> -                              struct hvm_pirq_dpci *pirq_dpci, void *arg=
)
> -{
> -    struct dev_intx_gsi_link *digl, *tmp;
> -
> -    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> -
> -    if ( pt_irq_need_timer(pirq_dpci->flags) )
> -        kill_timer(&pirq_dpci->timer);
> -
> -    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> -    {
> -        list_del(&digl->list);
> -        xfree(digl);
> -    }
> -
> -    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> -
> -    if ( !pt_pirq_softirq_active(pirq_dpci) )
> -        return 0;
> -
> -    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
> -
> -    return -ERESTART;
> -}
> -
> -static int pci_clean_dpci_irqs(struct domain *d)
> -{
> -    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
> -
> -    if ( !is_iommu_enabled(d) )
> -        return 0;
> -
> -    if ( !is_hvm_domain(d) )
> -        return 0;
> -
> -    spin_lock(&d->event_lock);
> -    hvm_irq_dpci =3D domain_get_irq_dpci(d);
> -    if ( hvm_irq_dpci !=3D NULL )
> -    {
> -        int ret =3D 0;
> -
> -        if ( hvm_irq_dpci->pending_pirq_dpci )
> -        {
> -            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci)=
 )
> -                 ret =3D -ERESTART;
> -            else
> -                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
> -        }
> -
> -        if ( !ret )
> -            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> -        if ( ret )
> -        {
> -            spin_unlock(&d->event_lock);
> -            return ret;
> -        }
> -
> -        hvm_domain_irq(d)->dpci =3D NULL;
> -        free_hvm_irq_dpci(hvm_irq_dpci);
> -    }
> -    spin_unlock(&d->event_lock);
> -    return 0;
> -}
> -
> /* Caller should hold the pcidevs_lock */
> static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                            uint8_t devfn)
> @@ -966,7 +897,7 @@ int pci_release_devices(struct domain *d)
>     int ret;
>=20
>     pcidevs_lock();
> -    ret =3D pci_clean_dpci_irqs(d);
> +    ret =3D arch_pci_clean_pirqs(d);
>     if ( ret )
>     {
>         pcidevs_unlock();
> diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrou=
gh/x86/Makefile
> index a70cf9460d..69284a5d19 100644
> --- a/xen/drivers/passthrough/x86/Makefile
> +++ b/xen/drivers/passthrough/x86/Makefile
> @@ -1,2 +1,3 @@
> obj-y +=3D ats.o
> obj-y +=3D iommu.o
> +obj-$(CONFIG_HVM) +=3D hvm.o
> diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/x86/h=
vm.c
> similarity index 95%
> rename from xen/drivers/passthrough/io.c
> rename to xen/drivers/passthrough/x86/hvm.c
> index 6b1305a3e5..41cfa2e200 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -1036,6 +1036,72 @@ unlock:
>     spin_unlock(&d->event_lock);
> }
>=20
> +static int pci_clean_dpci_irq(struct domain *d,
> +                              struct hvm_pirq_dpci *pirq_dpci, void *arg=
)
> +{
> +    struct dev_intx_gsi_link *digl, *tmp;
> +
> +    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> +
> +    if ( pt_irq_need_timer(pirq_dpci->flags) )
> +        kill_timer(&pirq_dpci->timer);
> +
> +    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> +    {
> +        list_del(&digl->list);
> +        xfree(digl);
> +    }
> +
> +    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> +
> +    if ( !pt_pirq_softirq_active(pirq_dpci) )
> +        return 0;
> +
> +    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
> +
> +    return -ERESTART;
> +}
> +
> +int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
> +
> +    if ( !is_iommu_enabled(d) )
> +        return 0;
> +
> +    if ( !is_hvm_domain(d) )
> +        return 0;
> +
> +    spin_lock(&d->event_lock);
> +    hvm_irq_dpci =3D domain_get_irq_dpci(d);
> +    if ( hvm_irq_dpci !=3D NULL )
> +    {
> +        int ret =3D 0;
> +
> +        if ( hvm_irq_dpci->pending_pirq_dpci )
> +        {
> +            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci)=
 )
> +                 ret =3D -ERESTART;
> +            else
> +                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
> +        }
> +
> +        if ( !ret )
> +            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> +        if ( ret )
> +        {
> +            spin_unlock(&d->event_lock);
> +            return ret;
> +        }
> +
> +        hvm_domain_irq(d)->dpci =3D NULL;
> +        free_hvm_irq_dpci(hvm_irq_dpci);
> +    }
> +    spin_unlock(&d->event_lock);
> +
> +    return 0;
> +}
> +
> /*
>  * Note: 'pt_pirq_softirq_reset' can clear the STATE_SCHED before we get =
to
>  * doing it. If that is the case we let 'pt_pirq_softirq_reset' do ref-co=
unting.
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 20a54a5bb4..8e3d4d9454 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -208,4 +208,13 @@ int msixtbl_pt_register(struct domain *, struct pirq=
 *, uint64_t gtable);
> void msixtbl_pt_unregister(struct domain *, struct pirq *);
> void msixtbl_pt_cleanup(struct domain *d);
>=20
> +#ifdef CONFIG_HVM
> +int arch_pci_clean_pirqs(struct domain *d);
> +#else
> +static inline int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif /* CONFIG_HVM */
> +
> #endif /* __XEN_PCI_H__ */
> --=20
> 2.17.1
>=20


