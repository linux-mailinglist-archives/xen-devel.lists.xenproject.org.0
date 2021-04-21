Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3972366810
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114206.217548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9EE-0000wr-S7; Wed, 21 Apr 2021 09:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114206.217548; Wed, 21 Apr 2021 09:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9EE-0000wQ-OP; Wed, 21 Apr 2021 09:33:02 +0000
Received: by outflank-mailman (input) for mailman id 114206;
 Wed, 21 Apr 2021 09:33:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TEu=JS=arm.com=henry.wang@srs-us1.protection.inumbo.net>)
 id 1lZ9ED-0000wG-BY
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:33:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e30299ca-3116-4bc6-979a-ff95828f4b59;
 Wed, 21 Apr 2021 09:32:59 +0000 (UTC)
Received: from DB6PR0802CA0045.eurprd08.prod.outlook.com (2603:10a6:4:a3::31)
 by DB6PR0802MB2373.eurprd08.prod.outlook.com (2603:10a6:4:88::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 09:32:57 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::a6) by DB6PR0802CA0045.outlook.office365.com
 (2603:10a6:4:a3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Wed, 21 Apr 2021 09:32:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 09:32:57 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Wed, 21 Apr 2021 09:32:57 +0000
Received: from 2e091b846d3f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B97A2A56-9BE3-4268-A072-9DE5EFF5B471.1; 
 Wed, 21 Apr 2021 09:32:47 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e091b846d3f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Apr 2021 09:32:47 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PR2PR08MB4811.eurprd08.prod.outlook.com (2603:10a6:101:21::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Wed, 21 Apr
 2021 09:32:43 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad%3]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 09:32:43 +0000
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
X-Inumbo-ID: e30299ca-3116-4bc6-979a-ff95828f4b59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raigjYOT3f3W5c1zbh/O8TBAZlZbVcoLgSBs3z/D2XQ=;
 b=wtQPbO5epkhaZZg1O2xXD0iJM6noAFAHNdEACnPzr9yluZzbeQAtczo5dwYuopNSnDpeE6hp0vStjoISf8Us6MPkCxnL5bQ9zXDP13Vkm7YhUzFpy3tN7MW0ojSut1dZQ9+INRKJ7RdtWaFGczsXI8w5qcCJNw7sYq7KXps9L7Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ecl+SlFnHT5ZxETQqPNpmzoJ+GE28olRvPAJ40sqDo115ZN2mFdz2JVulsDEHwlyOsg2jERSXz7DDWha9ixYpqyV2yAr1TV4DEdxW0THPZwpHQ6f72kmeuTRIV2wPv6NUD/3D9rkRrwBI+p+CRfP5IIB6K6+JU4fw53xRMTs7qZCMDjDDUTPnEcSAC3Nui6JwpEk9KGycV2xC6GCmWAlS8ux5OSjtM6yEzzdoQtjV7tz1m+RTFznxpCo94ab5xQN3XBJbHTkVZeqiV8BttXXQ8fwa0XBeE1mhxPy5GRmviGbzA/SXiYXZsTbqIYCKs83vGSpKZJ6BGZ4OE+HSCL+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raigjYOT3f3W5c1zbh/O8TBAZlZbVcoLgSBs3z/D2XQ=;
 b=YIby+ezWgebVOuZJ8xfcJ0WPW3xlrdyPZfcRgo9ipiOrTCE/Gu2fiB4cMY35lH3Pph1EWX/MfMLiB4CKRBZswbbwJFm/ljNl3TNt4f+ejxfm237vwRe4N0IN40D6C3d91VQwOb5f4GI0ULBcHxOvsLOvXNMIXRO+IebCCFZOi1uCbvserg8w2ZW3K9ds3dpVUCgms3iEDxPyrXDR6ZgWKaUKLuuYJyLpZsDmz+DTUfJBKnMpeqB/tipqMlR62NhmPggcojw781cJAPbQcigegKSflQ33PGz8u99XC2Cz3bUCPb7/tlw1rmgy+EGaUcyu5RTVEAlWg81NSUpiI9cS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raigjYOT3f3W5c1zbh/O8TBAZlZbVcoLgSBs3z/D2XQ=;
 b=wtQPbO5epkhaZZg1O2xXD0iJM6noAFAHNdEACnPzr9yluZzbeQAtczo5dwYuopNSnDpeE6hp0vStjoISf8Us6MPkCxnL5bQ9zXDP13Vkm7YhUzFpy3tN7MW0ojSut1dZQ9+INRKJ7RdtWaFGczsXI8w5qcCJNw7sYq7KXps9L7Q=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: Discussion of Xenheap problems on AArch64
Thread-Topic: Discussion of Xenheap problems on AArch64
Thread-Index: Adc2dyA8lkZGRqbyRiSglHolanVkwQAFhaqAAACgy/A=
Date: Wed, 21 Apr 2021 09:32:43 +0000
Message-ID:
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
In-Reply-To: <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 853CF1EFC5ED9D45A68ABEA108A8F0F1.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d48dc89b-d501-48bf-df0e-08d904a872dd
x-ms-traffictypediagnostic: PR2PR08MB4811:|DB6PR0802MB2373:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB23733B5E47AA95DB742C62B392479@DB6PR0802MB2373.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kWO/bcukpLBqZpqZP2xsJYyFI2dXagVjky4a0EyC8ntLqcOuDtcxBupevKzk3bMJSo9a7UdHsJm9dzyQJd9UfVMw/HlBnRt8n44gSHRgynvPVqVNvEbF/4mc5OTmFzptYP26s0eI1XjpHstRV+sXkRVNX2AJu/rFPp1o1paVXhpweHmAIJd3KpYBW4NEXrxmP6GnbO7tdlcOqouoIpISvU78cWSedHaKLNbLM0rJyJIHarmuQtDRIIWHtCmUphAwi2s1PDbHC61zdtwP5NE2HPRaVk7hLtBl9yxLIgQ+3J/jIb5G3YH2re5B0qeS6byoryWokXwI74tXOBIxiNZuASKFX3OJ+KpIzIF+tmAalvqIVPxtqWyQhosZ5KAauhTsV/PM2aMll3sLIssDfyo21MLPz62lG4EiAVhf2CBMANuYwY7PWdaRusmhA0V+E/3n9D2al3qfwqMaDVV7ALklnrRTQA5gpWCstEuE/FKncH8rzKFKpuD7gn7DMOT65w5M32ajA3bV0ZmgnOTNftyXGfuHe2RkWo4YvwNuj8KJ4MWwz5SPB3CDmh94sR/wnEveskHvG8zJ3JGSinJObTfbgvEH9a6H2xHFdgHEiO4/AG+xJqkv4TB+9MRnAYds338Nrj4N0e4LbHcjFh4tpsO6J+baq10Yp9nFMHjCbhL004VhCcUKZ3YKXxPHG4o+u8ng
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(186003)(52536014)(6506007)(53546011)(5660300002)(478600001)(7696005)(64756008)(8936002)(33656002)(316002)(71200400001)(2906002)(83380400001)(8676002)(38100700002)(54906003)(122000001)(66556008)(66946007)(9686003)(66476007)(110136005)(66446008)(55016002)(26005)(4326008)(86362001)(966005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?MjJ2anNYSVU2TmRFRnRpU3JvNW55ckNIWlBkQU1LRlkyZDlWclhuRjNneUNJ?=
 =?utf-8?B?cnA5ZjRyZjNtdUkxakhSWHpIMGwrbEc2cS8xaVRBaTNkeW5aUjVkVTNkNjBK?=
 =?utf-8?B?T0swTzQ1WmZhbklxbjVZSWhCdlU1eFBZYVR2NTVISkhSVXM2c21MOVZqRUVz?=
 =?utf-8?B?S2I4YzI0RVI0Q1dadnVsTmtZYy9hMXpUaHJQOVI4c0hQSU1QU21PcTg3clc1?=
 =?utf-8?B?ZHVmZnUrVDczT0UyUW0wUFhuRFI5ZmFEdXNFcHNnbHRRaytwMXZHMk9pc2ZS?=
 =?utf-8?B?Ykc3Ukw0czVRdmZCcnY0Z1VmOHl1ZkpDUnNXNDVoUFZGZEV2UEY5U3VCZytJ?=
 =?utf-8?B?bWFieUM0M2VLckhBVFhTWGdqUENKbFNBWGNPYTdnOFhpV2tXZmg0VUZ2Mk9p?=
 =?utf-8?B?Q3Exc3JYRUU2dEpOVjBUZlAxM2lORVdyKzJtQTJzQjFQcDZucERKdGk0cmNL?=
 =?utf-8?B?bjkxSW1qamNrcXRjTFJ2b1FLU1FpZlJFT0xNU3M3UmlOdVV5aEZZT3pYYjNl?=
 =?utf-8?B?Z3Vrb2FNeFF0RTAwRk5kMTBqcFgwMmU5eURWU3VwbUZJZ0FyckgxaVhvN2Yx?=
 =?utf-8?B?Y1c0WDB3ZVB3RCtkeHByUUtiaWR3VS9Dc3RNOWRZVUt1aWJBT3IvSUNQSmF3?=
 =?utf-8?B?aWFoM0swcWs2cGFpaHY5M0RlNG1nYzZ2ejNwb2ljbURZakJOYUJsa1ZkS0Rz?=
 =?utf-8?B?d25lSVdwbC9jUHdjTnNYUVhoVWNQMFVPSWFwaHFheDk3RWpiOXA5RVo4aE5s?=
 =?utf-8?B?cy9manVodGJpamhSSWhUbjR6VnluY1Y4NDk1QnhPMHBKZlRyL01yMWlaRFVp?=
 =?utf-8?B?ZXkzY1ZPUEU4N0d0bVFHMzg4dDQwQmtXTnJFRFZ0L29uSDVnM2VERzRjWjRq?=
 =?utf-8?B?MVFGRkFhMmlOc09ISTRvZW9sbkxkRVFtK0lDaG1obFpVaGh5Rzc0azZqeTNK?=
 =?utf-8?B?VjkrSkFOMlc2RC9NQXlpR0dxNGU1d2creFVaUFRoRUU2bk1jK0VQaTBQaDhG?=
 =?utf-8?B?dEw0YlJtZGU4bmtxR290dWtpNTk5RitXSTVJS01pZlNGcWovNGRVV0JiUkxm?=
 =?utf-8?B?NURtM0xtOFd2bGtYUmRrS0VUcktLNXdvajQ4OE1rU2VMVStSUjFGelJpTmk3?=
 =?utf-8?B?WE9FRjNBOExranV3TkVEY1drNnhzTlBmWGUwOW51K0tFUHQ3S0tXQzh0bVhL?=
 =?utf-8?B?QVJkOEliWm9ab1ptdDhHZVg0dmtsQzFNZE5pQzVLRVFiSVVpbEh3UzVsQWNH?=
 =?utf-8?B?Nmgvd1JPT3V3clFjaVc3RkVtVmI1T21pWUQ1cy9zc0xhN3lzZDNZMU13T3B3?=
 =?utf-8?B?WHVkNHVPZVNVQUh4S2R1eExzZElZeTJYbG1ZMjVoYmRySU1LbGN1Mk5PM1lU?=
 =?utf-8?B?VjNhdmdpTXFYT2NuQTdqd3ZpUTNZeDNGMDZxeVdPcXlmK2V6ODh2NGhjQVNj?=
 =?utf-8?B?d3grUzZxemFUSWwra1FCcWt6d3Rudjhabi9QNEhXbWZjZElUQU5WdTdMUXVw?=
 =?utf-8?B?NHdZZ0diZVNNd0E1dFM5S0hOaXh0ZWZuekZlOEVFQkNadnZEN0cyYXQ0U0lu?=
 =?utf-8?B?Z0ZSVzJCVEp4U3diTFRReTBHajBGOFdIRzNpbzVXRlFwWTlZc0RoVk9ObVJr?=
 =?utf-8?B?Q3puUlhzV25jQ0dyeTY4RlZCM3VsK2NyK1BCTlhkMXZtV3gzMGkyayszdGJZ?=
 =?utf-8?B?U2kyeGJoNERWenVEOC96RHlRYnVYeXJuWHRiR2t1bk0wQWpMcWlJSHh1VGMr?=
 =?utf-8?Q?7ESlWSR4Xgi7E+QcWJn1kcq3zsZvdsqcgc+xIIV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4811
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eecf6e2e-019a-49a8-9ffc-08d904a86a2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ct0SRyF6xerHUbSd2a6qK/wE0tLSo+AEVuS0ewcVZVz/ezDurqrREWjeGMXNRcTe/4yTHlN3HvKsxV6m6PFGRQmNGeqtJvoGmP2Ct/sU4WzrRfIwQicbnXE6FApnriweTru0xe9xdGt982Z/Ja/dKsox1VjCXvJw+Q+sSbZw7RK2TO+d8AOj1o5O2tiiU9nPF0QKACbCOqVwgGqjsBeV1aIGZoqF8c2WebTPQ91hB5ZMYc+Z6XwybKs7WNiqZR2BjmtNR7pY0TSV/OFI1vW38SZjZYgYn3BDPUvJNsm8/m5EUi+Dy6RzHihOzzIrtYl3RfuVOOpvSiNAXNG3kaNDaBXWo+PiHqFVFDb8VjalZfIT6ftlRUzjdDt+YSh48hIcGHYKY+5t3zJOqGPTQWn/7H1BidxSAomujcVL2n+TERHlx3ii89rIclllvG7qwwv3jX/TaR+cE/VFcasH9A+HUhhyVvj7jVHSas2KvBNHkUlW0LbUYSx/sqQD31mgYSfT6WOtYl7R5IlkSfNP080wmNQXbsHIlTdlS1DowOABaAdcqR1f/C9/Vflco3VxDLUGLJg8MVlFc6+m0ascx5gHUbiahFLD4YYSmVzEAlX6fVq9CIw6poWMyavVa7h3iUCPkSVHAkcuJ8S497E3V7K9kzY3ro1zt+RUEy2Tr02NfqbQW9gbNEiPx+Y6iHjQEfDjETSb1Ds29zkEBw2GTm9Cs+4DiztBy231CTaKkOyjE4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(55016002)(26005)(9686003)(82740400003)(33656002)(316002)(86362001)(110136005)(83380400001)(8676002)(356005)(81166007)(53546011)(2906002)(6506007)(82310400003)(5660300002)(52536014)(8936002)(966005)(186003)(7696005)(336012)(54906003)(36860700001)(47076005)(70586007)(4326008)(70206006)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:32:57.7715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48dc89b-d501-48bf-df0e-08d904a872dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2373

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjEsIDIw
MjEgNTowNCBQTQ0KPiBUbzogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPjsgc3N0YWJl
bGxpbmlAa2VybmVsLm9yZzsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBD
YzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA8UGVubnkuWmhl
bmdAYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4N
Cj4gU3ViamVjdDogUmU6IERpc2N1c3Npb24gb2YgWGVuaGVhcCBwcm9ibGVtcyBvbiBBQXJjaDY0
DQo+IA0KPiANCj4gDQo+IE9uIDIxLzA0LzIwMjEgMDc6MjgsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+
ID4gSGksDQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+ID4NCj4gPiBXZSBhcmUgdHJ5aW5nIHRvIGlt
cGxlbWVudCB0aGUgc3RhdGljIG1lbW9yeSBhbGxvY2F0aW9uIG9uIEFBcmNoNjQuIFBhcnQNCj4g
b2YNCj4gPiB0aGlzIGZlYXR1cmUgaXMgdGhlIHJlc2VydmVkIGhlYXAgbWVtb3J5IGFsbG9jYXRp
b24sIHdoZXJlIGEgc3BlY2lmaWMgcmFuZ2UNCj4gb2YNCj4gPiBtZW1vcnkgaXMgcmVzZXJ2ZWQg
b25seSBmb3IgaGVhcC4gSW4gdGhlIGRldmVsb3BtZW50IHByb2Nlc3MsIHdlIGZvdW5kIGENCj4g
PiBwaXRmYWxsIGluIGN1cnJlbnQgQUFyY2g2NCBzZXR1cF94ZW5oZWFwX21hcHBpbmdzKCkgZnVu
Y3Rpb24uDQo+ID4NCj4gPiBBY2NvcmRpbmcgdG8gYSBwcmV2aW91cyBkaXNjdXNzaW9uIGluIGNv
bW11bml0eQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE5MDIxNjEz
NDQ1Ni4xMDY4MS0xLQ0KPiBwZW5nLmZhbkBueHAuY29tLywNCj4gPiBvbiBBQXJjaDY0LCBib290
bWVtIGlzIGluaXRpYWxpemVkIGFmdGVyIHNldHVwX3hlbmhlYXBfbWFwcGluZ3MoKSwNCj4gPiBz
ZXR1cF94ZW5oZWFwX21hcHBpbmdzKCkgbWF5IHRyeSB0byBhbGxvY2F0ZSBtZW1vcnkgYmVmb3Jl
IG1lbW9yeQ0KPiBoYXMgYmVlbg0KPiA+IGhhbmRlZCBvdmVyIHRvIHRoZSBib290IGFsbG9jYXRv
ci4gSWYgdGhlIHJlc2VydmVkIGhlYXAgbWVtb3J5IGFsbG9jYXRpb24NCj4gaXMNCj4gPiBpbnRy
b2R1Y2VkLCBlaXRoZXIgb2YgYmVsb3cgMiBjYXNlcyB3aWxsIHRyaWdnZXIgYSBjcmFzaDoNCj4g
Pg0KPiA+IDEuIElmIHRoZSByZXNlcnZlZCBoZWFwIG1lbW9yeSBpcyBhdCB0aGUgZW5kIG9mIHRo
ZSBtZW1vcnkgYmxvY2sgbGlzdCBhbmQNCj4gdGhlDQo+ID4gZ2FwIGJldHdlZW4gcmVzZXJ2ZWQg
YW5kIHVucmVzZXJ2ZWQgbWVtb3J5IGlzIGJpZ2dlciB0aGFuIDUxMkdCLCB3aGVuDQo+IHdlIHNl
dHVwDQo+ID4gbWFwcGluZ3MgZnJvbSB0aGUgYmVnaW5uaW5nIG9mIHRoZSBtZW1vcnkgYmxvY2sg
bGlzdCwgd2Ugd2lsbCBnZXQgT09NDQo+IGNhdXNlZA0KPiA+IGJ5IGxhY2sgb2YgcGFnZXMgaW4g
Ym9vdCBhbGxvY2F0b3IuIFRoaXMgaXMgYmVjYXVzZSB0aGUgbWVtb3J5IHRoYXQgaXMNCj4gcmVz
ZXJ2ZWQNCj4gPiBmb3IgaGVhcCBoYXMgbm90IGJlZW4gbWFwcGVkIGFuZCBhZGRlZCB0byB0aGUg
Ym9vdCBhbGxvY2F0b3IuDQo+ID4NCj4gPiAyLiBJZiB3ZSBhZGQgdGhlIG1lbW9yeSB0aGF0IGlz
IHJlc2VydmVkIGZvciBoZWFwIHRvIGJvb3QgYWxsb2NhdG9yIGZpcnN0LA0KPiBhbmQNCj4gPiB0
aGVuIHNldHVwIG1hcHBpbmdzIGZvciBiYW5rcyBpbiB0aGUgbWVtb3J5IGJsb2NrIGxpc3QsIHdl
IG1heSBnZXQgYSBwYWdlDQo+IHdoaWNoDQo+ID4gaGFzIG5vdCBiZWVuIHNldHVwIG1hcHBpbmcs
IGNhdXNpbmcgYSBkYXRhIGFib3J0Lg0KPiANCj4gVGhlcmUgYXJlIGEgZmV3IGlzc3VlcyB3aXRo
IHNldHVwX3hlbmhlYXBfbWFwcGluZ3MoKS4gSSBoYXZlIGJlZW4NCj4gcmV3b3JraW5nIHRoZSBj
b2RlIG9uIG15IHNwYXJlIHRpbWUgYW5kIHN0YXJ0ZWQgdG8gdXBzdHJlYW0gYml0cyBvZiBpdC4N
Cj4gQSBQb0MgY2FuIGJlIGZvdW5kIGhlcmU6DQo+IA0KPiBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWIvP3A9cGVvcGxlL2p1bGllbmcveGVuLQ0KPiB1bnN0YWJsZS5naXQ7YT1zaG9ydGxv
ZztoPXJlZnMvaGVhZHMvcHQvZGV2DQo+IA0KDQpSZWFsbHkgZ3JlYXQgbmV3cyEgVGhhbmtzIHlv
dSB2ZXJ5IG11Y2ggZm9yIHRoZSBpbmZvcm1hdGlvbiBhbmQgeW91ciBoYXJkDQp3b3JrIG9uIHRo
ZSBQb0MgOikgSSB3aWxsIHN0YXJ0IHRvIGdvIHRocm91Z2ggeW91ciBQb0MgY29kZSB0aGVuLg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBH
cmFsbA0K

