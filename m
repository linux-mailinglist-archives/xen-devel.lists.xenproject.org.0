Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB0356D0C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 15:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106655.203931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU834-0000dj-SD; Wed, 07 Apr 2021 13:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106655.203931; Wed, 07 Apr 2021 13:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU834-0000dJ-N9; Wed, 07 Apr 2021 13:16:46 +0000
Received: by outflank-mailman (input) for mailman id 106655;
 Wed, 07 Apr 2021 13:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uIxC=JE=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lU832-0000cw-RQ
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 13:16:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d56cca41-5fd1-4df0-8c92-b2a87cd64b04;
 Wed, 07 Apr 2021 13:16:42 +0000 (UTC)
Received: from DB8PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:10:110::32)
 by PAXPR08MB6927.eurprd08.prod.outlook.com (2603:10a6:102:133::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 13:16:40 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::e3) by DB8PR04CA0022.outlook.office365.com
 (2603:10a6:10:110::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 13:16:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 13:16:40 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Wed, 07 Apr 2021 13:16:40 +0000
Received: from ba22a357c451.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 150B7C5B-F7DB-4821-88C3-5B70CB0B8AD9.1; 
 Wed, 07 Apr 2021 13:16:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba22a357c451.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 13:16:33 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3549.eurprd08.prod.outlook.com (2603:10a6:803:89::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 13:16:23 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 13:16:23 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0398.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 13:16:22 +0000
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
X-Inumbo-ID: d56cca41-5fd1-4df0-8c92-b2a87cd64b04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9fjCGMSbJoeByJce2V5STGBfy/TAZ/Mj3SIxLM0oHM=;
 b=WLBqKZsvScJCubEfp7YK6sCUjxE20XqYh2H8934Fl88F5iTNgzb3d7pjNe2k9nI1IXeAbv9ivh5y9GhMXfdMI0kLioEChflgRuOE2HNi69kAkA4L0ONCMq6JEtcw6+6lLlczl/5C1ZxhfjCIhXEyoOerbJnGK3BQQyGHQhE49j8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 908f78475a53c17a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D42hGDL/4TLogCcIo4n2Q4+PeS8OhXsccPVrkOOvAgfwhjMHtd8cFh57FoeXbxgO2h5qlz67iiZ4C+CYsULdsnHXsOwoxa8OZpCpo2KXWgJkEvxLsrrZg7WpIIzkgnj+tJN5xfWvOCL6euj2VGxah1m6yFAOk/HsIFT9vmudUIQiiFSzCSPiWYHck2t4NjXtB1K8qc/bLaeTeK6KORqvUYyoeczCvAtuGNdHybvM0z7bKRiV57CDlP6YsgjvVWj63wgUDkwPIm9sqrezJvdXw/m4gULlKvo8MdtmqYH8vXd6jIJzBNCMa5g3+eqSj8dm7LZjt16RKNAalGD6ybPgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9fjCGMSbJoeByJce2V5STGBfy/TAZ/Mj3SIxLM0oHM=;
 b=bbTf3h2ruVPFSwrSPGojjpRSjD4pjfduhoQD49mtO1FeHheGitTAiH+VnNWDbuh9eAl7U3o31yWczSS0JCcp+7F10JUz21+45Nh3x8dzEAATGTs4ELpSVulvkBdkEPkYgM7hG1AZgu0e1hFyR4oPSdA6rOiwNxGxgycxVHihYGvJdfmH8jj7HSKIm8KEE0RxN6F5AOJQ51fIb0U5dASEPF69RQhum5iOnBqUcIqZytTyIFAUcguxoezZZfTA/gPic9ARSd6Ni6kdYXHw61b2pMJPjy2GadzlyepSvUKqOl/9+/BcK/F7l9cY8XRDfpqTQo6ZzC0NQ51TTjeqfjJXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9fjCGMSbJoeByJce2V5STGBfy/TAZ/Mj3SIxLM0oHM=;
 b=WLBqKZsvScJCubEfp7YK6sCUjxE20XqYh2H8934Fl88F5iTNgzb3d7pjNe2k9nI1IXeAbv9ivh5y9GhMXfdMI0kLioEChflgRuOE2HNi69kAkA4L0ONCMq6JEtcw6+6lLlczl/5C1ZxhfjCIhXEyoOerbJnGK3BQQyGHQhE49j8=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 0/3] Use Doxygen and sphinx for html documentation
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <fe2480f4-954f-3929-be81-5905917275d1@xen.org>
Date: Wed, 7 Apr 2021 14:16:11 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <95D5306B-7F1E-4E3A-8681-A94A267C7945@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <fe2480f4-954f-3929-be81-5905917275d1@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0398.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::26) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 474a6ab1-939c-48a0-24d5-08d8f9c7616e
X-MS-TrafficTypeDiagnostic: VI1PR08MB3549:|PAXPR08MB6927:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB69272387E921D0125DCC86A7E4759@PAXPR08MB6927.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wsxOt/pVBmmsKEccqjMUVcvK5O8X7796pYnWxqe3iZiRQHl1qTNqH0c10bp/up7L37tWzp1kko2F+0aGwJgfB3J4I3bkTqc35+y5v72akPJijxpOzgbuqVAYZQPd6PvVpl6xzBycn6ojJFW71CtdmeTTzischUQWQQnWNWqA4zQZjHcK+oJmHlACFj0+GK2+NQXGkop4PiqxwJ5DnqvkwW5mf85uxD0LRrDuSObJsmIRsN1YtsjvVRuNUgz44twXCGOv/J+NsnfJKqlSnXr9vcij7jp/PWQnWy6qim/88fcGPfDjyIc8zHpp6N+mUlYcfApQPNNnWFq/WtTHYqX2s9uKknqRCdXtTrw67Bmo3+LujFZapnpeLYaf9sEHx6YcWmTHR2eK1DGlaoIkJOFGDhAgC/K/eLHN4zuJSrqt0IIhECFta6cNdoUBUBoJNjTYtF49ru4eM+afZ9EfbVlsRBhes1AvyFp3Uf8sCWCtTSKocEIjyqey3CHvpW+n83z6kOfPIlaRc7ZZ0x0wMn5cWa3jIbyYAl1deBc+lXRpv2t10op198QmkPaKPz6T1G9GUURmts5DznaHSgTfbffChYG4DcKZ/hlOYBwiebXcx+7xUuBBITzmET8so3tnkU2ZTX6QDxVZepc28YNabsiickQoTudefsWw8Fu3v2kTLDKeptbQeNZmP0QOasGVJVlasSYAM3Egih1JJAxTK3kDXXFyEonyH0qkzGisJF5D7S0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(956004)(52116002)(2616005)(66476007)(66556008)(4326008)(6486002)(53546011)(6666004)(7696005)(186003)(16526019)(83380400001)(26005)(66946007)(5660300002)(38100700001)(8936002)(86362001)(8676002)(33656002)(478600001)(54906003)(2906002)(44832011)(38350700001)(36756003)(316002)(6916009)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?Z0FMaUhJQkRRd3NMdDAvZG54WnR0RjA2STVTakp1d0FFc09BSG1NNk04RUox?=
 =?utf-8?B?VjFPd0ZtalRvMm5PN2ZrZGtDaEhoRjdaMDRnZUtEQURNYVlqYlM3bWY1WElw?=
 =?utf-8?B?RGJZMHgxam90Y3Y4L2pWMFFwc1F2N0dhSkRGWGNRT0k0RWhqbVV0YTk3ZUo5?=
 =?utf-8?B?THgwL0NOS0lPMDhuTHJGdFNFaWdLQnZWWDBxWjhvbUpLWkNYdDBiQ0VYemZl?=
 =?utf-8?B?Z1h6NXoxemZYM29WZzV6R2RJeFlyM0dWUElBVzV5Nzlod0RDYTVnTC8rVzRo?=
 =?utf-8?B?WE04Y1BOS1FlbWJJSkF2M3QzajRobWxPWHZoKzVuajRzZmlyb0Q1MlVEdk8r?=
 =?utf-8?B?ay9rdDlYUFRDTjFXd0NRbmlIODZ4VlhoMUdVWWphSG1vUjlGZnEwT3E1SkVZ?=
 =?utf-8?B?eHVoRG5lMWF5WHRwU0hOM1owbDJMYVJ6d1J5RVZHTFNDKytPb01ZZmEwTWJT?=
 =?utf-8?B?eEtUUWtRM2xYbCtKS3NTdjNPMURpcE82TTRyd1FwZFg4eWNOeFpiMk1NQVNz?=
 =?utf-8?B?V1VSakE4ZzVodjBiaE91NGZkU0FHT0wxbit4YS9xbTFQRzJuTSs1dmFWc2lI?=
 =?utf-8?B?WUdHUno3UzEwOWpaOEp2Q0xqZklRM1pzYmh3bHc5bTdJajNZTkxTclVhK29C?=
 =?utf-8?B?c2VKVGNuRkpDcS9XL25oczFLc21aOG9wQ2pTTVBhV2VHcGtRdVRTL2dEQXBK?=
 =?utf-8?B?VktNSk9OZ3RmeTZ4OGJYYzdTY1BjbVY0cWpqREhMa1FudW81T1VsMzR4a2k0?=
 =?utf-8?B?T3J5Sk8vZHY0MlMvVTN5clFDL3hNRmpqQXp5dnFGWmdZdm50NHNFOTllajRK?=
 =?utf-8?B?VlJXaU12eENrQUV0d0NUSzQ4YTBuVWVjL2VETENFOTlMQ0paa2RyMVh4Y0Rh?=
 =?utf-8?B?ODZTWnM5ckg1QWtXR1puUXZXaHZ2dHNDNkJpV1dnU3hqbkFhaVFrSFBOMFFv?=
 =?utf-8?B?a2Jac2lnRHJmR0pqTXhQUGZjWjM3dE9KODZQZHoycE1Qem1nNTBzRGpBWUQx?=
 =?utf-8?B?b2N5VHhvQWg0b0pFNVpWMzMrTW1PMjhFbFVQWDQ1ZHFoVHBsbnNmS0RhTkRX?=
 =?utf-8?B?QXpsenVDUXN5Y2tQWXJxWVZJV2tuQ3I5RnE5UlpYdUk5NmhycC9kdE1VSnNu?=
 =?utf-8?B?QjhNMldhd3RpTENVdDZVTlNyb25VN2kzcFZnQUtyWEl5RzN2YkxUQmUwZEV5?=
 =?utf-8?B?OHY4SkZoVjkrTGtOWk80aEpOZ0hZK24rUk5IKzFUUkd6NUVsSkhoRThZYzl3?=
 =?utf-8?B?RjQzYmJyYnEzVi85WElWSlZLOCtmSEV1VEZNZEVnUkhzVk02Rkdlb1hRNE5R?=
 =?utf-8?B?ZTZEU1dmT1hVM3NpSmlnTXd5bGRsNGJRS0hhRGg3ellDdDV2RW4zRUEvZDRt?=
 =?utf-8?B?cHRzK1R4cDRjMndORjNONEJ3THRzYWNnS0Z6ZDhRNjRML2lqUllXN0x0SG1n?=
 =?utf-8?B?Vk5VaFQrVUJMOEJTSkNxeTl2ZVdOWVJrUEplK3lpSDh2ZUZlUmFZOUkwSVYz?=
 =?utf-8?B?OHNuT2ZFV1AxRVNGc091emxNUThCM0NBQWRENXZ1eGVpZFJnMENUbUJ3MGZl?=
 =?utf-8?B?QVFjSkZMajA2WTh4MGNySWRXbU4wQ3pKSVBRLy9SVU5wdXpSeU5DQ01XTHJ2?=
 =?utf-8?B?R2NQQnR0SU9Idmo0cHFoU2lqeGFzcjVoM2wvYnhJaVRORmpadFliQ0Ixc2Vq?=
 =?utf-8?B?MytKMUVocVVsRC80Wm1VYnpWL2k2dmhJd01tazVVTnlrTEtJbmxWN2NlSmJ4?=
 =?utf-8?Q?6XZDUdJbjhVe1bVwFdJnZRhvSNbcT7vts4eAB4x?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3549
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8b09c63-d528-4ae1-ea51-08d8f9c75723
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AqB4vJ45uIG2OPUVzfm4lZTBfU3CWfGlF0t6x64m+p2MEM6047DQ9+dFVFvoHbFLtfubK8bVR7ifExdapwMoSr98VjiBqKvlxXOvNxPus77lP7pir8lH1ziH7MOu5xNtOLNEyUAGNCmPu8yuJBdYYka6x5FpNZDYlKyVdsWDqTvVKO22sbV1mipTR5kZ28A999I71WuqKyZK8YgMHpe0fPUe78wWwhjZJoJNA7jVV4JeSx7TDwo7mJ0rnCzeUM1rEwNbO2nF/HEeytdnjiz5y5Q0TXFYEwPC0LqOXuEX4UEzwKnaHGCPay+WZKimk/GECzUomwOQFqQR4EM6xAauRRBHYmeiokknjGaAIU2cD3Td3nbrexn4a/OYFqro+FJSTATJH8S3JuHCb3YYc/jz+bwfE8xOMKscwUHzNRjwrzgtspqSpKouzQ1aH0pWCcTqX6+DHJ/COmj6/8McRkghn0uJf/ZZUQeNjvZRNvFOgi7Hubsn3OSNGZ1+NIfb9qZSkmtAJqPOnrFvIgX5zyJ9C3X6SofYOmN3l3KfHr4M1OuCdqf/ubA+VnxDr5GK30qYzD2Kb4SjDXNqnmDW33TJjooX3vJiUjqInz8y/cdkMdWU334VoYrRvDXFxxjluSYQjIjqrmJqdL4T3r/srFpHSDYhz2VhQzuOMLmV8mKcnLY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(47076005)(8936002)(956004)(81166007)(36756003)(82310400003)(2616005)(70586007)(6862004)(8676002)(7696005)(26005)(186003)(16526019)(478600001)(70206006)(6486002)(86362001)(4326008)(33656002)(83380400001)(336012)(6666004)(54906003)(53546011)(44832011)(356005)(5660300002)(82740400003)(36860700001)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 13:16:40.1271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 474a6ab1-939c-48a0-24d5-08d8f9c7616e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6927



