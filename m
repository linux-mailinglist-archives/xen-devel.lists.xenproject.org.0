Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87C31DDA0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 17:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86366.162129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPzo-000449-Ic; Wed, 17 Feb 2021 16:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86366.162129; Wed, 17 Feb 2021 16:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPzo-00043k-F5; Wed, 17 Feb 2021 16:48:12 +0000
Received: by outflank-mailman (input) for mailman id 86366;
 Wed, 17 Feb 2021 16:48:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrto=HT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lCPzm-00043f-Gp
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:48:10 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54b3872d-771c-4bf9-a166-02dae3546360;
 Wed, 17 Feb 2021 16:48:08 +0000 (UTC)
Received: from AS8PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:31e::15)
 by AM5PR0802MB2385.eurprd08.prod.outlook.com (2603:10a6:203:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.39; Wed, 17 Feb
 2021 16:48:06 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::a6) by AS8PR04CA0100.outlook.office365.com
 (2603:10a6:20b:31e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Wed, 17 Feb 2021 16:48:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 16:48:06 +0000
Received: ("Tessian outbound 46f6cf9da5e8:v71");
 Wed, 17 Feb 2021 16:48:06 +0000
Received: from e898bf6028c3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9389E49-D43D-4DD5-9858-8EA1BBAAEE17.1; 
 Wed, 17 Feb 2021 16:48:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e898bf6028c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Feb 2021 16:48:00 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5726.eurprd08.prod.outlook.com (2603:10a6:800:1b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 17 Feb
 2021 16:47:58 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 16:47:51 +0000
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
X-Inumbo-ID: 54b3872d-771c-4bf9-a166-02dae3546360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWAmjMiwA8AKar4agnndqNS4ujLBO6/4OMpatASobmI=;
 b=ARKlRwYI2YOpbRmmbkkMjI8GfCAdWNWMYvDZm6UZ/9vITlPuo2VMHHvIjJYxCcsDISY/zgvw0PyH1cSucEknnMfiCNiWYSsPOc1KyvWDY5JEQHA9e8fyXHSo8of1gyz+wY2DOCZ+I+zlaSPKNa8rg35d/YQajtt/De4cOgidmQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19543790204007ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPUIF7aHN5TQoGMzOVpqvrI4AALrCQKaaCG2UwSWh1GrTZCWrLMi979AVGeg6Sbm7x9Z7m8FqOfj/kJotug5TI51QPPS3slyfL4pBdFr0YhfvTpgSG/BfKW/MU+9DhoDazj/PHFl+SBn/cBDIR897EvR17//2AuOvJlTBN+zd8n8dN4gHicsiTmAoNjBFKRQYX7xpxnjbwuRK8DTGYBO14SREHDhZ8BJ/pBrZHmF3ByaAHH3l7/+Y+PnHjQpqicHMBc6nXxYu3hz2McCwlge1MWvV6JYDUoH3YjJIuSGZJtiGa9RddZ/VlYXV93dIrmHKEcQvMDgJQVgwQDl4a+yfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWAmjMiwA8AKar4agnndqNS4ujLBO6/4OMpatASobmI=;
 b=MGwlTmX20+dJkjWUm/wTVujvnlnyNMid0mF6A1dSLUksOip/rE70RhELEoaqPVsCNu5X/qL0e+Znj65JNaIT4DgIL2uRdlL8yWChy9dyXzqe1keGJj2INMXL8iDARmKU9rJ6Fs2wLXKBtZyGqYO3Nlm+eqouN6l5bHvUt70aIZrDyHEp18744CRs5r6RjRaeDaolxwqvu+CMDvjRsf5qOjqiKSieXz/sbv6J4JgZghDty+F5463Ff5qyQvUKyDfQpWeibmu9MJ0D2V0x/ReHQuZ2LG5jKPUrwaHfmxoC/fvb0oiUdwMG2ucwSEPtB3k4+pvW8BYrXGn/9owlHbzjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWAmjMiwA8AKar4agnndqNS4ujLBO6/4OMpatASobmI=;
 b=ARKlRwYI2YOpbRmmbkkMjI8GfCAdWNWMYvDZm6UZ/9vITlPuo2VMHHvIjJYxCcsDISY/zgvw0PyH1cSucEknnMfiCNiWYSsPOc1KyvWDY5JEQHA9e8fyXHSo8of1gyz+wY2DOCZ+I+zlaSPKNa8rg35d/YQajtt/De4cOgidmQY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
Thread-Topic: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
Thread-Index: AQHXBNDUDoMffJM9X0qFA5iW4kfZOqpcCj0AgABx1gCAABGjAIAAAeqA
Date: Wed, 17 Feb 2021 16:47:51 +0000
Message-ID: <49FAB3DC-AA0B-4E71-B435-315EF99A76EA@arm.com>
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
 <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
 <505CE19F-B324-4DE2-8EC4-D885780FD17A@arm.com>
 <463b0594-a78b-3f9b-e816-2cbd2a1d16dd@xen.org>
In-Reply-To: <463b0594-a78b-3f9b-e816-2cbd2a1d16dd@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ee9e3a7-d0c0-40c7-5bd7-08d8d363cca8
x-ms-traffictypediagnostic: VE1PR08MB5726:|AM5PR0802MB2385:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2385E6457DC0C153D3FCE8A69D869@AM5PR0802MB2385.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lpkjjXLnfK+Q5P9sp5WRQVGsxXSWTgwHPIr2bxkY0H0KFr6+dr3P2Vle/3eX3mLL3CMNVIUIRP3fdp5oRDkbj609Mg3N73KoNcKT3hiJKpoiJHQyRZe8vJTgYlgwNffljkAYvlw5u6hE3SLV3S7NyqpaE2yZY4Rc0y1yv7lIQQE1GGtLSCuCeOTj9OvER2C1EahjBYtvDVZq37emCtDR1QT8d7v1zZ0+0IWGgg/cWaUmGVio3z32EOnT12Mi7LfMyifGr0MR+llJvf/78k7mJZjXHglTjsH2B2nAnvZGPGahVgVzkYqgVY3opezXx6kKBLAdPW6sSYhDsq9IRzfy5Hz9o7B4UfrbE0LyXZUdlpMAtnK2mffM6gjFv30cCHM498r4G2fPNMebIYxoqOdNS7/cRBvOqTtdQ+CL98f/u1tgWec47s/4wHRva0NfZcTWPvGjAhDx7EGOFjFqHZL7pAa7+dZmC9Hezs5WcmsVkp2Fq81CjmYZL1e3tiOtDZYp5kMTPKUxy6WXau5i1RYRglLPEr6Wt2vWFidO1NWfd6sHJXmq5UIGjmA867oX3PAhg4XAspzrNAZeIB0uPntKyg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(86362001)(2616005)(76116006)(91956017)(316002)(6916009)(66946007)(66476007)(66446008)(64756008)(66556008)(33656002)(6506007)(53546011)(71200400001)(55236004)(26005)(186003)(8676002)(5660300002)(6486002)(83380400001)(2906002)(4326008)(8936002)(54906003)(478600001)(36756003)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?S3ZpTnJCSG51VnNIRjdSamRod0o4b2NrN3ZWZXhUM3Z4TE9UL1BZandDNkNO?=
 =?utf-8?B?TFRMYkY2VGV5N2pXb3h0SXZ6M2lKamlPL2Q1Yk9YVDA3RWtlbFRwcnZnRVQ1?=
 =?utf-8?B?YkxaRlR2Z0xnQnFlbGdoeW9NZGJVZWVka3FhSkNPYnkyOFVIa3FIQ1c0NFVJ?=
 =?utf-8?B?WlFYYzZXWFFCL2Zkc05qQ0NpVFRocHB3VmZiTnBCa3d2QjBmZExKdDBxYkEy?=
 =?utf-8?B?L1lHb3VqUjJsZmdjcnI4RDJWcHJQVXM4Z2tIQjhWMWttTm0zdkZmcUR0aDRy?=
 =?utf-8?B?S2lacEcvc2tKUU9oSFVvNW9JTlRGaW1ROXZGSDRIZ3VFSUtKTVJyNlVvR1lN?=
 =?utf-8?B?RWorbTRnZkZkNVg5VnFPZWRaQ3luYU01Z0x6dU1yaXRjYkp5YVZ0RWVqZ3Za?=
 =?utf-8?B?SExZNzFWWlF3Y3VVNDl2SHNYOWdkM0NkeDBPR0gvb2JWVHBtZ0hCSTF4Mk84?=
 =?utf-8?B?N2U4eFdlWXRFVlh1NGhKQ04wYm5hOTMwdEpHcGlvRURKNW5uSUQ3djlRcC9h?=
 =?utf-8?B?d1JUenhidGFlbjFxRFYzQnZEb0g1bUg0VFVjVWwrYWNFN0JOc3JxUGVyZzlX?=
 =?utf-8?B?TFg5d3JUMXpSSHRpdERBTVU2WFlmalRPNHdMcSthYkdGWGk1ZElOMjBEMXRp?=
 =?utf-8?B?M1EwazRMb3RsSXRyTTFKMHNFd0lGeXdmYVcvMmFqNnhTZHlYbkNpWEdkU1Rz?=
 =?utf-8?B?ajZOdjJGYTYzaHRVMEhDSHpRZXpxWnRGTnNwalN5dWJPY25LT21KVlQzWFhD?=
 =?utf-8?B?bVZWaFFTdXBsazJBT2RQaFVjWkdNeGU5Q1pLaFc3VUZkYVdTTmg1ZVVsa1BY?=
 =?utf-8?B?MmUzTXViUkI1MTFjZWN6MktrT3pSQXdTMlpnS0hlN29lSjJIb3BJb3Vhc3ZJ?=
 =?utf-8?B?bXB4NGZMQjJIMjFTbSs3S3pWd1lVdCtUL2NXcXhCK0lVV2d3Vjh1RWR6QnNT?=
 =?utf-8?B?WENTRCt2emdLcGZLbEJnYlJJemo3UkJacldqUlc0SitQbFowcUpDa1BtNGdH?=
 =?utf-8?B?Z2JnazJKQUlFeER0YzVTQ2V6NWcrSzFiajhwNTFoNHdTRlBtMUZxZGNlcEVJ?=
 =?utf-8?B?TUxzME1PSXJrMTZacEg3cTh1cXJkZUd2T3RPdGJ1Q1lrSmRNWlUvS2ZkejRM?=
 =?utf-8?B?YmJOSDBkeEpFeDZqaU1pVWs2WXI0a204RjlOdUZjMVo3MFJhbkd0WnVLbUNC?=
 =?utf-8?B?NW43WkhkaElaYVlXcjVXRkkvRGFYQlpIQml5Ymloa3VnTW5NN0NIVi96Mkkx?=
 =?utf-8?B?VHdleklCZmlOenJVeVQ0MHgyaTA5SWhlRzNXNEVLNElibncvd1JrU3FzYi9x?=
 =?utf-8?B?MThIOG8yT05RVGpVaElhSndmbm1lbDZFS1pMMURhNGVsRjY0M3BOeGZDNTFR?=
 =?utf-8?B?Y1BYdEJvd2pNZ0llQnFMZCtVcVU1ZnhFT1JndSsra1pzUDRuVjBvaFdlWlRh?=
 =?utf-8?B?Tnl2SVdmcEI2Mmd4RjRYaGtPemxPRXNYNUpnK3M2YmRsRFdvekROWWw2NEh5?=
 =?utf-8?B?RjgyS0g1bndvUWdkaUNDL3ZiOUVldGpTUEI2NFZobXJ1ZlpIUUtsdlE3cms0?=
 =?utf-8?B?b3RldGw2cHhjNE9hK1hMNlRFdTkrUFVRRjZxY1AwOGtzVWNiUUIxTmRBb0ZT?=
 =?utf-8?B?NktTQWRwM0tEV1NvQm5KN0RVR2FqWWEvMGU5bW40eFVJYUpteGZBaW1pTGR6?=
 =?utf-8?B?ZVZUYWYveDhpSmYzNGdCR2Y3enRhVEZ1WDNMUVlpblVWNzhFb3krb0dUejdu?=
 =?utf-8?Q?VZZlQ35BcseJb3WeWmCwlbSFtPZlNc/7kfbcKlh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9498A896DA13D49A57AA4DE5739ED9B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5726
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e22f453f-514a-4bad-3dfa-08d8d363c428
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VzdlB00nRsvIkMHStJJcgiFRwKqLxqv6ZgugY+yoL02LQyGR1apLEEB0lVewfwlzkck9OfawokJUdS7hfbDn256gHbuRM12Trv1A0mW9CUB8SQgC36z1UiltE0kZmLxUczJcuqmJQ75bU/9MtV4J7XBS3YurC4FIEZXxLV7QkmiiMoBd0/OeqMH4F2ohBmUrjTaTfAe1dcNvSAfw1HaBA0DvVfhFLsVBHivl3z/VlfASRLS3KysWbVyRE44NkLbFQN1YtlkqWdntt1WgLt19ZZ+WHtA2cT6zxcqjaDLkuNYHC8O/6+lO9Bp//PquU3nxpVFXYMh6mqWKk63zKkBEWOmx2oue1btey8G6QvWWtuv46qNIwh7bvzW1HBX+X88aI/ny7nEV63j/yu/7XL98/7zbgQjuiwfYYhBAkx1gks/IEmSaEUytu7N4IcEkBSVvoy71yrzUA5Tx7/v43+YK7EBxbxFjlV1VD8zh4SoSxhY01f8k3D6FdGi0b9MRIRxknRZxw9kpzyVyccv2bKq+YXPS8Mglh1zWitc8kEh8Ow4JwbqYgX7RLCQ4CwRID7qhGqtU/LWVV520zGbGtRQqkgNpl9QpfVQNqIUmBW3pDneeMmeCZWNjATtDLQKrjaRHkD6Zeybxn7YUOMcvPphdXpbEr8/Qd9c6Fatn1olKRx0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(46966006)(6506007)(53546011)(2906002)(8936002)(6512007)(4326008)(81166007)(47076005)(8676002)(5660300002)(33656002)(36860700001)(83380400001)(336012)(36756003)(186003)(54906003)(26005)(2616005)(6862004)(86362001)(478600001)(316002)(82310400003)(55236004)(6486002)(356005)(70586007)(82740400003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 16:48:06.0874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee9e3a7-d0c0-40c7-5bd7-08d8d363cca8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2385

SGkgSnVsaWVuLA0KDQo+IE9uIDE3IEZlYiAyMDIxLCBhdCAxNjo0MSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE3LzAyLzIwMjEgMTU6Mzcs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBCZXJ0cmFu
ZCwNCj4gDQo+Pj4gT24gMTcgRmViIDIwMjEsIGF0IDA4OjUwLCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiAxNy8wMi8yMDIxIDAy
OjAwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IEhpIGFsbCwNCj4+Pj4gVG9kYXkg
TGludXggdXNlcyB0aGUgc3dpb3RsYi14ZW4gZHJpdmVyIChkcml2ZXJzL3hlbi9zd2lvdGxiLXhl
bi5jKSB0bw0KPj4+PiB0cmFuc2xhdGUgYWRkcmVzc2VzIGZvciBETUEgb3BlcmF0aW9ucyBpbiBE
b20wLiBTcGVjaWZpY2FsbHksDQo+Pj4+IHN3aW90bGIteGVuIGlzIHVzZWQgdG8gdHJhbnNsYXRl
IHRoZSBhZGRyZXNzIG9mIGEgZm9yZWlnbiBwYWdlIChhIHBhZ2UNCj4+Pj4gYmVsb25naW5nIHRv
IGEgZG9tVSkgbWFwcGVkIGludG8gRG9tMCBiZWZvcmUgdXNpbmcgaXQgZm9yIERNQS4NCj4+Pj4g
VGhpcyBpcyBpbXBvcnRhbnQgYmVjYXVzZSBhbHRob3VnaCBEb20wIGlzIDE6MSBtYXBwZWQsIERv
bVVzIGFyZSBub3QuIE9uDQo+Pj4+IHN5c3RlbXMgd2l0aG91dCBhbiBJT01NVSBzd2lvdGxiLXhl
biBlbmFibGVzIFBWIGRyaXZlcnMgdG8gd29yayBhcyBsb25nDQo+Pj4+IGFzIHRoZSBiYWNrZW5k
cyBhcmUgaW4gRG9tMC4gVGhhbmtzIHRvIHN3aW90bGIteGVuLCB0aGUgRE1BIG9wZXJhdGlvbg0K
Pj4+PiBlbmRzIHVwIHVzaW5nIHRoZSBNRk4sIHJhdGhlciB0aGFuIHRoZSBHRk4uDQo+Pj4+IE9u
IHN5c3RlbXMgd2l0aCBhbiBJT01NVSwgdGhpcyBpcyBub3QgbmVjZXNzYXJ5OiB3aGVuIGEgZm9y
ZWlnbiBwYWdlIGlzDQo+Pj4+IG1hcHBlZCBpbiBEb20wLCBpdCBpcyBhZGRlZCB0byB0aGUgRG9t
MCBwMm0uIEEgbmV3IEdGTi0+TUZOIHRyYW5zbGF0aW9uDQo+Pj4+IGlzIGVuc3RhYmxpc2hlZCBm
b3IgYm90aCBNTVUgYW5kIFNNTVUuIERvbTAgY291bGQgc2FmZWx5IHVzZSB0aGUgR0ZODQo+Pj4+
IGFkZHJlc3MgKGluc3RlYWQgb2YgdGhlIE1GTikgZm9yIERNQSBvcGVyYXRpb25zIGFuZCB0aGV5
IHdvdWxkIHdvcmsuIEl0DQo+Pj4+IHdvdWxkIGJlIG1vcmUgZWZmaWNpZW50IHRoYW4gdXNpbmcg
c3dpb3RsYi14ZW4uDQo+Pj4+IElmIHlvdSByZWNhbGwgbXkgcHJlc2VudGF0aW9uIGZyb20gWGVu
IFN1bW1pdCAyMDIwLCBYaWxpbnggaXMgd29ya2luZyBvbg0KPj4+PiBjYWNoZSBjb2xvcmluZy4g
V2l0aCBjYWNoZSBjb2xvcmluZywgbm8gZG9tYWluIGlzIDE6MSBtYXBwZWQsIG5vdCBldmVuDQo+
Pj4+IERvbTAuIEluIGEgc2NlbmFyaW8gd2hlcmUgRG9tMCBpcyBub3QgMToxIG1hcHBlZCwgc3dp
b3RsYi14ZW4gZG9lcyBub3QNCj4+Pj4gd29yayBhcyBpbnRlbmRlZC4NCj4+Pj4gVGhlIHN1Z2dl
c3RlZCBzb2x1dGlvbiBmb3IgYm90aCB0aGVzZSBpc3N1ZXMgaXMgdG8gYWRkIGEgbmV3IGZlYXR1
cmUNCj4+Pj4gZmxhZyAiWEVORkVBVF9BUk1fZG9tMF9pb21tdSIgdGhhdCB0ZWxscyBEb20wIHRo
YXQgaXQgaXMgc2FmZSBub3QgdG8gdXNlDQo+Pj4+IHN3aW90bGIteGVuIGJlY2F1c2UgSU9NTVUg
dHJhbnNsYXRpb25zIGFyZSBhdmFpbGFibGUgZm9yIERvbTAuIElmDQo+Pj4+IFhFTkZFQVRfQVJN
X2RvbTBfaW9tbXUgaXMgc2V0LCBMaW51eCBzaG91bGQgc2tpcCB0aGUgc3dpb3RsYi14ZW4NCj4+
Pj4gaW5pdGlhbGl6YXRpb24uIEkgaGF2ZSB0ZXN0ZWQgdGhpcyBzY2hlbWUgd2l0aCBhbmQgd2l0
aG91dCBjYWNoZQ0KPj4+PiBjb2xvcmluZyAoaGVuY2Ugd2l0aCBhbmQgd2l0aG91dCAxOjEgbWFw
cGluZyBvZiBEb20wKSBvbiBaQ1UxMDIgYW5kIGl0DQo+Pj4+IHdvcmtzIGFzIGV4cGVjdGVkOiBE
TUEgb3BlcmF0aW9ucyBzdWNjZWVkLg0KPj4+PiBXaGF0IGFib3V0IHN5c3RlbXMgd2hlcmUgYW4g
SU9NTVUgaXMgcHJlc2VudCBidXQgbm90IGFsbCBkZXZpY2VzIGFyZQ0KPj4+PiBwcm90ZWN0ZWQ/
DQo+Pj4+IFRoZXJlIGlzIG5vIHdheSBmb3IgWGVuIHRvIGtub3cgd2hpY2ggZGV2aWNlcyBhcmUg
cHJvdGVjdGVkIGFuZCB3aGljaA0KPj4+PiBvbmVzIGFyZSBub3Q6IGRldmljZXMgdGhhdCBkbyBu
b3QgaGF2ZSB0aGUgImlvbW11cyIgcHJvcGVydHkgY291bGQgb3INCj4+Pj4gY291bGQgbm90IGJl
IERNQSBtYXN0ZXJzLg0KPj4+PiBQZXJoYXBzIFhlbiBjb3VsZCBwb3B1bGF0ZSBhIHdoaXRlbGlz
dCBvZiBkZXZpY2VzIHByb3RlY3RlZCBieSB0aGUgSU9NTVUNCj4+Pj4gYmFzZWQgb24gdGhlICJp
b21tdXMiIHByb3BlcnR5LiBJdCB3b3VsZCByZXF1aXJlIHNvbWUgYWRkZWQgY29tcGxleGl0eQ0K
Pj4+PiBpbiBYZW4gYW5kIGVzcGVjaWFsbHkgaW4gdGhlIHN3aW90bGIteGVuIGRyaXZlciBpbiBM
aW51eCB0byB1c2UgaXQsDQo+Pj4+IHdoaWNoIGlzIG5vdCBpZGVhbC4NCj4+PiANCj4+PiBZb3Ug
YXJlIHRyYWRpbmcgYSBiaXQgbW9yZSBjb21wbGV4aXR5IGluIFhlbiBhbmQgTGludXggd2l0aCBh
IHVzZXIgd2lsbCBtYXkgbm90IGJlIGFibGUgdG8gdXNlIHRoZSBoeXBlcnZpc29yIG9uIGhpcy9o
ZXIgcGxhdGZvcm0gd2l0aG91dCBhIHF1aXJrIGluIFhlbiAoc2VlIG1vcmUgYmVsb3cpLg0KPj4+
IA0KPj4+PiBIb3dldmVyLCB0aGlzIGFwcHJvYWNoIHdvdWxkIG5vdCB3b3JrIGZvciBjYWNoZQ0K
Pj4+PiBjb2xvcmluZyB3aGVyZSBkb20wIGlzIG5vdCAxOjEgbWFwcGVkIHNvIHRoZSBzd2lvdGxi
LXhlbiBzaG91bGQgbm90IGJlDQo+Pj4+IHVzZWQgZWl0aGVyIHdheQ0KPj4+IA0KPj4+IE5vdCBh
bGwgdGhlIERvbTAgTGludXgga2VybmVsIHdpbGwgYmUgYWJsZSB0byB3b3JrIHdpdGggY2FjaGUg
Y29sb3VyaW5nLiBTbyB5b3Ugd2lsbCBuZWVkIGEgd2F5IGZvciB0aGUga2VybmVsIHRvIHNheSAi
SGV5IEkgYW0gY2FuIGF2b2lkIHVzaW5nIHN3aW90bGIiLg0KPj4gSSBmdWxseSBhZ3JlZSBhbmQg
ZnJvbSBteSBjdXJyZW50IHVuZGVyc3RhbmRpbmcgdGhlIGNvbmRpdGlvbiBpcyDigJxoYXZpbmcg
YW4gaW9tbXXigJ0uDQo+Pj4gDQo+Pj4+IEZvciB0aGVzZSByZWFzb25zLCBJIHdvdWxkIGxpa2Ug
dG8gcHJvcG9zZSBhIHNpbmdsZSBmbGFnDQo+Pj4+IFhFTkZFQVRfQVJNX2RvbTBfaW9tbXUgd2hp
Y2ggc2F5cyB0aGF0IHRoZSBJT01NVSBjYW4gYmUgcmVsaWVkIHVwb24gZm9yDQo+Pj4+IERNQSB0
cmFuc2xhdGlvbnMuIEluIHNpdHVhdGlvbnMgd2hlcmUgYSBETUEgbWFzdGVyIGlzIG5vdCBTTU1V
DQo+Pj4+IHByb3RlY3RlZCwgWEVORkVBVF9BUk1fZG9tMF9pb21tdSBzaG91bGQgbm90IGJlIHNl
dC4gRm9yIGV4YW1wbGUsIG9uIGENCj4+Pj4gcGxhdGZvcm0gd2hlcmUgYW4gSU9NTVUgaXMgcHJl
c2VudCBhbmQgcHJvdGVjdHMgbW9zdCBETUEgbWFzdGVycyBidXQgaXQNCj4+Pj4gaXMgbGVhdmlu
ZyBvdXQgdGhlIE1NQyBjb250cm9sbGVyLCB0aGVuIFhFTkZFQVRfQVJNX2RvbTBfaW9tbXUgc2hv
dWxkDQo+Pj4+IG5vdCBiZSBzZXQgKGJlY2F1c2UgUFYgYmxvY2sgaXMgbm90IGdvaW5nIHRvIHdv
cmsgd2l0aG91dCBzd2lvdGxiLXhlbi4pDQo+Pj4+IFRoaXMgYWxzbyBtZWFucyB0aGF0IGNhY2hl
IGNvbG9yaW5nIHdvbid0IGJlIHVzYWJsZSBvbiBzdWNoIGEgc3lzdGVtIChhdA0KPj4+PiBsZWFz
dCBub3QgdXNhYmxlIHdpdGggdGhlIE1NQyBjb250cm9sbGVyIHNvIHRoZSBzeXN0ZW0gaW50ZWdy
YXRvciBzaG91bGQNCj4+Pj4gcGF5IHNwZWNpYWwgY2FyZSB0byBzZXR1cCB0aGUgc3lzdGVtKS4N
Cj4+Pj4gSXQgaXMgd29ydGggbm90aW5nIHRoYXQgaWYgd2Ugd2FudGVkIHRvIGV4dGVuZCB0aGUg
aW50ZXJmYWNlIHRvIGFkZCBhDQo+Pj4+IGxpc3Qgb2YgcHJvdGVjdGVkIGRldmljZXMgaW4gdGhl
IGZ1dHVyZSwgaXQgd291bGQgc3RpbGwgYmUgcG9zc2libGUuIEl0DQo+Pj4+IHdvdWxkIGJlIGNv
bXBhdGlibGUgd2l0aCBYRU5GRUFUX0FSTV9kb20wX2lvbW11Lg0KPj4+IA0KPj4+IEkgaW1hZ2lu
ZSBieSBjb21wYXRpYmxlLCB5b3UgbWVhbiBYRU5GRUFUX0FSTV9kb20wX2lvbW11IHdvdWxkIGJl
IGNsZWFyZWQgYW5kIGluc3RlYWQgdGhlIGRldmljZS10cmVlIGxpc3Qgd291bGQgYmUgdXNlZC4g
SXMgdGhhdCBjb3JyZWN0Pw0KPj4gV2hhdCBkbyB5b3UgbWVhbiBieSBkZXZpY2UgdHJlZSBsaXN0
IGhlcmUgPw0KPiANCj4gU29ycnkgSSBtZWFudCAiZGV2aWNlIGxpc3QiLiBJIHdhcyByZWZlcnJp
bmcgdG8gU3RlZmFubydzIHN1Z2dlc3Rpb24gdG8gZGVzY3JpYmUgdGhlIGxpc3Qgb2YgZGV2aWNl
cyBwcm90ZWN0ZWQgaW4gdGhlIGRldmljZS10cmVlLg0KDQpPayB5b3UgbWVhbiBhZGRpbmcgdG8g
dGhlIGRldmljZSB0cmVlIHNvbWUga2luZCBvZiBkZXZpY2UgbGlzdCBmb3Igd2hpY2ggc3dpb3Rs
YiBzaG91bGQgYmUgdXNlZCAob3IgbWF5YmUgdGhlIG9wcG9zaXRlIGxpc3QgaW4gZmFjdCkuDQoN
Cj4gDQo+Pj4gDQo+Pj4+IEhvdyB0byBzZXQgWEVORkVBVF9BUk1fZG9tMF9pb21tdT8NCj4+Pj4g
V2UgY291bGQgc2V0IFhFTkZFQVRfQVJNX2RvbTBfaW9tbXUgYXV0b21hdGljYWxseSB3aGVuDQo+
Pj4+IGlzX2lvbW11X2VuYWJsZWQoZCkgZm9yIERvbTAuIFdlIGNvdWxkIGFsc28gaGF2ZSBhIHBs
YXRmb3JtIHNwZWNpZmljDQo+Pj4+ICh4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zLykgb3ZlcnJpZGUg
c28gdGhhdCBhIHNwZWNpZmljIHBsYXRmb3JtIGNhbg0KPj4+PiBkaXNhYmxlIFhFTkZFQVRfQVJN
X2RvbTBfaW9tbXUuIEZvciBkZWJ1Z2dpbmcgcHVycG9zZXMgYW5kIGFkdmFuY2VkDQo+Pj4+IHVz
ZXJzLCBpdCB3b3VsZCBhbHNvIGJlIHVzZWZ1bCB0byBiZSBhYmxlIHRvIG92ZXJyaWRlIGl0IHZp
YSBhIFhlbg0KPj4+PiBjb21tYW5kIGxpbmUgcGFyYW1ldGVyLg0KPj4+IFBsYXRmb3JtIHF1aXJr
cyBzaG91bGQgYmUgYXJlIGxpbWl0ZWQgdG8gYSBzbWFsbCBzZXQgb2YgcGxhdGZvcm1zLg0KPj4+
IA0KPj4+IEluIHRoaXMgY2FzZSwgdGhpcyB3b3VsZCBub3QgYmUgb25seSBwZXItcGxhdGZvcm0g
YnV0IGFsc28gcGVyLWZpcm13YXJlIHRhYmxlIGFzIGEgZGV2ZWxvcGVyIGNhbiBkZWNpZGUgdG8g
cmVtb3ZlL2FkZCBJT01NVSBub2RlcyBpbiB0aGUgRFQgYXQgYW55IHRpbWUuDQo+Pj4gDQo+Pj4g
SW4gYWRkaXRpb24gdG8gdGhhdCwgaXQgbWVhbnMgd2UgYXJlIGludHJvZHVjaW5nIGEgcmVncmVz
c2lvbiBmb3IgdGhvc2UgdXNlcnMgYXMgWGVuIDQuMTQgd291bGQgaGF2ZSB3b3JrZWQgb24gdGhl
cmUgcGxhdGZvcm0gYnV0IG5vdCBhbnltb3JlLiBUaGV5IHdvdWxkIG5lZWQgdG8gZ28gdGhyb3Vn
aCBhbGwgdGhlIG5vZGVzIGFuZCBmaW5kIG91dCB3aGljaCBvbmUgaXMgbm90IHByb3RlY3RlZC4N
Cj4+IEkgYW0gbm90IHN1cmUgaSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQgaGVyZSBhcyB3ZSBjYW5u
b3QgZGV0ZWN0IGlmIGEgZGV2aWNlIGlzIHByb3RlY3RlZCBvciBub3QgYnkgYW4gSU9NTVUgYXMg
d2UgZG8gbm90IGtub3cgd2hpY2ggZGV2aWNlIHJlcXVpcmVzIG9uZS4NCj4gDQo+IFRoYXQncyBj
b3JyZWN0Li4uDQo+IA0KPj4gQ291bGQgeW91IGV4cGxhaW4gd2hhdCB1c2UgY2FzZSB3b3JraW5n
IGJlZm9yZSB3b3VsZCBub3Qgd29yayBoZXJlID8NCj4gDQo+IEZyb20gU3RlZmFubydzIGUtbWFp
bCwgWGVuIHdvdWxkIGV4cG9zZSBYRU5GRUFUX0FSTV9kb20wX2lvbW11IGlmIGFsbCB0aGUgZGV2
aWNlcyBhcmUgcHJvdGVjdGVkIGJ5IHRoZSBJT01NVS4NCj4gDQo+IFRoaXMgaW1wbGllcyB0aGF0
IFhlbiBpcyBhd2FyZSB3aGV0aGVyIGV2ZXIgRE1BLWNhcGFibGUgZGV2aWNlcyBhcmUgcHJvdGVj
dGVkLiBBcyB5b3UgcmlnaHRmdWxseSBwb2ludGVkIG91dCB0aGlzIGNhbm5vdCB3b3JrLg0KDQpC
dXQgdGhpcyBpcyBhbHNvIGFuIGlzc3VlIHJpZ2h0IG5vdy4NCg0KPiANCj4+PiANCj4+PiBUaGlz
IGlzIGEgYml0IG9mIGEgZGF1bnRpbmcgdGFzayBhbmQgd2UgYXJlIGdvaW5nIHRvIGVuZCB1cCBo
YXZpbmcgYSBsb3Qgb2YgcGVyLXBsYXRmb3JtIHF1aXJrIGluIFhlbi4NCj4+IEZyb20gbXkgdW5k
ZXJzdGFuZGluZyB0aGUgcXVpcmtzIGhlcmUgd291bGQgYmUgaW4gTGludXggYXMgaXQgd291bGQg
aGF2ZSB0byBkZWNpZGUgZm9yIHdoYXQgdG8gdXNlIHN3aW90bGIgb3Igbm90Lg0KPiANCj4gVGhp
cyBpcyBub3QgaG93IEkgdW5kZXJzdG9vZCBTdGVmYW5vJ3MgZS1tYWlsLiBCdXQgZXZlbiBpZiBp
dCBpcyBoYXBwZW5pbmcgaW4gTGludXgsIHRoZW4gd2UgbmVlZCBhIHdheSB0byB0ZWxsIExpbnV4
IHdoaWNoIGRldmljZXMgaGF2ZSBiZWVuIHByb3RlY3RlZCBieSBYZW4uDQoNClNvIGJhc2ljYWxs
eSBsZXQgc29tZSBpbmZvIGluIHRoZSBkZXZpY2VzIHRvIGxldCBsaW51eCB0aGF0IHRoZXkgYXJl
IHByb3RlY3RlZCBieSBhbiBJT01NVSwgd2hpY2ggd291bGQgYmUgcmVwbGFjaW5nIHRoZSBpb21t
dSBsaW5rIG5vZGUgYnkgc29tZXRoaW5nIGVsc2UuDQoNCj4gDQo+PiBXaGF0IHF1aXJrIGRvIHlv
dSBpbWFnaW5lIHdlIGNvdWxkIGltcGxlbWVudCBpbiBYZW4gPw0KPiANCj4gTWU/IE5vbmUuIFRo
YXQgU3RlZmFubydzIGlkZWEgYW5kIEkgZG9uJ3QgdGhpbmsgaXQgY2FuIHdvcmsuDQoNCkRlZmlu
aXRlbHkgdGhlcmUgaXMgYSBwcm9ibGVtIHRvIHNvbHZlIGhlcmUsIG1heWJlIHRoZSBob3cgcmVx
dWlyZXMgbW9yZSBkaXNjdXNzaW9uIDotKQ0KDQpJIHNlZSB0aGUgc2FtZSBraW5kIG9mIHByb2Js
ZW0gaW5jb21pbmcgb25jZSB3ZSB3aWxsIGhhdmUgc29tZSBndWVzdHMgdXNpbmcgZGlyZWN0LW1h
cCBhbmQgc29tZSBvdGhlciBub3QuDQpBdCB0aGUgZW5kIHRoZXJlIGlzIGEgc29tZSBraW5kIG9m
IGEgbWF0cml4IHdpdGggc3dpb3RsYiBkZXBlbmRpbmcgb24gZGlyZWN0LW1hcCBhbmQgSU9NTVUg
cHJlc2VudCB3aXRoIHNvbWUNCnZlcnkgbmFzdHkgY29tYmluYXRpb24gaWYgd2UgdHJ5IHRvIGFk
ZCB0aGUgdXNlIGNhc2Ugb2Ygc29tZSBkZXZpY2VzIG9ubHkgcHJvdGVjdGVkIGJ5IGFuIElPTU1V
Lg0KDQpDaGVlcnMNCkJlcnRyYW5kIA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVs
aWVuIEdyYWxsDQoNCg==

