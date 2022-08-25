Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D35A0ADA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393103.631844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7l7-0005hf-Am; Thu, 25 Aug 2022 07:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393103.631844; Thu, 25 Aug 2022 07:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7l7-0005fR-7i; Thu, 25 Aug 2022 07:58:37 +0000
Received: by outflank-mailman (input) for mailman id 393103;
 Thu, 25 Aug 2022 07:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9hs=Y5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oR7l5-0005fL-5V
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:58:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7bc3634-244b-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 09:58:34 +0200 (CEST)
Received: from FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::13)
 by DB9PR08MB8673.eurprd08.prod.outlook.com (2603:10a6:10:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Thu, 25 Aug
 2022 07:58:21 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::ef) by FR3P281CA0139.outlook.office365.com
 (2603:10a6:d10:95::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Thu, 25 Aug 2022 07:58:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 07:58:20 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 25 Aug 2022 07:58:20 +0000
Received: from 26b10ea0a974.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8B2203B-FB8A-49DD-9C0B-186A781FEA29.1; 
 Thu, 25 Aug 2022 07:58:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 26b10ea0a974.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Aug 2022 07:58:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6707.eurprd08.prod.outlook.com (2603:10a6:20b:305::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 07:58:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Thu, 25 Aug 2022
 07:58:12 +0000
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
X-Inumbo-ID: b7bc3634-244b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I+ZaA0hXkJCtuXwz+SY6LP3wdkgkn9eoo7t6qmtR7jG6msSIJyMGgh4coOlaKvHQYFgcVZNJ0LOxRQzK9T52pQR9IbdfkgkpiBHhDSelr5qAdfng+rAZd0FuGWxBJzIOY4PAPrssGR8n7cznTeyizwI1BhMXYkJnRrf59DzzA9wspteSBjg0a7C4iP/Y/rIUEo2vNWVMRflikRxaw/lpwjDnjgUf/IKQ6qNPeUNKOYDq1fWa3gjGsvkpCfP+zHmq9gKEzoKeue7PP9B5q4vWvvBZsSwL0w+UgnTSVoBjAU+TIrXJgeM287LKmS9P9Njt+ebwhcI/5hC7wW1uuyoMaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgxjvsqUBOR+VIg2/5AwJlSAj2MGOyolHuS+MJJofw8=;
 b=TiC7iW/D/BR0MD+3bQc5YC7LFHKwSWOjo1qYViXWTgmlip4fDudZ1a6jR6U0I21I0Sh6tQK/AdbsDf73LAc1eqgDwB+x0wfDW5w7aVLCtdHxdIRPD89qacKqTTA79zuFzXXgJBzYKMQ8E1pntZsUut8lSQKqRzuvI01c9Hw0wZXkbZRtcZ8x3FFCMSXh+GrRtpREn3253DRgEZQxGjPEkPMAplCEfek10rQGauxnafVs5vYaVu7MPb2caLXz6oabNpKcSRifryXQygYBJH1r6Z0V57a6popmZXXAiCTXWzRmS5hyxQ274PQfX1eSJF7Nzfmo5cyYb4M2iXo/4BwyMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgxjvsqUBOR+VIg2/5AwJlSAj2MGOyolHuS+MJJofw8=;
 b=nr+3gDunA0cpD7I/Jx3ccFuOFpCQFkeSccScp97D9nkkLfdsxZRwUwRjeZswXw3/d3DggLCEawWD1nyRRvp/9JFQe5vDiVa8uZDFx7q21vI0eSKhbJ5h17BUxIJ24UvX1waGFYfoWVxV67wLyYeLxPhSSmETbIAPRcoRiysa7xI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e32806c04b2d39f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAYqLtisd/NLPus7mrOA60o3f6nHPudhomKoOdmMG8BDQpp6OHRq6tr+QLeATkE3Th99JLmHYUYoSJSicru7pUOjeISH9Kum5ueWwUAcsUW0v0TH9ifMJ4FwWfXuZMHBMJ1iA04r5NZXMyjG1F0guz3jwbOlwVMxzfB8dr1ghpKGAPiI4ACaD4yKOPPdmAXl1oG/by7K5h3DqyMaIkNxKayYE19IuGzL94Fq0dEmeyHG6WPqT8OCZLxrvYJUSCj4jJXuarCzEEiGgXgrC+HV15YmYZb9q0Kre+g4TKDiQ6YPSVM+K5TbTUMPPqy7ONgM4bVf69x6DkmfAPM19Th6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgxjvsqUBOR+VIg2/5AwJlSAj2MGOyolHuS+MJJofw8=;
 b=jr7vsyziG7Qivfahcdu+29fRalWXcof0NjRa0iSNEMq/fHP0qSYaku+5UoviJSsx5pUGccW1Dbpx5GirJcz4VkNofY0IJZRCfrLUhHIJmhGQbQobUlQzIBYyJ9XW54PdfMm/TAXCxLXuCcCt2dgnXJ9DfoEkexS7ac91SkT4XqdkgB6OPiMNwVx+4Xn01+leEL9MIPjj2JICzYwNyjtvVfEWZc3EVHuZm1rL4J+hUy/cXT2s+wNVrI/1niCueQn8uIrda70kvQXDDhb1lI5kMRj28aKPe0VOKz9Is8lO4AuvgKxFurOCXq4HzNpsWrjebJgqCBDrmnptU9iMkBuAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgxjvsqUBOR+VIg2/5AwJlSAj2MGOyolHuS+MJJofw8=;
 b=nr+3gDunA0cpD7I/Jx3ccFuOFpCQFkeSccScp97D9nkkLfdsxZRwUwRjeZswXw3/d3DggLCEawWD1nyRRvp/9JFQe5vDiVa8uZDFx7q21vI0eSKhbJ5h17BUxIJ24UvX1waGFYfoWVxV67wLyYeLxPhSSmETbIAPRcoRiysa7xI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] x86/public: move XEN_ACPI_ in a new header
Thread-Topic: [PATCH v1] x86/public: move XEN_ACPI_ in a new header
Thread-Index: AQHYt85ufd+PwkI5IU+k+Lq2pSqnAK2/PlYAgAAC5QA=
Date: Thu, 25 Aug 2022 07:58:12 +0000
Message-ID: <C3C2E05C-94CD-4A6C-87FF-E7943A6829C9@arm.com>
References:
 <b79164d207113af05417536438b786850875edb1.1661353272.git.bertrand.marquis@arm.com>
 <17557d6d-8c07-915c-ed01-1e7d81891023@suse.com>
In-Reply-To: <17557d6d-8c07-915c-ed01-1e7d81891023@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5c35386a-248a-4db3-019a-08da866f9415
x-ms-traffictypediagnostic:
	AM9PR08MB6707:EE_|VE1EUR03FT025:EE_|DB9PR08MB8673:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Por2NLli0UODuxdGQyZ5P276p7RSztbTOuRe+9txWNzmXnC/3pf4XPXWeXK6K+3pvn6+f0MUk6b3l7gg25OopULI2zNqSogN6dsJHRW0XTs/i1HK5uD3mal3gznZ230odGPUef8lKnBiekkGmvPRxX7eIMPqxXkWQJBxgb/4B4P9V+HZnnYrtkPYnaL6w1c7bz+y4vf0n7E0F14KtCD95IgwIf7w9NwUaj38d7HmOW3ukjbboaQ9sE0UIVf/wjD0/NlubAupl+1gOTayAen3qY6jDyuaUyEAHV47WMpf/B+XwAsHfDBhTzaHpHQQzMxu370Iw+O/2FFyreGFhhvoSio0pIR9A54KkJCGvO8zUaCszHFX27zini8X94gYExfTLj3CnazUaUJcDKARTE8vRop0V6eQkiAkevc3eooslRbDibEDOl1HtFHkkTkJbi3CdiZEY895Nn3S4T5YtHEzVoBK6lJLeMpphhGxPucGziuy6Xhooe8z7JkVJbfeJ2fJIET2bR9l3l5mlXTQJFUlWKBkrnww1TOsWXD1WCeyG2VUccY/ZMY9d8K/9OQF2kVkobgPb2cZ1b3gQG5b+2IHB1CgMHv11ibEquJGdijig3dXQPBOhoPWxTJcNkL8G8QbZA3MAasAtnZNzyvACK4VyI/ItZi0kBQLcRq/I13V0eTVm1spQh49enmlSSoHj6skya8m/NUt5zoY7d8L2nz4wiDE9IeqGtDDB7f4WWgvv3c+t1NX/wwqmMHMkU+c8SPRYEhEM8Ojk4VQXS2bVntdMPJLlZb2k2nrrUFYSWYeOlU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(36756003)(83380400001)(2616005)(41300700001)(54906003)(6512007)(6916009)(186003)(26005)(6506007)(2906002)(33656002)(38100700002)(71200400001)(316002)(86362001)(478600001)(4326008)(38070700005)(6486002)(91956017)(66476007)(66446008)(64756008)(76116006)(53546011)(122000001)(8936002)(5660300002)(8676002)(66946007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DA54B7D1A03E754E8C77FE644C5C3A50@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6707
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	00fe655e-ecf1-45fd-04cd-08da866f8eff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CDrBEToCWzQbGHB3jViYQG0o7ZzF2GM+JXjye2THCVG61FqHZBuQG+AiopSo0sA4cknf133glCR3M87zPic5XZUkAanRuqV965KiA76IbVaumACpqcaXUGvYlqJIHheMHftfP1cCZUSuJZzz1ITsBsdlBeAh7ePyK1JvygT7VPoDG3zhcoUxAHauTnEY1ZW4PYZiYGn2ft8ncqK38DhZQNq4vi/4W/ROwTIPZS6OrElpfNtIuJyE42e1KgTxlYcTSW77F+hvCAW6qSNJP0FMzuD0JhcgzLdiT3QhwH0TOCif4oGanuwuyuYFhBfcBHWfVZ03u+e/c83MBnzPldSC8IrYoAjFXfu085E3aw0XRc4tPT6K/ZwAKGa7bOED2LCCvNiSJKO0zbYcNllt621/0uC+BlrXbDb1nrd3kYUmG+LwgvguR2kbHOFSZC6te0eIfNtgEpT5FZ5iSmhELSShWZrXhfb1vrXBAYkQ/em5N6FTJB+bSVD77Oru2so7Jg6NFkWRaxJcrgzJp7qR9Yv23lrg2N6OFAtwmcmaqTmyF4Yyqr3Jf0MgjyjoI1kSyAbh1VJw0n3yFBhddp7j51n4aou0f1B7N8C2c/TaSpDi7zbF4lWTM3fs9QEtpk/2ZVIcH9SniuIU00vhVcYO6orRXyrSuEVUvmqfYzPik3T5kLESKLUBinIj/8Ibp8XtVFeHu/0N3Idf53Ty2uyeYEBzPt8R0p4sUspYlVpc0B+li/V8GzoQkbDiY6rD1sM1aCNH8yfL10PYAz5WVWPI00fs5Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(40470700004)(36840700001)(82740400003)(86362001)(40460700003)(81166007)(356005)(2906002)(36860700001)(316002)(54906003)(4326008)(5660300002)(8676002)(82310400005)(8936002)(70206006)(70586007)(40480700001)(47076005)(2616005)(41300700001)(6862004)(478600001)(36756003)(83380400001)(26005)(6512007)(6486002)(336012)(186003)(6506007)(33656002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 07:58:20.9149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c35386a-248a-4db3-019a-08da866f9415
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8673

Hi Jan,

> On 25 Aug 2022, at 08:47, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 24.08.2022 17:29, Bertrand Marquis wrote:
>> When Xen is compiled for x86 on an arm machine, libacpi build is failing
>> due to a wrong include path:
>> - arch-x86/xen.h includes xen.h
>> - xen.h includes arch-arm.h (as __i386__ and __x86_64__ are not defined
>> but arm ones are).
>>=20
>> To solve this issue move XEN_ACPI_ definitions in a new header
>> guest-acpi.h that can be included cleanly by mk_dsdt.c
>>=20
>> Previous users needing any of the XEN_ACPI_ definitions will now need to
>> include arch-x86/guest-acpi.h instead of arch-x86/xen.h
>>=20
>> Fixes: d6ac8e22c7c5 ("acpi/x86: define ACPI IO registers for PVH
>> guests")
>=20
> Nit: Please don't wrap this line.

Ok

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> The x86 header is including ../xen.h before the ifndef/define so that it
>> gets included back by xen.h. This is wrongly making the assumption that
>> we are using an x86 compiler which is not the case when building the
>> tools for x86 on an arm host.
>> Moving the definitions to an independent header is making things cleaner
>> but some might need to include a new header but the risk is low.
>>=20
>> For the release manager:
>> - risk: very low, the definitions moved are only used in mk_dsdt and
>> external users would just have to include the new header.
>> - advantage: we can now compile xen for x86 on arm build machines
>=20
> You will want to actually Cc him on v2, so he can ack the change (or
> not).

Ack

>=20
>> --- /dev/null
>> +++ b/xen/include/public/arch-x86/guest-acpi.h
>> @@ -0,0 +1,50 @@
>> +/**********************************************************************=
********
>> + * arch-x86/xen-acpi.h
>=20
> Stale file name.

Right, forgot to change the content after renaming, will fix.

>=20
>> + * XEN ACPI interface to x86 Xen.
>=20
> Perhaps also here s/XEN/Guest/.

Ok.

>=20
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
>> + * of this software and associated documentation files (the "Software")=
, to
>> + * deal in the Software without restriction, including without limitati=
on the
>> + * rights to use, copy, modify, merge, publish, distribute, sublicense,=
 and/or
>> + * sell copies of the Software, and to permit persons to whom the Softw=
are is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inclu=
ded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL THE
>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> + * DEALINGS IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_ARCH_X86_XEN_ACPI_H__
>> +#define __XEN_PUBLIC_ARCH_X86_XEN_ACPI_H__
>=20
> Please make the guard match the file name.

Yes

>=20
>> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
>=20
> While separating it out, may I suggest to limit this to just the tool
> stack? There's no use of these #define-s in the hypervisor, and none
> is to be expected. (Of course this will want justifying this way in
> the description.)

Ok

Thanks for the review
Cheers
Bertrand

>=20
> Jan
>=20
>> +/* Location of online VCPU bitmap. */
>> +#define XEN_ACPI_CPU_MAP             0xaf00
>> +#define XEN_ACPI_CPU_MAP_LEN         ((HVM_MAX_VCPUS + 7) / 8)
>> +
>> +/* GPE0 bit set during CPU hotplug */
>> +#define XEN_ACPI_GPE0_CPUHP_BIT      2
>> +
>> +#endif
>> +
>> +#endif /* __XEN_PUBLIC_ARCH_X86_XEN_ACPI_H__ */