> On 7 Apr 2021, at 14:07, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 06/04/2021 11:36, Luca Fancellu wrote:
>> This serie introduce doxygen in the sphinx html docs generation.
>> One benefit is to keep most of the documentation in the source
>> files of xen so that it's more maintainable, on the other hand
>> there are some limitation of doxygen that must be addressed
>> modifying the current codebase (for example doxygen can't parse
>> anonymous structure/union).
>> To reproduce the documentation xen must be compiled because
>> most of the headers are generated on compilation time from
>> the makefiles.
>> Here follows the steps to generate the sphinx html docs, some
>> package may be required on your machine, everything is suggested
>> by the autoconf script.
>> Here I'm building the arm64 docs (the only introduced for now by
>> this serie):
>> ./configure
>> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-gnu=
-" menuconfig
>> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-gnu=
-"
>> make -C docs XEN_TARGET_ARCH=3D"arm64" sphinx-html
>=20
> I have tried this instruction and got:
>=20
> make: Entering directory '/home/ANT.AMAZON.COM/jgrall/works/oss/xen/docs'
> xen.doxyfile
> make: xen.doxyfile: Command not found
> Makefile:67: recipe for target 'sphinx-html' failed
> make: *** [sphinx-html] Error 127
> make: Leaving directory '/home/ANT.AMAZON.COM/jgrall/works/oss/xen/docs'
>=20
> AFAICT, $DOXYGEN will only get defined when sphinx-build is installed.
> When sphinx-build is not installed SPHINXBUILD will be equal to 'no', but=
 the Makefile check for emptiness.
>=20

Hi Julien,

Thank you for spotting it, I=E2=80=99ll fix it in the v2 patch

Cheers,
Luca

> Cheers,
>=20
> --=20
> Julien Grall


