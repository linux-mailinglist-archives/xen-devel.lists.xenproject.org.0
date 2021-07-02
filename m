Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF03B9E46
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 11:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149095.275588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzFWI-00088u-Sj; Fri, 02 Jul 2021 09:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149095.275588; Fri, 02 Jul 2021 09:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzFWI-00086S-P7; Fri, 02 Jul 2021 09:31:34 +0000
Received: by outflank-mailman (input) for mailman id 149095;
 Fri, 02 Jul 2021 09:31:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qe+=L2=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lzFWH-00086J-3M
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 09:31:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18c9b473-f96f-42f0-87e2-392c2b5709c4;
 Fri, 02 Jul 2021 09:31:30 +0000 (UTC)
Received: from AM4PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:205::35) by
 PAXPR08MB6955.eurprd08.prod.outlook.com (2603:10a6:102:1da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 2 Jul
 2021 09:31:18 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:0:cafe::38) by AM4PR05CA0022.outlook.office365.com
 (2603:10a6:205::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Fri, 2 Jul 2021 09:31:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 09:31:17 +0000
Received: ("Tessian outbound 80741586f868:v97");
 Fri, 02 Jul 2021 09:31:17 +0000
Received: from bc0f1798548d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 68A4D265-0723-4ECC-9A55-98121966B23C.1; 
 Fri, 02 Jul 2021 09:30:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc0f1798548d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Jul 2021 09:30:39 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5866.eurprd08.prod.outlook.com (2603:10a6:102:85::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 09:30:30 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%7]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 09:30:30 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 09:30:29 +0000
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
X-Inumbo-ID: 18c9b473-f96f-42f0-87e2-392c2b5709c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afZC5+m0/GvuAmPp0xHyVWxSco3LvhffrIB4q/FSOh8=;
 b=K+y8FldURuIGqC3iYIwubf4Om2Du1QiQVNAUYgbqiB2njaykVtrfGA5tqqWMb60nkTo/pQQ9/leJ9N/VT6DtdrIDelSX3gMMJXB5JL8r0nulPvJNyzkGEKpIxXsMuMfskk138yBFyQYqfls+C39O1KXuffmsYoOPmd9H9XdHIeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7c573d22bb97714
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nqr1SwRXFlxau1MXEPGw+/kHHLsKeEZIAhlDzrfHqhrWeUuW+Z4jc1HEPiLnPK0GEOOzbkYWauI5ET153HIXfRl19r4W9gKygPPBgA646n72Xshif56rhaUPDrMtQVu9w78tYNkyQw9pILR6PQtsFGorZqT6fsaEFHd4iM5ebyyggC0PW0YuCVlpOsOH5e68KWkMecQa5JVH4yD+ML9aTNhS6XchXgkKdlb9fzvaIm7T4m/b7tQPXkPN6k87MHiz+s7szj3gznqlTCaihz1i48bU3fXFKwEF/nXbuaSW7ZfF5Di/rED1FFigK7noJKOhYg9pSNxv6v9j1NXUU+Mz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afZC5+m0/GvuAmPp0xHyVWxSco3LvhffrIB4q/FSOh8=;
 b=RNIBMnT4ahWJSgVNSI6QU70oX+bR2X2NKAVPc58svowFUgrySmHllZKjSnaedcAT6JSgriDgxYXqHsBpP/owEKCgdVbMzrFBo+VSvQVgLn10iorh6DUT9QkYsaQ+16kqtcctlrS7hFL7bT1uFx9sr4k763pMCo5KksQCWb2f6TaVD2bFmZTxtRprefSB+22tn7StuqxKWqv+hbdkioNi/vBURysh0vTkmSNjEXdVq9t5smeXTAccMdPeBpbFeNL+zgPNngEb3NH2QfMThNMe+LfVfRk11fPYD2tpdF5zRy84rQUsjesadRIL3vUHiCLnpacdMrf/YElviRyL91P4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afZC5+m0/GvuAmPp0xHyVWxSco3LvhffrIB4q/FSOh8=;
 b=K+y8FldURuIGqC3iYIwubf4Om2Du1QiQVNAUYgbqiB2njaykVtrfGA5tqqWMb60nkTo/pQQ9/leJ9N/VT6DtdrIDelSX3gMMJXB5JL8r0nulPvJNyzkGEKpIxXsMuMfskk138yBFyQYqfls+C39O1KXuffmsYoOPmd9H9XdHIeQ=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 7/9] docs: Change Makefile and sphinx configuration for
 doxygen
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2107011037580.9437@sstabellini-ThinkPad-T480s>
Date: Fri, 2 Jul 2021 10:30:23 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7C3269F1-3C61-4F39-82F9-9DE4C563849B@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
 <20210510084105.17108-8-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2106231506040.24906@sstabellini-ThinkPad-T480s>
 <1FC1E8DF-8AED-4ABD-BE9A-DBBD9D66EDBB@arm.com>
 <alpine.DEB.2.21.2107011037580.9437@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db3f9d5b-1269-44d7-ce11-08d93d3c250e
