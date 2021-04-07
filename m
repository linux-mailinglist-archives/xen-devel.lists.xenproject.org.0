Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260E356F4F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 16:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106729.204074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9X3-0002Ha-NL; Wed, 07 Apr 2021 14:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106729.204074; Wed, 07 Apr 2021 14:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9X3-0002HB-JW; Wed, 07 Apr 2021 14:51:49 +0000
Received: by outflank-mailman (input) for mailman id 106729;
 Wed, 07 Apr 2021 14:51:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uIxC=JE=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lU9X1-0002H6-Oz
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 14:51:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 519a4b35-b9fc-4beb-a7f1-79b0e94f4b08;
 Wed, 07 Apr 2021 14:51:45 +0000 (UTC)
Received: from DB6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::23) by
 DB8PR08MB3948.eurprd08.prod.outlook.com (2603:10a6:10:a2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Wed, 7 Apr 2021 14:51:42 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::d7) by DB6P191CA0013.outlook.office365.com
 (2603:10a6:6:28::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 14:51:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 14:51:42 +0000
Received: ("Tessian outbound 700fd1fc53d5:v90");
 Wed, 07 Apr 2021 14:51:42 +0000
Received: from 313a3a1eb27a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55FEB56A-334C-48EB-A084-F2F9540C4854.1; 
 Wed, 07 Apr 2021 14:51:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 313a3a1eb27a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 14:51:33 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1950.eurprd08.prod.outlook.com (2603:10a6:800:8c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 14:51:31 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 14:51:31 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0450.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Wed, 7 Apr 2021 14:51:29 +0000
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
X-Inumbo-ID: 519a4b35-b9fc-4beb-a7f1-79b0e94f4b08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxJ3/3H323IN78fGMtreQjjLaorKQOz/SQ5b5vIuZ4s=;
 b=+AIsBrsPTP+pVz7DBT92Ius3A+YAf7/D4AaL479gAghmQU6jYf9GBXOYLqplY7EJwgQOdzR4ki9oTNUDHV9+HkdAgOUBs85TU3qR3pZi3XSw/mR0Pu0V2wSnyMTgDcTbV4/4vrk5nGnIYJ9hyX72zJL9Rh+r0qU8CFr/Me9zaNw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cd011f7e57e5c10
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFEPe8qmr5rWFEObIavs7X8vSrzNeTRByLiRTny3d8uqiF8hzujG55Tmj0J5fCV6XdoFGp2Bcw63ZyvewDVhh9qcHGHxB3wm9qEhk4x8z3QBIb9yetT+uLhPRv8dRI7A1n4/FPgpbw7yfAZegQr71/GhMaW4t5gIho1iqQT3Wx1J34GyFebHhsWqJhr2Vr4Vg1sSyE1idHt7OWcZmPzmj0d3v4MJzVoVta6wU5LtOvlJ02khATmyvmfXHw+HhsWOozH6Gu1phmV4I+iwVQkqM/rJnro7e8FproXZFPlgzrguotSeAWqcYgLV2kC3+ho+/Fn1o44YlxZgLLAEsjoZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxJ3/3H323IN78fGMtreQjjLaorKQOz/SQ5b5vIuZ4s=;
 b=ZsiX2rJP5hnAgCXiIKiwHB4KTQiAfwEYaqT8KipWnpHrx+D7/C6Eow5v7gj7AifOMasaiKXrQN/ROlC/ClQBklAmGtsyLtoKA35wrL1pExqUVm0j41VXJ1lSJTSZJw5HdUYHGxfZNRd1+0mLxNxqM+E3jhMOS9soM/mqmmYdnDO1SxU080k3tdO2sBhDRj0mrop3cY+CoUwQ6O5I5fepqI84HYon4D6VRzq3VJyzoAAiUYnFfGU0GZWCZZWaDlCo+erSHXJ6AdKDNaZwVsA14/MQSXtUEeTIPusWe/0fjtzGHnbbU8rIXum/iLtORMi4W12NdEeUs3UXae0CQm1Gew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxJ3/3H323IN78fGMtreQjjLaorKQOz/SQ5b5vIuZ4s=;
 b=+AIsBrsPTP+pVz7DBT92Ius3A+YAf7/D4AaL479gAghmQU6jYf9GBXOYLqplY7EJwgQOdzR4ki9oTNUDHV9+HkdAgOUBs85TU3qR3pZi3XSw/mR0Pu0V2wSnyMTgDcTbV4/4vrk5nGnIYJ9hyX72zJL9Rh+r0qU8CFr/Me9zaNw=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <b55d2d18-c80c-5596-8ac4-d4d7099708bf@xen.org>
Date: Wed, 7 Apr 2021 15:51:18 +0100
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
Message-Id: <E5D03BC8-6E9E-4579-B2D8-137CC60818B9@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
 <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
 <b55d2d18-c80c-5596-8ac4-d4d7099708bf@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0450.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::30) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64f6f331-5302-4b70-4cd5-08d8f9d4a830
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1950:|DB8PR08MB3948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB3948191024049222B31C5DD3E4759@DB8PR08MB3948.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ab6XmjBTIJpYyd2qJJGn97klHuFa+kWH7o+WUH2CT+KWKjBz9sQ3puTDXV7wI78becnUrpSS3hN7bPs2owBl/wleb10PiBxzVeHSirsaQ5X/rV7BeDSsOJlK4ZpLCyuXn8h7U2ZweD2baEvGxT6wFKGOHOFdSf73RdrkBG47re1LKO2/W0OQ0fNgivH8qpzYnSRoKgBlY0IrvZDuZxUnPidanLgvEsulYxoUrq1oKG8xDhitGgy51LLxVPHVsEG36PFjIoG0VWj2SFexBBI2jq3R0xkDZxUyYJASHWAvxtON/SiGXQTPe3QgFLpH5UEW1RxGx4Y0esZJz91QDSAeDs3xltMRh9ijyoOMs3xZycoMdEqh9ECDN8JMZIOrhN8LYtJv9GZ3UFEzxLU8SOOrt7OMz5Hx1RMaxEatpKnf3h05vZzIKEy/g8iuLMSlLB+1XrALZQ9dVsM5hjtndhb6MJ42REFjxmhBiqwhVZp/gNmB5heo70dUdzkaUWdSGh/8vwWAaAD8RbIKiqyw5qCxXjxarSuFLoeCF/lbv/eIvHtmrwjdVobr0S0bK7AsvMXhsVo42f9T292IpSCHxrw1ku/DWXHe9HfKKFaz3+iIc5nH6HMOqc4YvonPu6dR723lzt4s0AwIs9eqloMe017nUAi2X7qhE8HGv0UFAUIlL1RvvxG1MZ7b9zehBegcUEl7DRIEjBWln1EX7TB79Urd+aAaRXODawsju20T89wILE/bJYpVl4rEoGS1etLRsqdXQSCd3SLw4X/R/wK8uh2DrpHtdmYZIG+xW92vn8k2TM8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(86362001)(38100700001)(6916009)(966005)(52116002)(6666004)(66556008)(54906003)(8936002)(186003)(26005)(478600001)(2906002)(66476007)(316002)(2616005)(5660300002)(16526019)(66946007)(38350700001)(956004)(53546011)(6486002)(8676002)(36756003)(4326008)(83380400001)(33656002)(7696005)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?aVhhMS8zRG5PZGg3U1cvZmxLclp6ajhOY2pLNlBCUHVkMWVXU291S3ZxTVNH?=
 =?utf-8?B?M2Y2dDltMXZkeXVNeXF0L3NvWlowQWRNQXhlSi9rVWd0bFZaTUNKa0JPMVB6?=
 =?utf-8?B?eVF0dmptNXdyWjJUT0tTRCttaGIyTHVTMlBxVEd5NUtWV3RmUU53TitwZ0hJ?=
 =?utf-8?B?c0lWVWtJODZMYi9BS3VEd2dUOUx1NFViUDdCTmVqcS9MUTZMVm5GVXVhcytD?=
 =?utf-8?B?OENOVkJvV3cySTRQZE1NU0F3UytaRjdQUVBtV0YycDlwMDNrMjRxbzdvVWVH?=
 =?utf-8?B?c25kRnhVRlVvYWM0NjIzdit3TGRVS1pLSWh3MVNWbzk5YlBvOThYKzFsbGJ6?=
 =?utf-8?B?VDRUZCtFRFZTY01PNnN2OFo0TllWRGhHN09Hc2JsUXlvKzJBb0E5ZVNEaGgy?=
 =?utf-8?B?a2lRU2NnYXNiVHVJQW1BVlFsM1d6WUNYMVBuTmxlU3kxazE4Z3MrVDZ6aUVj?=
 =?utf-8?B?RTdBTW8xclRrZjErOVlrUFgzM29NUXI3U3ljWCtEbEc4WFJ4alIyaWpHTVZW?=
 =?utf-8?B?SzJrNHVVQVNnQXI3dzYrd0pDeDhYMnMrdm1VTnFPYmFHNkpVbThlWTN6aERx?=
 =?utf-8?B?MElSTS9UQ1hFd3JOV1hIZUVReE53and2UUtVQng2R3pLSWZPUFRMT29TaUFI?=
 =?utf-8?B?MDVyQjZxcDdueUFIY0RSc3kwQlVkMVA0U1V0bFQ4N0M2TU5BbWt3R0JaVUNu?=
 =?utf-8?B?TlRkUEhjMDB5U1JhZG95czdraUZXVjNYMEhXUllQRDZyL2JXdnVYTnYvZDBP?=
 =?utf-8?B?UU80R1RscHIwNU05NFJySGpPQ0RMV1AvbnR4UlNUMWhDU1FVaVVVVExzSjVM?=
 =?utf-8?B?TVI4VDg2YlJRNk5NbXhwOHhyTGxKV0RMdWFReVk0bVJhRE51KzVEaUlHTkVR?=
 =?utf-8?B?bHJoUTVIV2NLRXVNVDVBSS9oNFBDNG4yZ1ZXVm9tZTMyNk5zUkhVMVRaUWJ6?=
 =?utf-8?B?WGt4U1hVbllkcWZxazlPbFJTR1NRR0w5dSsvZnMvWGVMRFBJWE44akZzU0hS?=
 =?utf-8?B?ZFNyaHBtQzRsd3Fvc3RVUnFCVHVXQkFmV1hkbEJZYWgzalhBRmR2SmtmTEQw?=
 =?utf-8?B?MlJWbGd1bW13U3dSQXJRRWVwaVZaeGo4cUlQcSthNG1sQjJRdUJuWUl2WUdQ?=
 =?utf-8?B?Qk9pWm1JUzhnTnNRR05qVnUzSkRXclgvUWFDVmJkZ0huQWhFTU5COEtJSHlp?=
 =?utf-8?B?QW4xNFdScmJGR1NNam5vM2hHZGZycjdHWWNQNTF2OWR5V1MvcWFmWmc5ZUx1?=
 =?utf-8?B?eFVUZFpqTHo3QlhsaEQwc0JGU2czRjQ1TXFqVUJQT0FjUEdBK0xzYVFuN1RW?=
 =?utf-8?B?Njl1TmhmU2JzMjYxV2dxa1ZYY3o3Vm1kdmplTWlwTGcraFF4NFNvU0dNUnlV?=
 =?utf-8?B?QlBESkNKMXp6TFlEdldGWW5pNWpEeGJuT2crRW9kQ3VGUFRTMXN4c2poOG8w?=
 =?utf-8?B?dWt3RGJFZzlNRW1TdGxPb0VheHdtVURuVDJsUWNaZ1Q4UzRoY2I1QlRTL0E0?=
 =?utf-8?B?aE5HekJ6SjV4aWZGQWhjMWNDd3pEU0o3a3kzM0JrSnRqT2dSQVpoNEpyYWRx?=
 =?utf-8?B?OWxhWlUzUTlScjZGeTNHd01EUmpmdFJtcUVwWnpuZEoyMTZwMDgvR1FlWXpM?=
 =?utf-8?B?QlRPZ2h6OEkwZTBGa1d3V05sVEtZTjF5QmxGNFVQK2ZyNitreitIQXFPa0NQ?=
 =?utf-8?B?UW1BRDFrNm9VbUJjTldDSm0xYWxnOTlHZmhaVkJoYjErZEFjcFFXVDVHcVlz?=
 =?utf-8?Q?p3iFf/Kz2g3i0dBIsmruNJlfH8SJ0saOqVwzl5H?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1950
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47ce0479-4a1d-4c42-de15-08d8f9d4a0a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gkaul3/IG0GE37dZx4yqVuHhuXdBFr0VTfzKeBXdhRHc5VEvbyorJ5hgW0J6D6WfEe0AMKr2jWPadlBGTIIWjzKVuNMrXGp5hCxn9bqK0JvudFi2TNsZz6y/pI2V1AAfvQcGbARUZUBpiHkbnya2S/68v16ZjYq01D9SQjFkh/SzGCtm+dlqnhKWXhfB+lPWaSopPRyRfyuPNn/CXoxl8h/C6xyfSDuNiiwFjAqt9UAKX97byLnPjUNpyNOTy8WBgtG4dFOXbmb33tR4FO09dBb2zjhIGgRw5zAzxP4Zh+U+Z5DjToqhrm9IU1+VtHSLSbJMjlBycEaGcgVPiG4OKsgvklpq5DdTuJ5beBT/nJVbHJvvc2F9kUid3nGto0hY3WH1lgiD+fqpceIH2jb9RYV4GR3mK2zrNSuDf4i4U2qiFXhj3Mwqky1VjadYW0J+jdxy5y+hhq4xZZyz3OJJALkP4oTyh8XMTJhyOtSTv9pL0eHa818wZ4/94nmDXIGoqzsJAlCxbMlP7IsUda7x0riBYvfwmmT6rDGsTGLFd8M5k3ciUMDkDtBA8ZIeSf1UKhUx8/gnhwrY2Jgf0VdH9OcXFqPpq/ZpEeBo+/fYi+XQsfiJc4aWg2DK3qsXeBOtSnvmLQ/wpxocGRq7IF9OK9IX0AWEGShdo5oGz34UITOFs2d2h6+X4hLc7P/mvAthxnEyIzhX9JkULpz+bE68U1FwUJrrlKAxwl5oszKS+28=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(46966006)(36840700001)(86362001)(36756003)(7696005)(966005)(6666004)(6486002)(16526019)(33656002)(70206006)(8936002)(53546011)(2906002)(26005)(186003)(478600001)(70586007)(316002)(36860700001)(956004)(44832011)(6862004)(2616005)(5660300002)(336012)(81166007)(82310400003)(356005)(83380400001)(4326008)(54906003)(8676002)(47076005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 14:51:42.2975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f6f331-5302-4b70-4cd5-08d8f9d4a830
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3948



> On 7 Apr 2021, at 14:56, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 07/04/2021 14:19, Luca Fancellu wrote:
>>> On 7 Apr 2021, at 14:13, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 06/04/2021 11:36, Luca Fancellu wrote:
>>>> Modification to include/public/grant_table.h:
>>>> 1) Change anonymous structure to be named structure,
>>>>    because doxygen can't deal with them.
>>>=20
>>> What do you mean by can't deal with them? I had a quick try with doxyge=
n build and couldn't find any failure (although I haven't looked at the out=
put).
>>>=20
>> Hi Julien,
>> The problem is that Doxygen can=E2=80=99t generate proper documentation =
for anonymous union/structure, it ends up with warning and/or producing wro=
ng documentation like
>> changing names or giving field description to the wrong field.
>=20
> I might do something wrong because I cannot spot any significant differen=
ce in the doxygen ouput if I switch back to anonymous union. Would you mind=
 to post more details (such as a diff) on how doxygen doesn't generate prop=
