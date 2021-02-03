Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF330E0AD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:15:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80978.148701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LkF-0005eZ-9Z; Wed, 03 Feb 2021 17:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80978.148701; Wed, 03 Feb 2021 17:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LkF-0005eA-5b; Wed, 03 Feb 2021 17:15:11 +0000
Received: by outflank-mailman (input) for mailman id 80978;
 Wed, 03 Feb 2021 17:15:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhc=HF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l7LkD-0005dm-BW
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:15:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b668b52-59b7-4391-86a3-39d0926cf479;
 Wed, 03 Feb 2021 17:15:05 +0000 (UTC)
Received: from DBBPR09CA0044.eurprd09.prod.outlook.com (2603:10a6:10:d4::32)
 by VI1PR08MB4302.eurprd08.prod.outlook.com (2603:10a6:803:fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 3 Feb
 2021 17:15:03 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::42) by DBBPR09CA0044.outlook.office365.com
 (2603:10a6:10:d4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Wed, 3 Feb 2021 17:15:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 3 Feb 2021 17:15:02 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Wed, 03 Feb 2021 17:15:02 +0000
Received: from a6cc49a97c2a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83011BE2-D7DE-490E-9E25-3A1674217C4B.1; 
 Wed, 03 Feb 2021 17:14:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6cc49a97c2a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Feb 2021 17:14:47 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6172.eurprd08.prod.outlook.com (2603:10a6:10:1f4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 17:14:45 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 17:14:45 +0000
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
X-Inumbo-ID: 3b668b52-59b7-4391-86a3-39d0926cf479
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzN44KkCJ3krwqY6/PWdHUONNqbR+L3AonRvJq6pmlA=;
 b=QaSmsqsg1FBeEcwbMf63DysKFVwibwxQiHpAhxK3h8LtB4PT72sO/ztiZ+oF3wOlpLNCo0QH4JBrE+0CPI6qtSIUPIE8gevHQscSll3scnP8D8k0rta4UvfomsxxEdFCFp0URlGpzAQ0IK0OS1WFS9x2YZQRfrRpqtbrR2gK/+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05a47b3c064fad7f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7Zg04LMF6akPsGdAXXSuh6UXe1Ms3NYV4JV+Z/wLph+iXjPetip1V+bklbdtK2WjJ3SBLms6+Mm7XbziSwwj41mqJsNSJqkDQT4zY9lugI6fza8pZfjmDzL+Yz6jSsTm1f/UvAkv1/5dhjxfppnomhkLaMNGHSo9Sjpz/GkbQgi9yDEbFbLPI6Vkj1QpyFdHi7DqINV6yjK288EesNoYNYayFRojrssy92kk9YLMhpH2jRilo1CoqHV2mQDu1/deyNuL/mZgd+FbNrLlStG7zi68vrclgeAnE+4WRjJgHLy19FI8xhtITKQXR7lmelEE5H4S3QJyTbfb+n8GYaDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzN44KkCJ3krwqY6/PWdHUONNqbR+L3AonRvJq6pmlA=;
 b=LX2Jb9ozk3x0+31MiOP1VrD5+QCFjDdULD/css5w/DmVaurk2EBvIlUVaEjHuWJF2XGcKz1juJH4BJbXmnvEj8TsBh5Dww3PFAt8DaUHhFeuN5REs4rKX8IJSNAO4A0pSBfVMSoTRvqAHmvFaKvrPcs3bC8rzir5UH8IHYrpU0HXsPCojBjM2G2gIomFEwnTd7LApF2o9XXBRHyJBkS9roQqxBA6OpGex3DjovDVdE1gfe6UVmbX9HMlGe5bhLKIhSNqOAstnc/8pKWrHG+AywctYrwWaxy6gr6L1kR4VPpLMvkZ3zUx/BuA+kuf3H6C+3SirzlI7OHb+IKMWZOdng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzN44KkCJ3krwqY6/PWdHUONNqbR+L3AonRvJq6pmlA=;
 b=QaSmsqsg1FBeEcwbMf63DysKFVwibwxQiHpAhxK3h8LtB4PT72sO/ztiZ+oF3wOlpLNCo0QH4JBrE+0CPI6qtSIUPIE8gevHQscSll3scnP8D8k0rta4UvfomsxxEdFCFp0URlGpzAQ0IK0OS1WFS9x2YZQRfrRpqtbrR2gK/+o=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "brian.woods@xilinx.com"
	<brian.woods@xilinx.com>
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Topic: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Index: AQHW9DbnaDtcsjSAAUiKSXHzYBU+iapFEnqAgAAbJICAAYoWgA==
Date: Wed, 3 Feb 2021 17:14:45 +0000
Message-ID: <86C6469B-2E50-41A0-A667-73E1E37E5C32@arm.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <C094E054-885F-4363-ABF3-E0FB4DDD7A2A@arm.com>
 <alpine.DEB.2.21.2102020937480.29047@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102020937480.29047@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33071f18-173f-4df9-127b-08d8c8673e65
x-ms-traffictypediagnostic: DBBPR08MB6172:|VI1PR08MB4302:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43029654B779C1C481C02585FCB49@VI1PR08MB4302.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qKrHE1SlsV2GUD+aR+rrVd6bncIDdHp1vMnAEGosxrzaEl7yNPguY988b32yPhLgNTy/c67WqpP5JfQAlxfukRmn+JqtkZD4oQ19K3+UsVYWeFq/bwtjgwsjZubhRIeAbEOLiQgqVkFGl97U9F/93dPL/owyblrDSbLy6TmeWBhy723gOtoDrqAnu/5bS+EsbtNXfTwWiO7BdWKxSG2eqdBKIGdsgTk0PucTtzzUGjPQwRVIzdB/12Fk1SKL67+UiRbYecjIgnsAQEnoCMy8VNxRxnGr6BiS5O4lAS0iAjiBmbGRcWl1DxyZFXaHe/zL50pTrhIHyEjZ75ICJpbNpyrST6nBfyvRHdAbgjBAgBHlwRezceLw0+pxZJyTYtUYvxc1UzIxWSkeiHv8k/jpOBEFOkawmI8m0b5B5uF3xqiYG6xDs/sD5z2IfSeTVK6huZ5LloEvRw7mNBDzpTNFT0MGWogfB5RveUewjQlihd7omjb9Ne960yDqWkDpF1QXMPhV610n8wTFdZACNbpY5TTcWIXKsu6i5BZ/n2VwWafOZSfvO2bpjOt8UC7zKv/mMnO3QLvPTAJawUf9V5jp6fuUAWB9EwvwEnF0Behgbq9qVPw4RQy0lTZDYnsvVzHGE38octkiTXr/KW4AQkF31iSdZVg/VPK4yLSfcq5g2NPH9JTTu7pt8vQNcpZWg4q8nm0J1uX7XhYxM9ZqG/Jm6Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(53546011)(6506007)(33656002)(966005)(478600001)(66946007)(316002)(4326008)(6916009)(83380400001)(8676002)(6512007)(54906003)(2616005)(186003)(2906002)(26005)(5660300002)(64756008)(66556008)(76116006)(91956017)(66476007)(66446008)(8936002)(86362001)(71200400001)(36756003)(6486002)(41533002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?seC5pCUTj7uDB2q/CsElEg95hELIhoo97nFVRgy0tj3Gs9cLodfznN16Hzg8?=
 =?us-ascii?Q?/LV+wh9F4rcOfp28cPjjdNfPLh46p/EIeW/nYfWKTN/e2ddSt8e3rGs2c+rj?=
 =?us-ascii?Q?3QcyhiKAyaLcwzLwElBmPs2J0pvGbv8AJ5erie3sab0sVBz+jCprDS8z3fnr?=
 =?us-ascii?Q?M+Bgs1scCRDdsFG2pWyu4s20xKijx3RzB2gOrduqBp3FzL1CSIGGYKdVCXps?=
 =?us-ascii?Q?6T9Zu9p1iFD5S1Xnmw5wHusEJU48wD7kfr4Llg6Ok/mqhuv07M2jN9hi027z?=
 =?us-ascii?Q?cx0YAc2hX9be+HyEf7HJOhJsBhmkMSmBmKQhrpWalKh2BOf1r53LpsU+YXEF?=
 =?us-ascii?Q?hqDrMEKRz4mI8kRa+NQWuYidBbufskXYU/wCx8nv63RTXtHUjU3x0CTBYR/S?=
 =?us-ascii?Q?vzgnW08z55f/Zyld0oBxPwKNtMVKjxPdbMDL6x6zg1O3ywE5kqat16cvJU1I?=
 =?us-ascii?Q?gLrvIkTQ61bVL1x2bCtdTJt3e1xyGfWxMQkVDTrE9C28nGCm1nQgrsMNH0Lx?=
 =?us-ascii?Q?m7W2OQNYUq1pd7V9Aa+R3ZYxGmoENbMbeTDCIATU3BxKHTTfXNTqDtiidouI?=
 =?us-ascii?Q?O3N9rN25dtqyaNx2D5QOFN4NS3JUFgwfn6C9Jn7JcH7XdR5RQu4Msn86Fnid?=
 =?us-ascii?Q?edzIZ2tcg1pggimkJgnI7G5EzOyW6BLPR37/lKo48zB5zj7L+o3Rn+C4Oxht?=
 =?us-ascii?Q?rGVyy5tQdA/rxS1YJ9ZfwGk7ocbJII4FUFOlg7z6g+7TpKBcfhoo2dgQKtWt?=
 =?us-ascii?Q?VknAL1QTLApnp7RjzhyHN3rQ0/lIy/Z0HEdTEMYiHy8HJo0l2zjZi/mvxUU7?=
 =?us-ascii?Q?NtRhWgxuXfiSCgLwyX7kclflBi/9ZT3kC9KdbUU9Ik8A/xOzJ556I9uprsyL?=
 =?us-ascii?Q?9Ta/C1TCcKhWe2KWYrkZLHwBVCtpPdUaAy+pMKB5d51gBD7OmjL2uWvxIz5a?=
 =?us-ascii?Q?Ns9w6ggtDkOl0x2NuDSJhPd6gKCMLDT1BV6vBvGmuMfGdPH6i+uMZlQuReMT?=
 =?us-ascii?Q?MbkC/8ZtQvCUckPj83DZXfa+gAeUTT3agg7+UJLi3/668tYhiLup7jRl5jGY?=
 =?us-ascii?Q?LsO/wvGVpMeQRi6geS52aPWgWqeVq2zGsU7my63AmbXT09ZR0Gb09EvhkqPy?=
 =?us-ascii?Q?KIBySLLr6vciOtXUXVZ5cN51WucVCMc4jrnVOkgN1t9113JoP9CITcnv1wVz?=
 =?us-ascii?Q?TnyY87zq0Q7ll+6gWHN0DN6/l5PBWZTBnr0jyQDVO2LRXIywIGvYgK+6ZM7A?=
 =?us-ascii?Q?jtqMHGT7MCQYIaLSde7wvpkgbGWGkL3ke/ZZBRyBXDkS/1l81hzADeqn9BKX?=
 =?us-ascii?Q?dJ5dOU4hLK+ZPHhg6VUE0jSx?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <288BC99701E45342AE002B52E05287C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6172
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e12a96a-ba57-4cbf-c9bc-08d8c867345c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LfgN3oLOU+hveokXk1d2aoKDBXD+k6OGN1XwM4L0du7erhBaqvnmZjranXCu4LzYXuBnOD96tcuiacNxSN3Q05/mNjja4M5rOOamTGCZ72wNRKtKiZIeT7/hSxrIO4v6CV41G5q0vinYH3flW+E8nJOOGS0QTAx+ZmE7PWitimC98L3iFXQP0wKzPRO9TXzamkBkfhhq3hjXAWjU+s0awVRE3nTaWhF0WJ5HmHfd5gt8ZbbFVRzQ51QWy7oHnIoQkqDwdtIr2c2CN9wHUyLVvo+k1AfKCjSWVXaB4eef+7W+Ged9Dq3j/fdxnIqHwmFV8n2ddQuRNcaclOh4nr33xioYnd3mHwSJaCpgSeMvzKOZDDOB28AJquR8t0edufMVGfx/3BIESwmRSitwfc2Hzkbcpfy600o/1LRxgE7KcQMkfanxv7VW6V1dpmoGN86cPT1+vAbzF4P0pZzM8WYiTRC9GWH/CvYQIwZUts5UrdGOtSbEHX14rWYQx4ytcHg4/JcM/ceyWjrjkpyIt2B6JQLtaMkkYd9HdLGu74ic+kFWXl+GgEPjs4XHulESpCTIyPmtThIUhgieoty1uS+fI3D8S9Hkg/zUY8sBqBoU/sTHTbfQAQ6mE99DqlHy+jc7QHPIr+jcinXfpto9rt7Syp/3txizypVoWY2QhflBEKOHz+AdpqisXpqRV3SO6LUkrkUlJU79i4GDyIhcbStY5Zn3hwhLCWmkQaSz66tqwqw686/1TiIDikDubmScLk5zWYXcXEmNUy8IrEevrSK0wfRDghgd33NlAAtr5vYN5+I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(81166007)(356005)(70206006)(70586007)(82740400003)(478600001)(36756003)(316002)(54906003)(36860700001)(5660300002)(966005)(6506007)(4326008)(336012)(2616005)(107886003)(186003)(8676002)(83380400001)(6486002)(86362001)(2906002)(6862004)(53546011)(33656002)(47076005)(82310400003)(8936002)(26005)(6512007)(41533002)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 17:15:02.6863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33071f18-173f-4df9-127b-08d8c8673e65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4302

Hello Stefano,

> On 2 Feb 2021, at 5:44 pm, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Tue, 2 Feb 2021, Rahul Singh wrote:
>> Hello Stefano,
>>=20
>>> On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org=
> wrote:
>>>=20
>>> Hi all,
>>>=20
>>> This series introduces support for the generic SMMU bindings to
>>> xen/drivers/passthrough/arm/smmu.c.
>>>=20
>>> The last version of the series was
>>> https://marc.info/?l=3Dxen-devel&m=3D159539053406643
>>>=20
>>> I realize that it is late for 4.15 -- I think it is OK if this series
>>> goes in afterwards.
>>=20
>> I tested the series on the Juno board it is woking fine. =20
>> I found one issue in SMMU driver while testing this series that is not r=
elated to this series but already existing issue in SMMU driver.
>>=20
>> If there are more than one device behind SMMU and they share the same St=
ream-Id, SMMU driver is creating the new SMR entry without checking the alr=
eady configured SMR entry if SMR entry correspond to stream-id is already c=
onfigured.  Because of this I observed the stream match conflicts on Juno b=
oard.
>>=20
>> (XEN) smmu: /iommu@7fb30000: Unexpected global fault, this could be seri=
ous
>> (XEN) smmu: /iommu@7fb30000: 	GFSR 0x00000004, GFSYNR0 0x00000006, GFSYN=
R1 0x00000000, GFSYNR2 0x00000000
>>=20
>>=20
>> Below two patches is required to be ported to Xen to fix the issue from =
Linux driver.
>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/=
drivers/iommu/arm-smmu.c?h=3Dlinux-5.8.y&id=3D1f3d5ca43019bff1105838712d55b=
e087d93c0da
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/=
drivers/iommu/arm-smmu.c?h=3Dlinux-5.8.y&id=3D21174240e4f4439bb8ed6c116cdbd=
c03eba2126e
>=20
>=20
> Good catch and thanks for the pointers! Do you have any interest in
> backporting these two patches or should I put them on my TODO list?

Yes I am happy to backport these patches to XEN.=20
I will send the patch for review once 4.15 release branch out from master.
=20
Regards,
Rahul
>=20
> Unrelated to who does the job, we should discuss if it makes sense to
> try to fix the bug for 4.15. The patches don't seem trivial so I am
> tempted to say that it might be best to leave the bug unfixed for 4.15
> and fix it later.


