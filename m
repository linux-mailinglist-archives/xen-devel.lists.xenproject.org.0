Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCA359A4D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 11:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107720.205902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUntF-0000YN-Eh; Fri, 09 Apr 2021 09:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107720.205902; Fri, 09 Apr 2021 09:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUntF-0000Xy-BC; Fri, 09 Apr 2021 09:57:25 +0000
Received: by outflank-mailman (input) for mailman id 107720;
 Fri, 09 Apr 2021 09:57:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TN0Z=JG=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUntE-0000Xt-Dh
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 09:57:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f983c2c2-233e-4eb6-bf34-faa1caddb193;
 Fri, 09 Apr 2021 09:57:21 +0000 (UTC)
Received: from DB8P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::36)
 by DB6PR0802MB2613.eurprd08.prod.outlook.com (2603:10a6:4:a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 09:57:18 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::4a) by DB8P191CA0026.outlook.office365.com
 (2603:10a6:10:130::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 09:57:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 09:57:17 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Fri, 09 Apr 2021 09:57:17 +0000
Received: from dc070bde98a8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54A0F0C7-024C-459F-8A7D-CED5D1590855.1; 
 Fri, 09 Apr 2021 09:57:07 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc070bde98a8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Apr 2021 09:57:07 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB5486.eurprd08.prod.outlook.com (2603:10a6:803:13b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Fri, 9 Apr
 2021 09:57:05 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Fri, 9 Apr 2021
 09:57:05 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0267.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Fri, 9 Apr 2021 09:57:04 +0000
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
X-Inumbo-ID: f983c2c2-233e-4eb6-bf34-faa1caddb193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTcDNk9eaYGnqWKROT4awA9sVRxuNmZnOOXEFkXMkzQ=;
 b=vOHiHOG05DBzfLEVdbAI/boVY8iir6FYytBZxy0nhHxYxEvTdqLHO8qycnDTwV9qXqLQ9RjJg8N0tdF3pTiwaS3fkA0v/UIb8CcXtHQit2KJu/vra2Zo8hdK49UQZwAUlxyY3OFM6Lgj3hGOphh88peStyayyMZT3pCdeBWtgJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8374d9a841fee1d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPTPT/5Mh+XocYuBhcd4yADC8BcVOR7640IG2BbGERrUS9VaSgzMyk1ChCAN//sNSdCgz7o0KfWN9kGB6Z6yUGZgqMO8p9EEVbnIXnqmkd0+WFuUwHlLpnVJqsau2Em9EoQWEAFR9yefepdiQ2pLeOXNCmaJBbmehjMHdM0TD8DpkH4Orgn9WiMYHoQWnXghCO9kgtPeW6lWV5HXDdWJQGrAkg+v6+QDkW9oEvJZH3lSfSz53Zxh5R6MHIjkXk2suMZQ4WNV5UHH/B2so8dGZwArxAykz44HHyvFbRQ3L9s9O4y4wZvw50H1RbnrI9iJFhjnjMIwBgezqw7Q0A12Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTcDNk9eaYGnqWKROT4awA9sVRxuNmZnOOXEFkXMkzQ=;
 b=gIR435W5T6XajhhHQWcaNr/5fG2rriYHYq2MFtODPYQH0XwKo37oqlwmt13fjTV3fBVZIsAhSIE36Uxe4cUiFQC82BVQ3t5nTebbaxlJlV2f0Lz6GLyglVO3fvsxNOE/eA1qoL1B1G0oeL2FoAMhvOJ63w+hIqvw8sOwJ65tVC/GKt9H3Lk7YE7rOzJNqT5oezJBwEy6pdlp58zq6f3/rUxQx94+nWpb5FdWtVQNVPtEz2dpsY8ZxeNN4RlQtgzsPuYzSYdjE//yxVcg5QIDmfprRE4F1IYjxC/1Le6iDggIIupRFU1GImPRGixtCeMroTOVCuUWCio/e6V2llWy3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTcDNk9eaYGnqWKROT4awA9sVRxuNmZnOOXEFkXMkzQ=;
 b=vOHiHOG05DBzfLEVdbAI/boVY8iir6FYytBZxy0nhHxYxEvTdqLHO8qycnDTwV9qXqLQ9RjJg8N0tdF3pTiwaS3fkA0v/UIb8CcXtHQit2KJu/vra2Zo8hdK49UQZwAUlxyY3OFM6Lgj3hGOphh88peStyayyMZT3pCdeBWtgJE=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 4/4] xen/arm: Prevent Dom0 to be loaded when using
 dom0less
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <ebd93270-c8c3-7fb9-9abe-e40fdce8680a@xen.org>
Date: Fri, 9 Apr 2021 10:56:58 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <48EBE04B-F36C-441C-89A5-44E988A67F1C@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-5-luca.fancellu@arm.com>
 <ebd93270-c8c3-7fb9-9abe-e40fdce8680a@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::15) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1dea2a3-93fb-464b-3c38-08d8fb3ddc02
