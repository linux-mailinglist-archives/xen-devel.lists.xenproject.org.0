Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2E36E839
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119859.226615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc3KP-0007OR-Ft; Thu, 29 Apr 2021 09:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119859.226615; Thu, 29 Apr 2021 09:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc3KP-0007O2-Bt; Thu, 29 Apr 2021 09:51:25 +0000
Received: by outflank-mailman (input) for mailman id 119859;
 Thu, 29 Apr 2021 09:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKuK=J2=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lc3KN-0007Nw-It
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:51:23 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::608])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fae62a45-f470-4003-b37a-529f20ff2da5;
 Thu, 29 Apr 2021 09:51:21 +0000 (UTC)
Received: from MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2f::13)
 by AM7PR08MB5350.eurprd08.prod.outlook.com (2603:10a6:20b:101::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 09:51:10 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:2f:cafe::cd) by MR1P264CA0026.outlook.office365.com
 (2603:10a6:501:2f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Thu, 29 Apr 2021 09:51:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 09:51:08 +0000
Received: ("Tessian outbound 13cdc29c30b8:v91");
 Thu, 29 Apr 2021 09:51:07 +0000
Received: from 89079452d038.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2BD8398-0CCE-4258-A063-5ACAEBBC4191.1; 
 Thu, 29 Apr 2021 09:51:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89079452d038.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Apr 2021 09:51:00 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0802MB2541.eurprd08.prod.outlook.com (2603:10a6:800:b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Thu, 29 Apr
 2021 09:50:57 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4065.028; Thu, 29 Apr 2021
 09:50:57 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0213.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.28 via Frontend Transport; Thu, 29 Apr 2021 09:50:56 +0000
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
X-Inumbo-ID: fae62a45-f470-4003-b37a-529f20ff2da5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79WTCZcz/4zCFT2hVqvW4JD7Ce1azRGiFoIX3Tb5AQU=;
 b=dXIpiycyviaqLoJVW2+DVFlVgcnw6fZX+3eoFMf/txsfnS8ZQd6pxCPhjRRb8aCkNe2o6b1aD6DARFtpfCWT9HsJ7jOy3DVafFRzEnLCFcz/8OXkXxEP2YrRHAQas1zt0b6CZw+hz7DCI4Szc1kssXQq1M8MBS4DnJXz9p0IAD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 419381b64f7f2dc4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvQjUW9mg3jL0hVmH+9nS+SupC/rWO+/vr/iO974yLUglh496K2zLttpltNItZ8QW//53ELf/Pcyl4Ba99z5Dd7FAimqJOvR3lJPBegx3vILx1qgSuH+ibqaPSTXYAe3D9qoqexlomK3IITaTKWA+L9InOMzkpu/x8FCNI2MsXpk9piFWpBcySWHq1TgCJqs6YXo3SxVrA0276FxdaGE1V+w9ToHPSa3TcItXwcvvgnrtmZsl6WMSzO6CI0ObIVIw9JA9G2dKGbCCKQrU3hj3plLnPb9OOWsld5giemdYzNKnjnIGLL3ASPdeLsmfr/mjvrJA5mR2t1j8StcflifxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79WTCZcz/4zCFT2hVqvW4JD7Ce1azRGiFoIX3Tb5AQU=;
 b=niBFl892Pewkl6mUCIb6O/UGk8rgrvjvHthGr8oQiu09hB9MghUZGxcCDX2vBFcQIn3UEndxs2Kh3JKxNl554Dd2zzlUMrRL00yHitnbib83SlOauqT2j8E2dW2M7qP9Cg/B7gT7ZcpqnTdRa3TWwkiun+3EYVESoEeffBmIuIhRf2rVvAGdRXqXS4/BMvbKWKw/y7EPI+HuMqypBxg8bDD0UWYbG7XytixBV+oALC0vy3GbDcdlj9NtgAhHyvdNoUuqv9Ol5DxxhnkE8mWr7aYuGFHTVdoOMwxI5+tVRG4iTmsUjoZF0lVvClJ0/ONUhZVpdm2Wtm/N0xhWHXrPYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79WTCZcz/4zCFT2hVqvW4JD7Ce1azRGiFoIX3Tb5AQU=;
 b=dXIpiycyviaqLoJVW2+DVFlVgcnw6fZX+3eoFMf/txsfnS8ZQd6pxCPhjRRb8aCkNe2o6b1aD6DARFtpfCWT9HsJ7jOy3DVafFRzEnLCFcz/8OXkXxEP2YrRHAQas1zt0b6CZw+hz7DCI4Szc1kssXQq1M8MBS4DnJXz9p0IAD0=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <d50b05f7-f644-0123-9994-d31668bd5b5f@suse.com>
Date: Thu, 29 Apr 2021 10:50:48 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <38004B72-8F91-4B4E-843E-B80911DC48B3@arm.com>
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
 <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
 <E47AFE69-CA75-468D-868D-182F78C6992C@arm.com>
 <d50b05f7-f644-0123-9994-d31668bd5b5f@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0213.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::33) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f283752-718f-4b9a-97ab-08d90af45056
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2541:|AM7PR08MB5350:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB53509EC57E97B27840D53B33E45F9@AM7PR08MB5350.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j7YF5nSN4XqpOU8W4gHttwhXDpKstbWKUs1gUMbT7ynkdx7oi3s25mc9mlxzPgf5h1j44dVq8H/iWN/Hwu/bVBnAsTFsesESNqazAGhG2XHUyAk4GSe6Fk1hRJQBffvZhNx9KmBYhqIsHbZSH2uoJmZN95kS10I8on20d3MAItZWNFB64fFXxPrAFitY0uBLKV1qqmSgoWtqVYiNY48lThVJUT0bhWtTlDX8pm+NB3F7W1+M+pWQeP4EidmSoww5/NfsDG2WU20l6fcG5SFVRdDdRoR2IrZCQsFF3eFRW2mcQhWzY6DpUZ9u35IGAmkfkokXodRs4UjjsfmedJoS6MF+qpr5/awxn2t4ayt3Ma5w0TpuPEHm5HOEwrcv8xndJzZ5/fhnuDR/cDtc4uqPJ8CrAa35yVXcarABRWW3cEXHQGzdYkwpIZtTZ/i9NXF3U3nOLjtY9B/iyXHBGDfu/f9eWqEDLUGJW7pD5tSwgwZBfzIhQqq3yrsWvfHdwLvIDufP/P523IHgRaXpiRJLdw3J5uSynFvqEscFc8ua8OmQLshF3QzFJYT2eNBQHTNzB+X+7e9X5MT1C18ioqjHQwCOHw+RFrtIM4uJQr8U5oIIOUO4BXrcuj77cbdALd2NjR20jSObm4SuwdQUXT3ZUBbYlU4+/CAXrwRWHgBazLQbpHVVPmBhsuwMmQudm21J
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(2616005)(26005)(38350700002)(5660300002)(66476007)(66946007)(7696005)(186003)(53546011)(6916009)(38100700002)(316002)(8936002)(478600001)(16526019)(83380400001)(956004)(36756003)(6666004)(44832011)(54906003)(66556008)(2906002)(6486002)(4326008)(52116002)(86362001)(33656002)(8676002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?KzNnRjVWYjRyKzlnNzE3aWJPUFBpN0NCZ1VqaFRMYkZuVVdxdGVoZk9OQlda?=
 =?utf-8?B?ZWdxNzlibHVyMXFCSm0wV2tjMHFZTEFqM2xyTU5Hd2hqQmJCY05CbmhaS1Ri?=
 =?utf-8?B?UkFmTlNlbWFQNU41QUEwQm5VSnZGdWlScDBWdm9TK1ZlYUgvbksvSjNleGEv?=
 =?utf-8?B?ZXBxM2h3M09lSUtZbVF2UkdTanUwWFJicTQ3SGlQWURmWWV4M2pnc3RlQUN3?=
 =?utf-8?B?bytqdE8yTFlYL2pURTBVOVdvOExTWjBybW1RdXZ6WWQ5NXdXakY1Qmd1YVBL?=
 =?utf-8?B?UURMci92dkJqWnZiUXBVNFloaWxDZ3ZsUTdySlBmYXB1cnhlandFbGdjaGNq?=
 =?utf-8?B?MmxhZ2ZtV2J0U1ZVQVgzLzZyY0RBWm5tK3E4ak5RL1FhTjRCQzZhejd1bFBr?=
 =?utf-8?B?WTlQNXJpTjlaNU1jRWRpMS9nZlhtUTFjUHJGR0s4MGxvSHJmRzVJTHRFaDE0?=
 =?utf-8?B?NVI3dlRSdDl1aVFJL1RJWUlTRXhLSXcxbWJMb3QxWW9TOEZTU3BlWi8yVWp1?=
 =?utf-8?B?d28wNlBjWllnKzNTaStCWU1MNEszbG80cDNqVlZVRE8wYzhSY0h5VHFhWTE1?=
 =?utf-8?B?cmlBS2VhTkdWbExUWS90aGFFeU42RUNsUEd0SHZEZGtuMXY5WHVGMmVwVnhN?=
 =?utf-8?B?NnFnaUlPd1VQbXFvaXdRZTNPMGthUHBRNjY1bUZuWVRiSWs1VWc3aVNTV2hy?=
 =?utf-8?B?STdxSHFHUmpyNldpbkovaG12WWoxZTB3YTNpTllqMWp6Q3BGNyt4Y3lyeE9h?=
 =?utf-8?B?NkE1a3B6bHM4UlhvMzdEYURZb2o5QXpKaFJwODBiUDMxVWd6Vk95YnhnSi80?=
 =?utf-8?B?R3hnNGxRUC9BWDlxTk9uSm5aUnBNTXYzeE4yOWF1ZHVBbUVnNlJkOVVraUpI?=
 =?utf-8?B?UDlkSzBNS1B6M1pwK3JFRzZBV1oxejQvQ1dCelVXUnB5MStMbmE3TlZMR1Ew?=
 =?utf-8?B?cy9DYzdqcWsva1R1SFhya2xzRHBOeldJSlBVVU91QThnQlFCd0FRdTY3UWwy?=
 =?utf-8?B?Yzg0WVpmSmY5a25CWllwc1V2YzBkOVdBU21wZ01Idk4valNMVVZqbGgrM2g5?=
 =?utf-8?B?ZTNhZlRwMExvRXRldnkwNzVyRTFNNGMvQzhpb1J3RnlXclBGcCttNUJoTW80?=
 =?utf-8?B?bUZPSDQvR2MwbUhaL1ltcld6R01oN0ptWjlxN1U3bUtXN0tLRWxJNE1meUNv?=
 =?utf-8?B?b2pKNmVwZlU4L0hWRzRvSEltbHFoekFnNytHcUg1RkIxQUdFdDNwZG1qSUt4?=
 =?utf-8?B?bmJlcytKL3U1eFg2R3RNekJHdXMwNG0xQzNEV2Z4eGxZYjNiamVJQml2Mjdh?=
 =?utf-8?B?aFBscm1nd3VVczk0VUdtS2RFOHpZYmJsY0V5eFVrVk5BZVkzSHlWQ2hpRnlj?=
 =?utf-8?B?TnJQWDRLQ2NSUkNNa2FxQ0ZodTdlY1ZkRkxHeU9BNHp0ZDVvbVhldTgvT0RH?=
 =?utf-8?B?REVrYkd0SStWaFRwN0dzTitGRXowUWw0ZFIwZ0lLeU1GQTVYNTBzWTh6Rkpn?=
 =?utf-8?B?U3J5WWQ2ZUk5STZvTHZtOXZWeWVIUUcxN2VEMFJkWk5xdERFdDVUWG02MHhn?=
 =?utf-8?B?VHllMW9MYU1ZT2RNYXBQUmVDM3JJUkVIODZqK1luS2pjOG1SeldKdjVpTVNN?=
 =?utf-8?B?VFVlbDJySitVVDFCYStjeHRrWHNQN0pHSi9NSXlhSXRMV1hZYWRta1dPbjY1?=
 =?utf-8?B?TUFOWSs3VkFRZXZOcVdya0JWS2pNQnVXWElpcVlVZ0pnbFZUM2NndmFTSXg0?=
 =?utf-8?Q?3sEmBH3jUVrybqXDWl8KeGzos88q4pMW8K+Q464?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2541
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c0d5e4b-0090-4c05-a787-08d90af44957
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hzKR0GHz9DdC4uPz8MZoRXglqPBO80rgeEX5o3uUogUoMP9vgEqZyBjjcco4bUx2A6toGQDb5LNJHBsfVUpEs2P6P/NLR/CLAdOu5OmRT6XfcAexyJoGV98x3IThAFygzSitmGzWLDGuyRprS8XspOsxDCHqPdai6c0VbouocZLLIw1ou7Cp6Wk4mMXUGw3n4yLO9eBTk6rF/3SvqH1i7O5jglO5UbTeDw/TqP8RFqZnGRAv09WIgMpRd9VJvJiNBynCmuXwcr2/bxlOlrqaqQjDhcFRY9KGUFxYkG9gzu28hjfrwmY49+mUzsNoUdA/J9HyeF5KgKnOA3iF/BsBEJM+vb6P8H8XKR/F/Rlv78Wr6pSDCijsf2FkzKf6E8ykEavPi2/m1Evd9BFzm8ejRlGcRpdmJpJDa7rgQdUkTpIfjNHh0WVfce1vMd1osADSLvlKPmhiwMe1ldVFzAabqHEyw9LMFY/+/f21o6yZA++UHG6zn73rFOHIJWqnjA4sYJSHYWLlICBfPSwOYrc+2qSI1TBcXezkRkUxTrHLfSYAxNHls68BzssPiKI7HL8CpvvlYuAQ8XyTN7us4L2MwcGSE+GAUKAHig8DaaAbdoJS8ROQyG29fr6O0qkhCop6Hog4rbvEB2lOj0UDE33ak0Y7GA6wwqP0orXm917uE3KH5OnHwDra466yF9mGRXpb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(956004)(82310400003)(6666004)(44832011)(5660300002)(478600001)(34020700004)(8936002)(36756003)(4326008)(26005)(8676002)(6862004)(336012)(2616005)(356005)(6486002)(81166007)(83380400001)(33656002)(86362001)(82740400003)(2906002)(54906003)(47076005)(36860700001)(70206006)(7696005)(316002)(16526019)(186003)(70586007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 09:51:08.4066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f283752-718f-4b9a-97ab-08d90af45056
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350



> On 29 Apr 2021, at 10:04, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.04.2021 16:59, Luca Fancellu wrote:
>>> On 27 Apr 2021, at 14:57, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 26.04.2021 17:37, Luca Fancellu wrote:
>>>> @@ -66,6 +67,7 @@
>>>> *     compiler barrier will still be required.
>>>> *
>>>> * Introducing a valid entry into the grant table:
>>>> + * @code
>>>> *  1. Write ent->domid.
>>>> *  2. Write ent->frame:
>>>> *      GTF_permit_access:   Frame to which access is permitted.
>>>> @@ -73,20 +75,25 @@
>>>> *                           frame, or zero if none.
>>>> *  3. Write memory barrier (WMB).
>>>> *  4. Write ent->flags, inc. valid type.
>>>> + * @endcode
>>>> *
>>>> * Invalidating an unused GTF_permit_access entry:
>>>> + * @code
>>>> *  1. flags =3D ent->flags.
>>>> *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>> *  NB. No need for WMB as reuse of entry is control-dependent on succe=
ss of
>>>> *      step 3, and all architectures guarantee ordering of ctrl-dep wr=
ites.
>>>> + * @endcode
>>>> *
>>>> * Invalidating an in-use GTF_permit_access entry:
>>>> + *
>>>> *  This cannot be done directly. Request assistance from the domain co=
ntroller
>>>> *  which can set a timeout on the use of a grant entry and take necess=
ary
>>>> *  action. (NB. This is not yet implemented!).
>>>> *
>>>> * Invalidating an unused GTF_accept_transfer entry:
>>>> + * @code
>>>> *  1. flags =3D ent->flags.
>>>> *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>=20
>>> Since neither in the cover letter nor in the description here I could
>>> spot a link to the resulting generated doc, I wonder what the
>>> inconsistencies above are about: You add @code/@endcode (and no blank
>>> lines) to parts of what's being described, and _instead_ a blank line
>>> to another part. I think the goal should be that not only the
>>> generated doc ends up looking "nice", but that the source code also
>>> remains consistent. Otherwise, someone like me coming across this
>>> later on might easily conclude that there was a @code/@endcode pair
>>> missed.
>>=20
>> Yes I=E2=80=99ll explain better in the commit message, that part and oth=
er parts are
>> enclosed by @code/@endcode because they are formatted using spaces.
>> If the block is not enclosed the spaces are missing in the html page res=
ulting
>> In a mess.
>> If you can suggest an alias for the @code/@endcode command, I can create
>> it so that the user looking the source code can understand better what's=
 going on.
>> An example: @keepformat/@endkeepformat OR @keepindent/@endkeepindent
>=20
> Oh, are you suggesting @code / @endcode isn't something doxygen mandates?
> In this case either of your alternative suggestions would look better to
> me. Which one depend on whether the goal to to merely keep indentation or
> whether formatting should be kept altogether.

Hi Jan,

Sure, I can go with @keepindent/@endkeepindent

>=20
>>>> @@ -97,18 +104,23 @@
>>>> *      transferred frame is written. It is safe for the guest to spin =
waiting
>>>> *      for this to occur (detect by observing GTF_transfer_completed i=
n
>>>> *      ent->flags).
>>>> + * @endcode
>>>> *
>>>> * Invalidating a committed GTF_accept_transfer entry:
>>>> *  1. Wait for (ent->flags & GTF_transfer_completed).
>>>> *
>>>=20
>>> Why did this not also get enclosed by @code/@endcode?
>>=20
>> In this case there are no spaces that contributes to the indentation.
>=20
> But if, for consistency, @code / @endcode were added here, all would
> still be well?

Yes it would be ok, in the html page you will see a box with this text insi=
de.
If you see the url I sent in previous mail, you can see the rendering of th=
e
@code/@endcode in the html page to have an idea on how it looks.

>=20
>>>> * Changing a GTF_permit_access from writable to read-only:
>>>> + *
>>>> *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writi=
ng.
>>>> *
>>>> * Changing a GTF_permit_access from read-only to writable:
>>>> + *
>>>> *  Use SMP-safe bit-setting instruction.
>>>=20
>>> And these two?
>>=20
>> These two lines makes the resulting html page looks better, the source c=
ode however
>> seems not too impacted by the change though.
>=20
> I was rather asking about the absence of @code / @endcode here.

I didn=E2=80=99t use it because there is no space indentation to be kept, i=
t looks better either in the
source code and in the html page in this way

>=20
>>>> + * @addtogroup grant_table Grant Tables
>>>=20
>>> And no blank (comment) line ahead of this?
>>=20
>> Here there is no need for a blank line in the comment, but if in your op=
inion the source
>> code will look better I can add it
>=20
> I think so, yes.

I will add it in the next patch

>=20
>>>> @@ -120,24 +132,26 @@ typedef uint32_t grant_ref_t;
>>>> * [GST]: This field is written by the guest and read by Xen.
>>>> */
>>>>=20
>>>> -/*
>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>> - * for backwards compatibility.  New guests should use version 2.
>>>> - */
>>>> #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>>>> #define grant_entry_v1 grant_entry
>>>> #define grant_entry_v1_t grant_entry_t
>>>> #endif
>>>> +/**
>>>> + * Version 1 of the grant table entry structure is maintained purely
>>>> + * for backwards compatibility.  New guests should use version 2.
>>>> + */
>>>=20
>>> In case I didn't say so already before - I think this would be a good
>>> opportunity to drop the comment pointing at v2. With v2 optionally
>>> unavailable altogether, this can't possibly be a generally valid
>>> course of action.
>>=20
>> Could you explain me better that? Do you want to get rid of this comment=
?
>=20
> Especially the second sentence is misleading. If new code used v2, it
> would not work on Xen with v2 support turned off.

Can you suggest what to write here? I=E2=80=99m not very familiar with this=
 xen
Interface

>=20
>> /**
>> * Version 1 of the grant table entry structure is maintained purely
>> * for backwards compatibility.  New guests should use version 2.
>> */
>>=20
>> In this case I don=E2=80=99t think this commit is the right place to do =
that, I can just
>> put it back where it was so that the documentation simply doesn=E2=80=99=
t show that.
>=20
> Keeping misleading information out of the docs is imo rather desirable.
> Of course we should, independently of that, also address the misleading
> information in the source code. I can accept that doing the adjustment
> right in this patch may not be ideal. I don't suppose I could talk you
> into adding a prereq patch dropping at least that 2nd sentence?
>=20

I will push a patch to change this comment and I will rebase this serie on
Top of that.

Cheers,
Luca

> Jan