erly documentation?
>=20

Hi Julien,

Here the explanation of the problem: https://vovkos.github.io/doxyrest/manu=
al/unnamed-structs.html

Clearly the proposed solution is not suitable because they are just hiding =
the anonymous union/struct field from the documentation.

I did two test:

1) with the anonymous structure:

struct gnttab_cache_flush {
   union {
       uint64_t dev_bus_addr;
       grant_ref_t ref;
   } a;

I get a warning from sphinx (because the XML output of Doxygen is not in a =
good shape) when I generate the documentation, here follow the output:

$ make -C docs XEN_TARGET_ARCH=3D"arm64" sphinx-html
make: Entering directory '/home/user/prj_xen/xen/docs'
Generating xen.doxyfile
mv xen.doxyfile.tmp xen.doxyfile
Generating doxygen_input.h
/usr/bin/doxygen xen.doxyfile
Generating hypercall-interfaces/index.rst
XEN_ROOT=3D/home/user/prj_xen/xen /usr/bin/sphinx-build -b html . sphinx/ht=
ml
Running Sphinx v1.6.7
making output directory...
loading pickled environment... not yet created
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 21 source files that are out of date
updating environment: 21 added, 0 changed, 0 removed
reading sources... [100%] misc/xen-makefiles/makefiles
/home/user/prj_xen/xen/docs/hypercall-interfaces/arm64/grant_tables.rst:6: =
WARNING: Invalid definition: Expected end of definition. [error at 18]
  gnttab_cache_flush.a
  ------------------^
looking for now-outdated files... none found
pickling environment... done
checking consistency... /home/user/prj_xen/xen/docs/hypercall-interfaces/ar=
m32.rst: WARNING: document isn't included in any toctree
/home/user/prj_xen/xen/docs/hypercall-interfaces/x86_64.rst: WARNING: docum=
ent isn't included in any toctree
/home/user/prj_xen/xen/docs/misc/kconfig.rst: WARNING: document isn't inclu=
ded in any toctree
/home/user/prj_xen/xen/docs/misc/kconfig-language.rst: WARNING: document is=
n't included in any toctree
/home/user/prj_xen/xen/docs/misc/kconfig-macro-language.rst: WARNING: docum=
ent isn't included in any toctree
/home/user/prj_xen/xen/docs/misc/xen-makefiles/makefiles.rst: WARNING: docu=
ment isn't included in any toctree
done
preparing documents... done
writing output... [100%] misc/xen-makefiles/makefiles
generating indices... genindex
writing additional pages... search
copying images... [100%] admin-guide/xen-overview.drawio.svg
copying static files... done
copying extra files... done
dumping search index in English (code: en) ... done
dumping object inventory... done
build succeeded, 7 warnings.
make: Leaving directory '/home/user/prj_xen/xen/docs=E2=80=99

And checking the generated html page html/hypercall-interfaces/arm64/grant_=
tables.html you can see that there is a union without name or fields right =
above "union __guest_handle_gnttab_cache_flush_t".

2) without the anonymous structure:

struct gnttab_cache_flush {
-    union {
+    union a {
       uint64_t dev_bus_addr;
       grant_ref_t ref;
   } a;

I don=E2=80=99t get the warning from sphinx and looking in the html/hyperca=
ll-interfaces/arm64/grant_tables.html page I can see the proper documentati=
on for the union a right above "union __guest_handle_gnttab_cache_flush_t=
=E2=80=9D.

Let me know if you get different results.

Cheers,
Luca

> Cheers,
>=20
> --=20
> Julien Grall


