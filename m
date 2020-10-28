Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9B29CF0E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 09:44:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13381.34002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXh3m-0001Xy-7X; Wed, 28 Oct 2020 08:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13381.34002; Wed, 28 Oct 2020 08:43:58 +0000
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
	id 1kXh3m-0001XZ-40; Wed, 28 Oct 2020 08:43:58 +0000
Received: by outflank-mailman (input) for mailman id 13381;
 Wed, 28 Oct 2020 08:43:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOlM=ED=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kXh3k-0001XU-1W
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:43:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30c9fc65-bf9d-49b8-b13c-9c6f30e7dff1;
 Wed, 28 Oct 2020 08:43:54 +0000 (UTC)
Received: from AM6PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:20b:2e::34)
 by HE1PR0802MB2506.eurprd08.prod.outlook.com (2603:10a6:3:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.26; Wed, 28 Oct
 2020 08:43:51 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::74) by AM6PR05CA0021.outlook.office365.com
 (2603:10a6:20b:2e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 28 Oct 2020 08:43:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 08:43:51 +0000
Received: ("Tessian outbound d5e343850048:v64");
 Wed, 28 Oct 2020 08:43:51 +0000
Received: from d7169c8f5c8b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5EFC4820-1EDD-48BE-870C-37BCA71AC8AF.1; 
 Wed, 28 Oct 2020 08:43:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7169c8f5c8b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Oct 2020 08:43:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1909.eurprd08.prod.outlook.com (2603:10a6:4:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 08:43:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 08:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zOlM=ED=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kXh3k-0001XU-1W
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:43:56 +0000
X-Inumbo-ID: 30c9fc65-bf9d-49b8-b13c-9c6f30e7dff1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe0c::62b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 30c9fc65-bf9d-49b8-b13c-9c6f30e7dff1;
	Wed, 28 Oct 2020 08:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYyRvUTEbAdnFlwhD1kOW7kYHlzlk8gTl6DKu3cM4bg=;
 b=zfVh9QjviY5n0Qo5Kflb1ddwGmRS/0D1Nnvfb/SFSJl45XTDbLQB+nOErHdHDq2AjH1YVmDSSFV+w+yDXj/Tiaj+0tnY7MYfyvZXWt/9i6FZLJ28RWvQhWjS7QAsEo9jbwS1eOwPixH4hIaucjDvK8UzZIp9rcB93JEFa3pxGE4=
Received: from AM6PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:20b:2e::34)
 by HE1PR0802MB2506.eurprd08.prod.outlook.com (2603:10a6:3:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.26; Wed, 28 Oct
 2020 08:43:51 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::74) by AM6PR05CA0021.outlook.office365.com
 (2603:10a6:20b:2e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 28 Oct 2020 08:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 08:43:51 +0000
Received: ("Tessian outbound d5e343850048:v64"); Wed, 28 Oct 2020 08:43:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0308d5cf17e5374e
X-CR-MTA-TID: 64aa7808
Received: from d7169c8f5c8b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5EFC4820-1EDD-48BE-870C-37BCA71AC8AF.1;
	Wed, 28 Oct 2020 08:43:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7169c8f5c8b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 08:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm5sNEMkOb+5UDOaJk1MFcPLLO63zqz6FFVODvXbVT8+5/phZ9j0FNJVj6i3c2AK/GGW0d6thh4sBithgNMp0Tj9BsMuh4h9XuhOutJQIJ24cWQ8MWJuxtV4WZT4Fq23qjK3Pu+sPo/IB3gI7QjWDebj7qGHB+pyyota0bHfrE2XstFn5uJgXmStcVPj9AqNIP1jtXiQA7dk8ZTFp8rx1PohAUb9R9p8gqQ8eQJxoKwr/HdHHjPt8FYeOWjFPo5ju3ajnSQyox4NgjgWeuwQrLJljlzRr6fFBLLvG4Jjn0LfS8bJYcnoX7V/2PdjiLegbCSEyOYq3y0aSiL4WLYOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYyRvUTEbAdnFlwhD1kOW7kYHlzlk8gTl6DKu3cM4bg=;
 b=FhIIQegiOTDw3MhrUOkfaCQ2fv0PBpe7xWY6Yeb0ICw4VI9aaKHFyxXAFA62KvfK0WA9KuwbN7bi8mzw77/CqiOkDQIUpn7naBrhpXTovW13SRp56nqq64QVR3uxi4m8gPi6stonjJvvraNlZ6GJAa7e1GPwA1JCXWmXvAoaCsIJyLrFnxlknG3beiszrj2LmsQPoNDi4pBY7CX0EJPopWZc6UBxzU4OjwZuexJ03IifhQBShkzZQSFR/OabcBoSxv+3sq91gsFYX9+PlpxU3IDE8/4Qt7ZK5IUE2c7e4mV60K0crMTgzJ+JCXxa+lfdp+x9Gd8bEEwTNvijRzaRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYyRvUTEbAdnFlwhD1kOW7kYHlzlk8gTl6DKu3cM4bg=;
 b=zfVh9QjviY5n0Qo5Kflb1ddwGmRS/0D1Nnvfb/SFSJl45XTDbLQB+nOErHdHDq2AjH1YVmDSSFV+w+yDXj/Tiaj+0tnY7MYfyvZXWt/9i6FZLJ28RWvQhWjS7QAsEo9jbwS1eOwPixH4hIaucjDvK8UzZIp9rcB93JEFa3pxGE4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1909.eurprd08.prod.outlook.com (2603:10a6:4:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 08:43:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 08:43:43 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWq7RKM3lRt4XRXUWYGPT9/eCkOKmsDfmAgACnfwA=
Date: Wed, 28 Oct 2020 08:43:43 +0000
Message-ID: <759F39C4-F834-4BFC-B897-714612AEACD8@arm.com>
References:
 <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
 <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2010271540110.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010271540110.12247@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f80a642a-30f0-4d8f-dd4d-08d87b1d9856
x-ms-traffictypediagnostic: DB6PR0801MB1909:|HE1PR0802MB2506:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB25065A6A36CAF4ABF402B51F9D170@HE1PR0802MB2506.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1002;OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oo681h1bqXb8SCM1LTmA3fuUgVlyvUhoCN7fqpn0TIKZ8FIsJCfn6qDlBKflsOzZCDhZJHDjJdpqtQC/kjM0aYkY1BJ1pnWK5lWmzj2ptu1YyGguzMJ8xsQ5Wuw+W9SF0MiZ7PbZhFWvLB9vdm5gBKDzOWIaQmM2sHBMkWwoO0PY5ftEo2WAkoGjAGftsS/8ELr+0zHm0B7CQmQ3/oG4kPEklphaF3twXl7EBnfGU+4xXhlcbu4V404y4C3OrMDpo1e+NCvAv4xXKjPt7rw+m73M4eqkCqZzAK6vM7QaleZQTP/RZqo2fhH9Dj1yfPktxSQ6iz177hlTTORrUNfXPg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(6916009)(478600001)(53546011)(66946007)(2616005)(5660300002)(54906003)(2906002)(66446008)(76116006)(316002)(66476007)(26005)(91956017)(6506007)(66556008)(64756008)(186003)(83380400001)(8676002)(33656002)(6486002)(86362001)(6512007)(8936002)(4326008)(71200400001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 FmxuJvUcAa0ixn3eRaMD973HCkIXN3B/4o7qNRioNN7rleLUixZhPzQf0+BRb5lwwp+aZanoogLbzrhg9fejBbyXTTOyMmjyWtwkI5FMAfKSAZFHJQBn3iVrnpYgEWQSrRs5fR9jhg+R+BhDBVV4IVKBVjevN5Jw/GRMeC56ARcB/gtDtQsHIMZ032JxaQW/6IXNOx2oqEklCLXC0eLcM1s9Pa3HyoHeTZzbrlyLRuG1BN/lsN8sLiHndxzkrKYCDZxd+WiTN4JsU5qos/qIWc/yIi6jt6sUoxf8leahsW7193+01eeGbqistm+FB96QLE+ec1lrNiNpg9rxCt2ud+VOpmuq0iUNtceCjn/aMxVTQjleVhU6lJcqLrldV9MSO1bA3G23OJWTY7SySfO9qZAvfeyeVhoCsqUhh9laXBSjY5ingYYjQsdBubKylMdrsC0h5CABdo+JjCmvOMSKKcBtNdZ2H/eddclOR5hzCxtw8RpjTIUWEha8gajN/cwPggcskkjFsiD51D3pDzh/QXyGnwlcGcniZ+o7lWdkCUlANQMQYI7iOPDycN0ovbJjs9Z6WoFfkaGuofPvbw/TM/qXzl+bAc1NoSIqMEUfH+cbkxBrebhcbVWBMQ/8yxgJwMVIwku9GpIZRB6hNyujWg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9CE107575A7F7E4BA56EA60574CC4410@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1909
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	151911f4-5ba4-41a2-068b-08d87b1d93b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zVztjICZx6/LUReo40fdzXBLE4kW9jH4neiw3Te2ZdaC2JB4C5HE8mWTPgy3lGAQ01B0irCnz9J+5IoJchdkVXHwA57W9vZFw1CqlIU1SQhf0gt7Y/kCEFa+BT8As6cLaNV9qKtY+QUsoZHz4CysmtsGPEOZdts6/Td6x8etwjmVkksSAp3W7hdzoN9Vq/Cfn8sK5KYvmM/oHKuyCWQqS7V+5CzNEhaXlzwhvKvsEbrmQyZiz2pNTPJ6moSgPF7xW8MU5wt8fnrlQv6BC5EXgmB1RNGg66nuX6/78I8g2Xa0AyxJtubPCQarUSScX1oQsl4vf0cNCsH+YX6cWn5ygdqolOGDs0SuC1RZG9gRA00rspzOGWKhcAy4jcgeMLfZa37HPqaPbXFA1kBwan35OA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966005)(53546011)(8936002)(83380400001)(356005)(81166007)(8676002)(47076004)(86362001)(70586007)(6486002)(36756003)(70206006)(107886003)(5660300002)(6512007)(54906003)(2616005)(2906002)(186003)(316002)(26005)(4326008)(6862004)(33656002)(82740400003)(6506007)(36906005)(478600001)(82310400003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 08:43:51.2323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80a642a-30f0-4d8f-dd4d-08d87b1d9856
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2506



> On 27 Oct 2020, at 22:44, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 26 Oct 2020, Bertrand Marquis wrote:
>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
>> not implementing the workaround for it could deadlock the system.
>> Add a warning during boot informing the user that only trusted guests
>> should be executed on the system.
>> An equivalent warning is already given to the user by KVM on cores
>> affected by this errata.
>>=20
>> Also taint the hypervisor as unsecure when this errata applies and
>> mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> SUPPORT.md               |  1 +
>> xen/arch/arm/cpuerrata.c | 13 +++++++++++++
>> 2 files changed, 14 insertions(+)
>>=20
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 5fbe5fc444..f7a3b046b0 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -38,6 +38,7 @@ supported in this document.
>> ### ARM v8
>>=20
>>     Status: Supported
>> +    Status, Cortex A57 r0p0 - r1p2, not security supported (Errata 8320=
75)
>>=20
>> ## Host hardware support
>>=20
>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>> index 0430069a84..b35e8cd0b9 100644
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -503,6 +503,19 @@ void check_local_cpu_errata(void)
>> void __init enable_errata_workarounds(void)
>> {
>>     enable_cpu_capabilities(arm_errata);
>> +
>> +#ifdef CONFIG_ARM64_ERRATUM_832075
>> +    if ( cpus_have_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) )
>> +    {
>> +        printk_once("**** This CPU is affected by the errata 832075. **=
**\n"
>> +                    "**** Guests without CPU erratum workarounds     **=
**\n"
>> +                    "**** can deadlock the system!                   **=
**\n"
>> +                    "**** Only trusted guests should be used.        **=
**\n");
>=20
> These can be on 2 lines, no need to be on 4 lines.

I can fix that in a v3.

>=20
>=20
> I know that Julien wrote about printing the warning from
> enable_errata_workarounds but to me it looks more natural if we did it
> from the .enable function specific to ARM64_WORKAROUND_DEVICE_LOAD_ACQUIR=
E.

I have no preference either here but i kind of like this way because if we =
had more warnings
they would allow be at the same place.

I will wait for Julien answer on this before sending a v3 for this patch.

Cheers
Bertrand

>=20
> That said, I don't feel strongly about it, I am fine either way. Julien,
> do you have a preference?
>=20
>=20
> Other than that, it is fine.
>=20
>=20
>> +        /* Taint the machine has being insecure */
>> +        add_taint(TAINT_MACHINE_UNSECURE);
>> +    }
>> +#endif


