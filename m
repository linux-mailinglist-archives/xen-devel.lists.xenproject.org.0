Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41759598692
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389644.626713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgz3-0004eG-9l; Thu, 18 Aug 2022 14:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389644.626713; Thu, 18 Aug 2022 14:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgz3-0004bU-5k; Thu, 18 Aug 2022 14:58:57 +0000
Received: by outflank-mailman (input) for mailman id 389644;
 Thu, 18 Aug 2022 14:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GL5l=YW=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oOgz1-0004bO-9v
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:58:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 463ebf9c-1f06-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 16:58:53 +0200 (CEST)
Received: from AS9PR06CA0284.eurprd06.prod.outlook.com (2603:10a6:20b:45a::27)
 by AM8PR08MB6530.eurprd08.prod.outlook.com (2603:10a6:20b:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 14:58:51 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::e2) by AS9PR06CA0284.outlook.office365.com
 (2603:10a6:20b:45a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Thu, 18 Aug 2022 14:58:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 14:58:50 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 18 Aug 2022 14:58:50 +0000
Received: from bb20366a84f0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 510E77AD-D118-489E-81F3-4359CAEBD841.1; 
 Thu, 18 Aug 2022 14:58:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb20366a84f0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Aug 2022 14:58:40 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 18 Aug
 2022 14:58:37 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 14:58:37 +0000
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
X-Inumbo-ID: 463ebf9c-1f06-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eFD2MxtVF+Xt/Uc8TMxe3UusMwB+vYFgmIY5rpz4E/ICvtkWpJB0IxG1/yG/BG6i3FKLntU8j2rTGCeXMafjXyfixQqdTOH0thsOEjTMScGA1SjryMvWjMP4pM0TtFOJWpT+DPIWNcGxnga+JZMd+mgo53RoZMuBMPN44Fjo1/FgAbtidnVxu0q4np+0ZYiYf80jyJOjvpuTvv3LaMw9MDCjah0vFrwS2NVIIniVFQ+0JlyhQCjEMbKCpx81IXdBDQ7pmUiwOKE3wa13ool+dAGt8WbQtzFb3nAV+bdNXA/y6kXQcQ3xcZ+mXFGITqqj8zPCS6I9Orr06B92ORwGPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeBGDWK9BVixJ/8oPcXiVSRkQpLynfRHlAjh9I4vS4w=;
 b=L2JYuDguWG6oXiOaJ94WkDtOXEXOJ1F+fs8tA4EjTvo2dWyziOCSkYClXs/XZntwBxYtnFVxQxtzK0GtWYrAaKZFMdv9UjCnVRHld7NABFWBcikK4yWJ0ATbW22/54Vy0Ie9d97Ikm6DdKm2neF5WlMeTayDTL2OjhoZz7Rbv+Ihkp8kBkweDFipOjALzqMdu72eyHkiETr+7PyHSGI3j1Ks26vglQC2/fXC6Iz5rR+35C3uxvEFhRwSf51LetRcvJazMcANGd+RkRbPJDK/BrtLnNgB0S5B095b8Q6RHJIbXDBv77JootquyUZWOPJuckHd42LHbqJiAG+BG9dE7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeBGDWK9BVixJ/8oPcXiVSRkQpLynfRHlAjh9I4vS4w=;
 b=4h1s4HhptxNVoY0wwHAKrcFO5oXBJqyP3D5eOWkY3s2ygpcY/QxPGw2+lf+FUFskkLOGjMHrbN9y7eoZUkAuMpv1Poea0RexQ8NmKliyuMHcr6S+J8VQkYatOqkUNCZSEXxrdJ+lJBROuUm6paFG5d67dUbemRl2TwVS871S2yc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29c05e77ff714bd6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJgZungl41T8Yby2MW3qECBYj8P5zzjdT+4fhd566o18b60A7C2efHCmGhq321W3W5Ko0ZB7FpjlFlaR8fdKMVPVI38oPy/xi5kH7KIvifhPRgHiN08poME48574TOBNRR3osPtx4ek7JT5S5oFVQY3y6n8Kl1Jk13l26sfd6hdPRcccz0kI6QAwrHNktK/c0sLgDbcIklRF32f5/P0gcd56y28iRJUCGGEI20GMC2LuMBcwKTDhStuywUgnc9we9TLQB6L01PMbcEg3XyC/56FDPGJ1ehwM1BeZSpzI/ISbvqVlqgDzCLfPkdlV+JB4wDS1z0wqueRG3fbNzU0T8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeBGDWK9BVixJ/8oPcXiVSRkQpLynfRHlAjh9I4vS4w=;
 b=L50h8jNQpz6XeLse0sHxvGeSPDMd5rX200xGVzzeNCSaaD+DJG+E48euOp0iMGwN5vfHCY1cCjlg7fWq6+iGabdtShjahWEZTaxsX60W3mLoQSyhoxQDGYulruZVgzhhEsdj/9/be9mwVT5rwcrrDbX5+ifaUr0QYaUUdFMVfcuZwDtVrCZeuU/gdDTZeFBCI0jh2dJ5kd7GQRRm6QHE2VWIfhZpfYdgCFmHS7hn0J3MaUqHeQpD/cV7DIlqXmqoCH6GAjmTOrKBzgCKk7S527F+cgR3rCLzYbon9z+9xpX+6DTpX/HYdEedW62lfMYPn2xCcnrA6exH9W0MZnqD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeBGDWK9BVixJ/8oPcXiVSRkQpLynfRHlAjh9I4vS4w=;
 b=4h1s4HhptxNVoY0wwHAKrcFO5oXBJqyP3D5eOWkY3s2ygpcY/QxPGw2+lf+FUFskkLOGjMHrbN9y7eoZUkAuMpv1Poea0RexQ8NmKliyuMHcr6S+J8VQkYatOqkUNCZSEXxrdJ+lJBROuUm6paFG5d67dUbemRl2TwVS871S2yc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v2 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYskgSn+BMkn6XSUmZynj+RN74K62zNKQAgAGMxwA=
Date: Thu, 18 Aug 2022 14:58:37 +0000
Message-ID: <6FD6564E-8B4A-4A83-8E21-7E156878B2F9@arm.com>
References: <cover.1660746990.git.rahul.singh@arm.com>
 <26fe963007e0a43b8fefd915027e90ddace1be73.1660746990.git.rahul.singh@arm.com>
 <114e88d3-0ec6-d51f-af41-555f79403b29@suse.com>
In-Reply-To: <114e88d3-0ec6-d51f-af41-555f79403b29@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 46201350-fb17-44c6-e7bc-08da812a2946
x-ms-traffictypediagnostic:
	AM6PR08MB4279:EE_|AM7EUR03FT006:EE_|AM8PR08MB6530:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gp8ZkvFRYEch+EBZgmet8Z5/19DjADCmRgfhKcA1RaGA8dVYmAGWAg1i231GOzWoTCohFrKbCuff92FqwoX1zxDbPCVYZc+D1GX3jgH7m6onLu2RgkDyHA9xsRgJYqX3i2ILpkTEAAEmDTAQ8gV3eB5N9guDHL0365VKRZB70IqZqwhgWcB51SvFIszUngbwuKLDtSr8bmk/teP79UqVWFXheeF6u5tZes0ZUpz6+3OkM+bkWTPHYPNSsnaUL4g9PvGi87MwFEi/o1ab3OaYFmsVGm8XQlSlDMhzgVuHWdP7lXAbBjSjS4fHvyvBxFVOmNhMeEDdNR5ABxsQiP6uY9zYAcPCLtZy4QEqkH1IECMA7qWcHUKLEN1Z3MmXxH0ibV5HyAjcovzzIMOWZp9VspSJw6kp408lLkder8JyADldjYTocasD6zXXRe5rRmIrJ7P65oBe0/EnuySKsnsTJiDbpnGO/5gVIMKugbTS9WecnEJnx8rPa+NqBwWbPfTFx+KNIlGMkOj1M+Ezzl5xtW4HVNebqpdTl3rH3Q/4tAYDtjOiofAy33auozOfmtgqzLPt3YmKc9AIzPMsmp1geV/8OlPGF4JQs+DyHQ8BkC5FEpPlgY3cy7+fesQHDws7WyY4+918KVjnatFMai6yAvMOfS/huO+rgs9bIriKUcgtW5pbaoqwaH+w3kuovhJ08TsVTf/Xyyuv+D6pBmer4tZCFOfoUxGuoAvw0qRMUEQcG3MLUJLr5gFyKibjS0U2IHhs7xyr5696IGzrRXUxRJGI86BnGz2+1EPwSwu8fCU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(38100700002)(8936002)(86362001)(36756003)(2906002)(5660300002)(38070700005)(71200400001)(122000001)(6916009)(6486002)(54906003)(41300700001)(6506007)(478600001)(53546011)(66446008)(8676002)(66946007)(64756008)(66476007)(91956017)(316002)(4326008)(2616005)(26005)(76116006)(66556008)(6512007)(186003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <75B2F27401C1FE4D9AE4AD48142A68E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fdd56bb6-5630-4183-5133-08da812a212c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zttbBa/XumsLGEPzj2CEHW88JBhdevKrhRpTTGtKcOufS8wb2kaazoBl99w+B70HP53uH5roiFjzpISEkVqSkgkl+4157IBGfub7QIX7M38+8cgzunKrnvRlgsTyEhnvJNLbRYowpRY1XYQPATwFrOMI9x3XqO28tXH6HOQ60gh3y5TdYL5kjxN/g+ToHiUQRECQsX6f1fHKdDa9G9torA/gYRak4HvPBnOj4xxrrK7en8URY8egv/utPtoXvRoxnI+dJ6pSDIiB6Cq84xf9s1NHoaut0Kqp/nqh+Bvvuprjr0UABt8ApKm2C+QMdNrRvXrRIAu+whR/E9u9Y/ZA5umPhPhQJHqN8EArA7ULfy7MNYIYYfXqqo9F9oEXcPaTsnuJ+COYLu6HVX1Bwzrv2hxV5Wo6aJ3eRZio5s9vnPwlEczV35hCF8AOnz4MyEx6/lDY+SQ06OBO/jkHqZl1RAQRcbk8turNswwjcQ6W4KneMek0r8aQuixsblzPJ+R0TlKTm8p6BPGX0cHbzCT8fz/S8NSpKxXsb2HbKA/RZmSAqW+9ShuyHYgfOHncw0htCB94SOYhNf1TFnR7DS3esxNLOkfP6up7LpqjgbhqSh7TWZ4mw+h/jOOKZDEKH46M1CNTX4/CglRM6s3nmA0OXp2TVlPj4vB9Crg4XZeM7TUeTodyH+8FJKME2FsmJeVXr1+7PQwzfPpi44/EiW2zQBctfmgp8wm6G3wKAVo7mfUhTJ2nab1zRUVJMXq5HWIYYMOzAXGrBNvimwVfSvT6NA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(40470700004)(46966006)(36840700001)(356005)(33656002)(6512007)(26005)(81166007)(6486002)(82310400005)(82740400003)(41300700001)(8936002)(6862004)(40460700003)(478600001)(86362001)(5660300002)(53546011)(6506007)(2616005)(8676002)(2906002)(4326008)(70586007)(70206006)(54906003)(316002)(40480700001)(36756003)(186003)(47076005)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:58:50.6375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46201350-fb17-44c6-e7bc-08da812a2946
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6530

Hello Jan,

> On 17 Aug 2022, at 4:18 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 17.08.2022 16:45, Rahul Singh wrote:
>> @@ -363,6 +373,42 @@ int __init pci_host_bridge_mappings(struct domain *=
d)
>>     return 0;
>> }
>>=20
>> +static int is_bar_valid(const struct dt_device_node *dev,
>> +                        u64 addr, u64 len, void *data)
>=20
> s/u64/uint64_t/g please.

Ack.=20
>=20
>> +{
>> +    struct pdev_bar *bar_data =3D data;
>> +    unsigned long s =3D mfn_x(bar_data->start);
>> +    unsigned long e =3D mfn_x(bar_data->end);
>> +
>> +    if ( (s < e) && (s >=3D PFN_UP(addr)) && (e <=3D PFN_UP(addr + len =
- 1)) )
>=20
> Doesn't this need to be s >=3D PFN_DOWN(addr)? Or else why is e checked
> against PFN_UP()?

Ack. I will modify as if ( (s < e) && (s >=3D PFN_DOWN(addr)) && (e <=3D PF=
N_UP(addr + len - 1)) )

>=20
>> +        bar_data->is_valid =3D  true;
>> +
>> +    return 0;
>> +}
>> +
>> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>> +{
>> +    int ret;
>> +    const struct dt_device_node *dt_node;
>> +    struct pdev_bar bar_data =3D  {
>> +        .start =3D start,
>> +        .end =3D end,
>> +        .is_valid =3D false
>> +    };
>> +
>> +    dt_node =3D pci_find_host_bridge_node(pdev);
>> +    if ( !dt_node )
>> +        return false;
>> +
>> +    ret =3D dt_for_each_range(dt_node, &is_bar_valid, &bar_data);
>=20
> Just as a side note - I find such (the first instance here) uses of the
> unary & operator odd. The same effect will be had without it. So all it
> does (in my opinion) is make things harder to read (just very slightly,
> of course).

I follow the same calling method as used in map_device_children() function =
in=20
file arch/arm/domain_build.c

>=20
>> +    if ( ret < 0 )
>> +        return false;
>> +
>> +    if ( !bar_data.is_valid )
>> +        return false;
>> +
>> +    return true;
>=20
> Simply "return bar_data.is_valid;"?

Ack.=20
=20
Regards,
Rahul=