X-MS-TrafficTypeDiagnostic: PR3PR08MB5866:|PAXPR08MB6955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB69554580522BA77243741AA9E41F9@PAXPR08MB6955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YCRIufPq1sbx7UI19GfoxIjo1SlxgrYbFQ5rfa3oOZw4zBT3Qoh7TEW8xhga1YFq+Rmr/OyoHgyacCe15ZRKSreO9GDOb8nT3wvzLjOTeIiaNLwRZQ4U3d7bM7BqE92zCqnklhecclldsXvAK5fbvQ4WJAnau5geTLopjkUXhs+rfFy9IQb3KGR01V4e+8A9M/e9aCYXCIFjcIPlLaQKuOm6K4WV4znzotgr6iHX2KctUF38ba6VkyjV6ZEXwp5OL3dSHbzOFT/cYBGNc/0kIngy+jFqejc9v2Fd6GriQo12fcVHfn0AYKe6MFlx5rQdhBFMeW2s/+ru0+PoS8BVS5+vpcoB/Jf1JPbslri/3TXl5hvrjUHTC0nZFdXDId5grjjbpIOMONodDMSs0IL9sDWcCd9ROGc/kDPnqW/5qYIW1rRz/LKWrPxkPq2fxZERMC5IjPK0WcYynpE5vqWH3XNdhH/OCu3BM+0g88YCECH6+dg7oOpjz76LWbsXva2mqjbE7GoaWrHLm9NFMmdMovF0u/41VlVcGHEZMjUCfB/JOKo0wACvespH4M3fkSBFIp+RLdrARTnWaKGwGC9IN57xURWmL75YYb/dFdfcp7XQS8xra8s5damxxx3n9vU5ljW2SxlIig8KwcCxyXcC8SMJMwIk/NFd9+tj+fMG+J4IpuiwEumKAiz0VX5psoexxPENfgDECNdEfS8Pt790x+LkUki8iitAY8Pp4GSGl90=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(26005)(2616005)(53546011)(16526019)(83380400001)(6486002)(186003)(38100700002)(2906002)(66476007)(66946007)(8676002)(44832011)(66556008)(52116002)(956004)(6512007)(5660300002)(478600001)(38350700002)(30864003)(6506007)(54906003)(6916009)(86362001)(4326008)(8936002)(36756003)(33656002)(316002)(6666004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TkpCbzgrUlVYUzJMU1VOOEdWZ0Z2ejF2R0ZYK3JGQ0VkWGpSV3JmUEhrbVdj?=
 =?utf-8?B?K1lPZW84WXZVMDc1TlBSWGxMVW5QemJSRStRaG14cXhZeUJGWjl4R3pOajU2?=
 =?utf-8?B?VEtCSjNRYTRKenhpcVFhdUxqOTIzbml1VEZYb2JySHpjb05oWVZwb0hmZTB5?=
 =?utf-8?B?VFRmeXhMMjJkRWNldUE4SkdhSE5lR05kNGJBQUxmOGZUL3IvWkFWN0ZuVzhX?=
 =?utf-8?B?SUNJUW1NZm9wcUN2QlZ3bnRjZ1RwSmg1VUZzanNkRkZYQkppTzIySDArZzg5?=
 =?utf-8?B?eHM4NGRDTUxlMzhCTEZEeksrSnZkMDhTUHZSRnBya2c4d2xwMkUyUC8vYjdU?=
 =?utf-8?B?cUJIb0RSeTNWY0Y4eWkvTUhhYkQzVEdBbEtRanNRYVhmUTZicmxsU3pySVE5?=
 =?utf-8?B?OWxhRFFXakk3ZHlETmpSbjNOVWlaQi9WZGdnVy95TG5EMHd0emptdXBuVUVh?=
 =?utf-8?B?akZZczRURmMxYXFlb3VKazA1aEMrRlNWYi92VU5mb3JVWFVCTWFuY1dhU0NP?=
 =?utf-8?B?ZmpOYm9HQ0R1K1Z0N3BLbE5jZHBxOFp0KzQyY2NhRVV6Z1BQOUxuM2xZNE9F?=
 =?utf-8?B?WUJoWkpIZGVMa3o3clBqaTVGbmRSVFBNWTU0N3oxS3RQQTRGN2JhVGo5U295?=
 =?utf-8?B?Y3E3ZVJuYjZlSUNJR0RlL3FLZmN1UVJzQVZGZEsxMXA2aGVXeDBOM0hDU25r?=
 =?utf-8?B?bksydWlCYVdzbjd5R085dDJIYWR5TjVBS0xpTEUvRmE5QlNsczh3VnhrVEp1?=
 =?utf-8?B?VU9WZUJOL0xuNUZZSzVpekd4YUxGUVR4c3JDNXBUK2ZrY1NvaS9CTEx0ZWhQ?=
 =?utf-8?B?MUFCUTV0REJKTTJPeHNKQ0IyZnV0dFR1LzlTMTRZWXlZQzByZzZIT2RGOFBM?=
 =?utf-8?B?S0xhSllZbnJwYllkY3pxTHZCQUVpQXNoWDczYkR0a1hhSjRWUFM1ZFNMVXd6?=
 =?utf-8?B?cEZxUEJCcTBOQlQwU0RuSEtQaEhBdllkNkNicllUY3ZPM08wT0dvNWI3NzVG?=
 =?utf-8?B?NGRkY3c4a3VlbVg4eFhUc1MxWVcvc2R0MjNWTHRFWDFNa2ovWmxwU1RlclJL?=
 =?utf-8?B?QU1PNFBVY25FNXAwS21vMWd0UUFmeHltMUg0Zk9mQTJ0Z0txcTQ4dmFCcy9p?=
 =?utf-8?B?eXF2OTBid2pLWXNTNWVmZUFXVGNZNy9LeDV3ejdHMDM4SCsvaHVoMEJSbjlT?=
 =?utf-8?B?T1BvUjgyckRkL1JtaTJPWGpGSm1pc1dZRE0vMEtWL2k0aytKTU0xNGwwbXlR?=
 =?utf-8?B?b1IzdFYzRmhiMEkwWURZVERNcVpTMDN1ZlB6WjNxZENZTkRCSjlMMSswempI?=
 =?utf-8?B?S1JpSjRwWFdnb0E3a2ZrVkthdTc0b1o5OWRaSzVBTXJuUGJxd3BPNkZIU2R1?=
 =?utf-8?B?NGdJRjdjVTBZU1FKTThXWXBPLzZEVGhwME9sZGhtc1ByWkxZS3ppN0szaTVE?=
 =?utf-8?B?WEdQb3FRNFRNMUdkZVJJQm1iVXVPeno1OTM2MzVtajQrTC8xbzBVRHkwenpC?=
 =?utf-8?B?MHNCc3pKbzFuU0F0VnJsU1ptTFI4MVNDUUorRm5BeTZETnpkNlJieldac0wz?=
 =?utf-8?B?VDNvNC84NlRaTklUcWlwcDE4RnNiaHhkODJvYWpVT2Z3Mk9UWm5UdnBBbkRC?=
 =?utf-8?B?eUFLM292bzhXOXVJclZiZEpmbFVjUThHRHhtdHJDcmpEN002ZXd3aitzWFpt?=
 =?utf-8?B?Ly8vajRGVTJVc29sMThUbXNpV1cxR2I2dkVDcVJGTDVpTTJPdFErR0FHRS9t?=
 =?utf-8?Q?ypkmD3k751ZJCAQRvdrcIUD7MJkCW/H6vz2lrli?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5866
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f38b49f-1ab9-4441-bc3b-08d93d3c0840
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yO+BJL5dldzcMznlFRlymTfvKTmr3zLujwX+Qv5DsSMgEXJwVQycydtD0YqpcvlJhetbrt27CUzteC8MReStj3c3B/qqyzuknZDGKjUsFWKrOu1fEo1+f79WOT0j7kb4uRC0fQpoQY9tbem2VjfTQuMmQS/p/TKgqm6BPfuSOom95AgLnJ2LsKT/X2a6+SrM/iVjE0Rfbs9nE7jImRQ6qk4HMZy4VFSwekVq/SVWmd1BuuqfEKBnMmJJiN+N5KxqZvjd8KeIthl/r/+Q5XUvKdihGFKOcHInYTAIsGjTX6DC0qY9th/dHsgD9vTqTLDLdBAuqGvHkQC4J45u3+OvU6J+EV86DVdLtBFLV7G/0AYLOepfERgqrRz/pk4SCLAWcqPmIc+Mlpf/hG720lTlPaLkDXn+b+xEXft3C3QBPKVrohUa22n+TpGTlALQfN66mGNKYVcrXbttYotapL64KMzE7w60mzlRxZlH/wQz7XeU9g9ELGwazLAJCrhSQyMs8L7vCbJB7xMDg1HIZ5lpgZZEGQn+h2/JPMt8g7WHYFhKkCYmkxfnB+8LuEx53I9UwVGoQOvi3XUXiJQYeKrmTVpZ8mOQuuIQhdtnMzL3jLzhPq+xWzLykw6h0e5JRJ11h5lH4Wp1H+aT8jvHUONCuwybYqqDyLAu8J6ZhcM1U+e2/gzpjV4R5MhETA7GLmNQDs6zTw3dx6Fz23TbqxeAvw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966006)(36840700001)(478600001)(186003)(70586007)(26005)(956004)(6512007)(33656002)(8676002)(30864003)(70206006)(82310400003)(316002)(36860700001)(16526019)(6862004)(54906003)(6486002)(5660300002)(356005)(4326008)(81166007)(83380400001)(6666004)(47076005)(8936002)(86362001)(336012)(82740400003)(53546011)(44832011)(2616005)(2906002)(36756003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 09:31:17.7075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db3f9d5b-1269-44d7-ce11-08d93d3c250e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6955

Hi Stefano,


> On 1 Jul 2021, at 18:43, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 1 Jul 2021, Luca Fancellu wrote:
>>> On 24 Jun 2021, at 00:33, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> On Mon, 10 May 2021, Luca Fancellu wrote:
>>>> Modify docs/Makefile to call doxygen and generate sphinx
>>>> html documentation given the doxygen XML output.
>>>>=20
>>>> Modify docs/conf.py sphinx configuration file to setup
>>>> the breathe extension that works as bridge between
>>>> sphinx and doxygen.
>>>>=20
>>>> Add some files to the .gitignore to ignore some
>>>> generated files for doxygen.
>>>>=20
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>> .gitignore    |  6 ++++++
>>>> docs/Makefile | 42 +++++++++++++++++++++++++++++++++++++++---
>>>> docs/conf.py  | 48 +++++++++++++++++++++++++++++++++++++++++++++---
>>>> 3 files changed, 90 insertions(+), 6 deletions(-)
>>>>=20
>>>> diff --git a/.gitignore b/.gitignore
>>>> index 1c2fa1530b..d271e0ce6a 100644
>>>> --- a/.gitignore
>>>> +++ b/.gitignore
>>>> @@ -58,6 +58,12 @@ docs/man7/
>>>> docs/man8/
>>>> docs/pdf/
>>>> docs/txt/
>>>> +docs/doxygen-output
>>>> +docs/sphinx
>>>> +docs/xen.doxyfile
>>>> +docs/xen.doxyfile.tmp
>>>> +docs/xen-doxygen/doxygen_include.h
>>>> +docs/xen-doxygen/doxygen_include.h.tmp
>>>> extras/mini-os*
>>>> install/*
>>>> stubdom/*-minios-config.mk
>>>> diff --git a/docs/Makefile b/docs/Makefile
>>>> index 8de1efb6f5..2f784c36ce 100644
>>>> --- a/docs/Makefile
>>>> +++ b/docs/Makefile
>>>> @@ -17,6 +17,18 @@ TXTSRC-y :=3D $(sort $(shell find misc -name '*.txt=
' -print))
>>>>=20
>>>> PANDOCSRC-y :=3D $(sort $(shell find designs/ features/ misc/ process/=
 specs/ \( -name '*.pandoc' -o -name '*.md' \) -print))
>>>>=20
>>>> +# Directory in which the doxygen documentation is created
>>>> +# This must be kept in sync with breathe_projects value in conf.py
>>>> +DOXYGEN_OUTPUT =3D doxygen-output
>>>> +
>>>> +# Doxygen input headers from xen-doxygen/doxy_input.list file
>>>> +DOXY_LIST_SOURCES !=3D cat "xen-doxygen/doxy_input.list"
>>>> +DOXY_LIST_SOURCES :=3D $(realpath $(addprefix $(XEN_ROOT)/,$(DOXY_LIS=
T_SOURCES)))
>>=20
>> Hi Stefano,
>>=20
>>>=20
>>> I cannot find exactly who is populating doxy_input.list. I can see it i=
s
>>> empty in patch #6. Does it get populated during the build?
>>=20
>> doxy_input.list is the only file that should be modified by the develope=
r when he/she wants to add documentation
>> for a new file to be parsed by Doxygen, in my patch about documenting gr=
ant_tables.h you can see I add
>> there the path =E2=80=9Cxen/include/public/grant_table.h"
>=20
> OK, thanks. I missed that addition.
>=20
>=20
>>>=20
>>>> +DOXY_DEPS :=3D xen.doxyfile \
>>>> +			 xen-doxygen/mainpage.md \
>>>> +			 xen-doxygen/doxygen_include.h
>>>> +
>>>> # Documentation targets
>>>> $(foreach i,$(MAN_SECTIONS), \
>>>>  $(eval DOC_MAN$(i) :=3D $(patsubst man/%.$(i),man$(i)/%.$(i), \
>>>> @@ -46,8 +58,28 @@ all: build
>>>> build: html txt pdf man-pages figs
>>>>=20
>>>> .PHONY: sphinx-html
>>>> -sphinx-html:
>>>> -	sphinx-build -b html . sphinx/html
>>>> +sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
>>>> +ifneq ($(SPHINXBUILD),no)
>>>=20
>>> This check on SPHINXBUILD is new, it wasn't there before. Why do we nee=
d
>>> it now? We are not really changing anything in regards to Sphinx, just
>>> adding Doxygen support. Or was it a mistake that it was missing even
>>> before this patch?
>>=20
>> Yes this is new, I saw that we didn=E2=80=99t look if sphinx was install=
ed in the system, so now we did
>=20
> In that case, I think anything related to SPHINXBUILD and whether sphinx
> is installed or not, should be a separate patch at the beginning of the
> series. It could be committed independently before the rest of the
> series. When we get to this patch, SPHINXBUILD should be already there.

I=E2=80=99ve introduced SPHINXBUILD in this patch: [PATCH v6 5/9] docs: add=
 checks to configure for sphinx and doxygen,
In your commend do you mean that you would like it to be outside this serie=
 and this serie to be based on top of that one?


>=20
>=20
>>>> +	$(DOXYGEN) xen.doxyfile
>>>> +	XEN_ROOT=3D$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/h=
tml
>>>> +else
>>>> +	@echo "Sphinx is not installed; skipping sphinx-html documentation."
>>>> +endif
>>>> +
>>>> +xen.doxyfile: xen.doxyfile.in xen-doxygen/doxy_input.list
>>>> +	@echo "Generating $@"
>>>> +	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< \
>>>> +		| sed -e "s,@DOXY_OUT@,$(DOXYGEN_OUTPUT),g" > $@.tmp
>>>> +	@$(foreach inc,\
>>>> +		$(DOXY_LIST_SOURCES),\
>>>> +		echo "INPUT +=3D \"$(inc)\"" >> $@.tmp; \
>>>> +	)
>>>> +	mv $@.tmp $@
>>>> +
>>>> +xen-doxygen/doxygen_include.h: xen-doxygen/doxygen_include.h.in
>>>> +	@echo "Generating $@"
>>>> +	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< > $@.tmp
>>>> +	@mv $@.tmp $@
>>>=20
>>> Is the absolute path required? If not, we can probably get rid of this
>>> generation step and simply have the relative path in
>>> xen-doxygen/doxygen_include.h. I think this could apply to
>>> xen.doxyfile.in above.
>>=20
>> Unfortunately yes, the doxygen_include.h is a file that is included in e=
very documented header before=20
>> starting the doxygen parser, since we don=E2=80=99t have all the headers=
 in one path, it is impossible to have here
>> a relative path that is good for every header in Xen.
>=20
> OK :-/
>=20
>=20
>>>=20
>>>=20
>>>> .PHONY: html
>>>> html: $(DOC_HTML) html/index.html
>>>> @@ -71,7 +103,11 @@ clean: clean-man-pages
>>>> 	$(MAKE) -C figs clean
>>>> 	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
>>>> 	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
>>>> -	rm -rf html txt pdf sphinx/html
>>>> +	rm -rf html txt pdf sphinx $(DOXYGEN_OUTPUT)
>>>> +	rm -f xen.doxyfile
>>>> +	rm -f xen.doxyfile.tmp
>>>> +	rm -f xen-doxygen/doxygen_include.h
>>>> +	rm -f xen-doxygen/doxygen_include.h.tmp
>>>>=20
>>>> .PHONY: distclean
>>>> distclean: clean
>>>> diff --git a/docs/conf.py b/docs/conf.py
>>>> index 50e41501db..a48de42331 100644
>>>> --- a/docs/conf.py
>>>> +++ b/docs/conf.py
>>>> @@ -13,13 +13,17 @@
>>>> # add these directories to sys.path here. If the directory is relative=
 to the
>>>> # documentation root, use os.path.abspath to make it absolute, like sh=
own here.
>>>> #
>>>> -# import os
>>>> -# import sys
>>>> +import os
>>>> +import sys
>>>> # sys.path.insert(0, os.path.abspath('.'))
>>>>=20
>>>>=20
>>>> # -- Project information ---------------------------------------------=
--------
>>>>=20
>>>> +if "XEN_ROOT" not in os.environ:
>>>> +    sys.exit("$XEN_ROOT environment variable undefined.")
>>>> +XEN_ROOT =3D os.path.abspath(os.environ["XEN_ROOT"])
>>>> +
>>>> project =3D u'Xen'
>>>> copyright =3D u'2019, The Xen development community'
>>>> author =3D u'The Xen development community'
>>>> @@ -35,6 +39,7 @@ try:
>>>>            xen_subver =3D line.split(u"=3D")[1].strip()
>>>>        elif line.startswith(u"export XEN_EXTRAVERSION"):
>>>>            xen_extra =3D line.split(u"=3D")[1].split(u"$", 1)[0].strip=
()
>>>> +
>>>=20
>>> spurious change?
>>=20
>> I think I=E2=80=99ve intentionally added a new line to separate the code=
 from the except: below,
>> but if it is a problem I can remove it
>=20
> Better to remove it or to move it to a separate patch

Sure I=E2=80=99ll fix it

>=20
>=20
>>>=20
>>>> except:
>>>>    pass
>>>> finally:
>>>> @@ -44,6 +49,15 @@ finally:
>>>>    else:
>>>>        version =3D release =3D u"unknown version"
>>>>=20
>>>> +try:
>>>> +    xen_doxygen_output =3D None
>>>> +
>>>> +    for line in open(u"Makefile"):
>>>> +        if line.startswith(u"DOXYGEN_OUTPUT"):
>>>> +                xen_doxygen_output =3D line.split(u"=3D")[1].strip()
>>>> +except:
>>>> +    sys.exit("DOXYGEN_OUTPUT variable undefined.")
>>>=20
>>> This is a bit strange: isn't there a better way to get the
>>> DOXYGEN_OUTPUT variable than reading the Makefile?
>>>=20
>>> At that point I think it would be better to define DOXYGEN_OUTPUT a
>>> second time in conf.py. But maybe it could be passed as an evironmental
>>> variable?
>>=20
>> Yes we could pass it as an environment variable as we do with XEN_ROOT,
>> I will fix it in a next release.
>=20
> Great
>=20
>=20
>=20
>>>=20
>>>> # -- General configuration -------------------------------------------=
--------
>>>>=20
>>>> # If your documentation needs a minimal Sphinx version, state it here.
>>>> @@ -53,7 +67,8 @@ needs_sphinx =3D '1.4'
>>>> # Add any Sphinx extension module names here, as strings. They can be
>>>> # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
>>>> # ones.
>>>> -extensions =3D []
>>>> +# breathe -> extension that integrates doxygen xml output with sphinx
>>>> +extensions =3D ['breathe']
>>>>=20
>>>> # Add any paths that contain templates here, relative to this director=
y.
>>>> templates_path =3D ['_templates']
>>>> @@ -175,6 +190,33 @@ texinfo_documents =3D [
>>>>     'Miscellaneous'),
>>>> ]
>>>>=20
>>>> +# -- Options for Breathe extension ----------------------------------=
---------
>>>> +
>>>> +breathe_projects =3D {
>>>> +    "Xen": "{}/docs/{}/xml".format(XEN_ROOT, xen_doxygen_output)
>>>> +}
>>>> +breathe_default_project =3D "Xen"
>>>> +
>>>> +breathe_domain_by_extension =3D {
>>>> +    "h": "c",
>>>> +    "c": "c",
>>>> +}
>>>> +breathe_separate_member_pages =3D True
>>>> +breathe_show_enumvalue_initializer =3D True
>>>> +breathe_show_define_initializer =3D True
>>>> +
>>>> +# Qualifiers to a function are causing Sphihx/Breathe to warn about
>>>> +# Error when parsing function declaration and more.  This is a list
>>>> +# of strings that the parser additionally should accept as
>>>> +# attributes.
>>>> +cpp_id_attributes =3D [
>>>> +    '__syscall', '__deprecated', '__may_alias',
>>>> +    '__used', '__unused', '__weak',
>>>> +    '__DEPRECATED_MACRO', 'FUNC_NORETURN',
>>>> +    '__subsystem',
>>>=20
>>> Should we also have any of following:
>>>=20
>>> __packed
>>> __init
>>> __attribute__
>>> __aligned__
>>>=20
>>> in the list? In any case, we don't have to add them right now, we could
>>> add them later as we expand Doxygen coverage if they become needed.
>>=20
>> Sure it is possible, I can add them now since I have to push a fix for t=
his patch
>> If you want.
>=20
> I would add them now even if they are not strictly required to parse the
> public headers. But this is the kind of thing where others might have a
> different opinion.

Ok I will add them now if no one object to that.

Cheers,

Luca