X-MS-TrafficTypeDiagnostic: VI1PR08MB5486:|DB6PR0802MB2613:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB26139100381948EF00C910A3E4739@DB6PR0802MB2613.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yBX8WDGcfKGNqXo3LyKFC2PotBXE4q+Eg/Twh7Pn1JkoT9ltSQLlgu7J2AuRktfiiKNswJddbk5xyIW4U4+F4nNVP5hv1S8V9Y+gSSr0WVYw6IovmPde5g3OUryeJiYPD9vQp2DnFZpeH4si887YxZLQUpRyX39+ihpMygZcDcnufllOBTRcTNXhdfmdFnoSHYPrvYYrclHZDwoARwr2qUXJsnDXAigJgUmJLXPOCimb1M4x1kpPVAHeMq/QKufwA0R2PY6/w7UYjPmz3WTebL6F4KMaVGhpFZf07j2wWqsfzRPWmpAT3LqQPPa6TnPYqiX/ppGhudj08zMOnDq5D6L/EJ77BumeyT62rhpulRYG/KlNbp5ufSGnJKiGl/EUPg2mscK5y+ShrQGgfAUQi0HUIP9NOOtxmQkO6Tm32gb3POO9Fx4wJyG2jMAGaqCl/OxkFDBg5xiqMBuQYlWfCP+DD8TjFaRqWGjreVtbXg+VgO7jkU9Vv+OYCH68l0xiwbDuF/D9PotNyfskMVslQT4wvuAMVi8RiVgfwHkAuDPmAYrhQNeC1CQacDuL8bPkK77gou0N9UKoEDHrcRhMp+ziD4ksYlV8GG9nSx2u9PcUkokW0CzahHR4VtXHbDJgnzyeChMiiaFQZqBiBCLmVm3Lq1s8Jfw8cA76HrYMJM0Za8GjiEuujiODlCOE2HcYInsgyVZvUKpJfG8jgXHTRT/ZwBvGcAdCnxPRf5P2n101dsIsdElR2rdRqGaKvL8+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(38100700001)(66556008)(66476007)(38350700001)(956004)(2616005)(5660300002)(186003)(2906002)(26005)(66946007)(86362001)(16526019)(478600001)(83380400001)(8676002)(8936002)(6486002)(53546011)(6916009)(33656002)(316002)(54906003)(36756003)(4326008)(6666004)(7696005)(44832011)(52116002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?w9TpocW8k674TS31jg7NvhheqWUpQQTYFPk2OfYiQ8LPF4X6ICE+GGEvNvb8?=
 =?us-ascii?Q?7p1Lyh/G6VbuVip4PtWyjJSO/aOl9nB8CiEXNrc1kXdJTvdYhCoXqOQsuBOH?=
 =?us-ascii?Q?OE5lSZQ5Pbt3DFCVlj+YpAc37ZMTdSR3bOgTxWVidDfwuW8AB/VH9CCKF1d4?=
 =?us-ascii?Q?FFjwGr+OmYGFHPHa7WzgxqzGIDFH58bnHPnMdD6r2tAcEVQs+davHCFgw9aZ?=
 =?us-ascii?Q?8kCYsefbvBMUa6LgZA8zdZ1pvTRzes3otHmtm9lhQB/fdFkS7SjJvXwlZWOF?=
 =?us-ascii?Q?sw+Ff5TLLnKs9xm+oTAct0PbcrcWYpsdC2b2569fGFuklO4pYgs3opyNrD1n?=
 =?us-ascii?Q?63dXmNTqv7Izks78enxeK9QFPTOQd15HOWh+MBrOEGiZrkncu2eviakrdtd5?=
 =?us-ascii?Q?JjHtUHjyOyxpxgv3M/29JXKoWfVV7+xgLYJmTuKupvNMmwxOIUffFQr+MULy?=
 =?us-ascii?Q?4MJWbzz1yHY0wNtVEJas6EjLWbLEuBEpaqac7qJ2S9Tu8WFl+t6JwggHywI8?=
 =?us-ascii?Q?a/Q2iC7BnVHdOAR72Z5loYlMQAADUXiBbz44lFpVq00dTBjZSmE9FuN+r64X?=
 =?us-ascii?Q?pjqI9gVdI/TIUlTa8QHxAi7dESihXXUYGRRPeXlueW14IlUl0P9WrOvGkBMM?=
 =?us-ascii?Q?MTAsp+QkH4nENN3BpRFq+J5Gkb2Mh/9rWOaNHdeLdzYyKbp9T2kFLEIcttGH?=
 =?us-ascii?Q?YZACwyQ1zwnHTzEqZskHgJyDyQTPsmoyGn1SC7Zb3A72bemGX3JMjRCRd7rX?=
 =?us-ascii?Q?Y95Zx5U7ICxdFr+0o4JXJ4XOnuRL7nsxCdcI8O3P/Y5oASAEnRRlxjWp0+ZC?=
 =?us-ascii?Q?DeGUC+RiJ8WS8cZ7INsMSUngQtvxSTTXderVdhsSpA7rw8wFBHgef6yxm+c7?=
 =?us-ascii?Q?39BZDe00X3lgqNhZhp7HnYnoPjuK1kO44+FuL7QaeCLtPqCa1TSLSWm0VvtA?=
 =?us-ascii?Q?MyxAOhiJwPiBviXQ3xg8+pzHvz9JdksFGPYai/eoJGSsmLwT2M0x9bS0jH4h?=
 =?us-ascii?Q?KBPXK49TYaiwU3Dgm50t/9YTIrsvGkwHjRfr0154wsrTnoxRAz5ilSbyNKeM?=
 =?us-ascii?Q?tWjWCPjPyvIc2qMv9c8n4+SjfwNiQFGb4SzfuUCBdtodyeyMZAgUrmFzQ8LB?=
 =?us-ascii?Q?AuDj2XCe2pLnR15vo8AKNAf1xQ33zkURzwM1ZR+Oi7PvGYYk5XlpxrKlESd2?=
 =?us-ascii?Q?WOFAxS/tCUnPmh8Qwu4vKAgkZEEGCLA+PrjwRtsH4kN+fEr1Hr7Hn7xtOKr7?=
 =?us-ascii?Q?wfDn5WnRVU/kVXLBlO+DLZZmGKeUnYPxstpcQd0x+4E6qo1jT/IwlbNOacpA?=
 =?us-ascii?Q?DcVfQeC0KzvckMPVl56zytPi?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5486
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e046168-a940-409d-67da-08d8fb3dd4d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G0XDoKmFGbpAk6EYkXmht2fie9DQeHJ3juMSMqVAPbCf3wVpSJ+/cORC9MuX8oOW7DCyqoZWjo4cKk9zgifXbu8IRIIaTEwrD6sRZW07g/N56VZlSLriNVGgCLNyYs6gDlUMKozjYG49wNW5YqBSxNMi1HzKD68uLdE8/lNXoQJrzcoy3hrUXiX9up8ivXFICswmVc4SY/mDsT1cTJvYn1cL2RMVvc89M8IxCDcGY4mim5bxou+1OI8tYG1K8uRGGuoHhdQfDaoLjWe9BWuZ5Zjj2ilPkC1rgkc4n8pBSB1YtpZv+WOa9TKQLgUCkOpvWzCpL6eFtyBVnh9pR8ZnlgJnuX19u1AmuDGIIiMXQF9nQ7jufcCnhi7prIermsVgLCgFJYD5+WD0acAj8dpXTk0oxyj8FBcmPm5R7zXGh7jBm+CsIcsT8nahEswdaXa1YqEQot/WCwg7L/8HtG3Nbni3inowhP7t75y9oxU9BpeTEDmQbOXYzkaGPNUPlp4Hisi9lM2NMDphFLwU9EMfjzNvaUnFPl5ZsaoreQkA2bolREh8Z6jq0IFM8dRe1vr99tpGGrBP3DuuaaSDY210yzKCfW1J18W23dmceEWyr7z0EQ+fftqoR8LbHOtmUXhmJiUQXcFTsAf5URYAYV6gBHgLADAXtEceFRPIx2n4Nl0OTLQxJ2/71rXxrFNHXD9f
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(478600001)(36756003)(5660300002)(4326008)(70586007)(70206006)(186003)(26005)(956004)(2616005)(44832011)(6862004)(336012)(6666004)(107886003)(16526019)(2906002)(6486002)(8676002)(82740400003)(53546011)(33656002)(83380400001)(47076005)(81166007)(54906003)(316002)(7696005)(82310400003)(356005)(36860700001)(86362001)(8936002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 09:57:17.5566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dea2a3-93fb-464b-3c38-08d8fb3ddc02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2613



> On 9 Apr 2021, at 10:12, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 08/04/2021 10:48, Luca Fancellu wrote:
>> This patch prevents the dom0 to be loaded skipping its
>> building and going forward to build domUs when the dom0
>> kernel is not found and at least one domU is present.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  docs/features/dom0less.pandoc |  7 +++---
>>  xen/arch/arm/setup.c          | 42 ++++++++++++++++++++++++++++++++---
>>  2 files changed, 43 insertions(+), 6 deletions(-)
>> diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pand=
oc
>> index d798596cdf..a5eb5bcda0 100644
>> --- a/docs/features/dom0less.pandoc
>> +++ b/docs/features/dom0less.pandoc
>> @@ -16,9 +16,10 @@ Multiboot specification has been extended to allow fo=
r multiple domains
>>  to be passed to Xen. See docs/misc/arm/device-tree/booting.txt for more
>>  information about the Multiboot specification and how to use it.
>>  -Currently, a control domain ("dom0") is still required, but in the
>> -future it will become unnecessary when all domains are created
>> -directly from Xen. Instead of waiting for the control domain to be full=
y
>> +Currently, a control domain ("dom0") is still required to manage the Do=
mU
>> +domains, but the system can start also without dom0 if the hypervisor
>=20
> "hypervisor Device Tree" sounds a bit strange to me. I would either drop =
"hypervisor" or say "host Devicet Tree".
>=20
>> +Device Tree doesn't specify it and it declares one or more domUs.
>=20
> AFAICT, the first "it" refer to dom0 but it is not clear what exact prope=
rty will used to do the decision.
>=20
> Also you have two 'it' in a row that refers to two different entities. I =
would name it to avoid confusion.

Yes I will rephrase it, what about:

Currently, a control domain ("dom0") is still required to manage the DomU
domains, but the system can start also without dom0 if the Device Tree
doesn't specify the dom0 kernel and it declares one or more domUs.

>=20
>> +Instead of waiting for the control domain (when declared) to be fully
>>  booted and the Xen tools to become available, domains created by Xen
>>  this way are started right away in parallel. Hence, their boot time is
>>  typically much shorter.
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index b405f58996..ecc4f0ae98 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -793,6 +793,38 @@ static void __init setup_mm(void)
>>  }
>>  #endif
>>  +static bool __init is_dom0less_mode(void)
>> +{
>> +    struct bootmodules *mods =3D &bootinfo.modules;
>> +    struct bootmodule *mod;
>> +    unsigned int i;
>> +    bool dom0found =3D false;
>> +    bool domUfound =3D false;
>> +
>> +    /* Look into the bootmodules */
>> +    for ( i =3D 0 ; i < mods->nr_mods ; i++ )
>> +    {
>> +        mod =3D &mods->module[i];
>> +        /* Find if dom0 and domU kernels are present */
>> +        if ( mod->kind =3D=3D BOOTMOD_KERNEL )
>> +        {
>> +            if ( mod->domU =3D=3D false )
>> +            {
>> +                dom0found =3D true;
>> +                break;
>> +            }
>=20
> NIT: You can directly return false here because if you have dom0 the it c=
an't be dom0less.

When I can I try to have just one exit point from a function, do you think =
here it can cause
issues?

>=20
>> +            else
>> +                domUfound =3D true;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * If there is no dom0 kernel but at least one domU, then we are in
>> +     * dom0less mode
>> +     */
>> +    return ( !dom0found && domUfound );
>> +}
>> +
>>  size_t __read_mostly dcache_line_bytes;
>>    /* C entry point for boot CPU */
>> @@ -803,7 +835,7 @@ void __init start_xen(unsigned long boot_phys_offset=
,
>>      int cpus, i;
>>      const char *cmdline;
>>      struct bootmodule *xen_bootmodule;
>> -    struct domain *dom0;
>> +    struct domain *dom0 =3D NULL;
>>      int rc;
>>        dcache_line_bytes =3D read_dcache_line_bytes();
>> @@ -958,7 +990,10 @@ void __init start_xen(unsigned long boot_phys_offse=
t,
>>      enable_errata_workarounds();
>>        /* Create initial domain 0. */
>> -    dom0 =3D create_dom0();
>> +    if ( !is_dom0less_mode() )
>> +        dom0 =3D create_dom0();
>> +    else
>> +        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>        heap_init_late();
>>  @@ -976,7 +1011,8 @@ void __init start_xen(unsigned long boot_phys_offs=
et,
>>      if ( acpi_disabled )
>>          create_domUs();
>>  -    domain_unpause_by_systemcontroller(dom0);
>> +    if ( dom0 )
>> +        domain_unpause_by_systemcontroller(dom0);
>>        /* Switch on to the dynamically allocated stack for the idle vcpu
>>       * since the static one we're running on is about to be freed. */
>=20
> Cheers,
>=20
> --=20
> Julien Grall


