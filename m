Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3383F2B18
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169424.309491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2ae-000885-VV; Fri, 20 Aug 2021 11:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169424.309491; Fri, 20 Aug 2021 11:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2ae-00085I-Rv; Fri, 20 Aug 2021 11:21:36 +0000
Received: by outflank-mailman (input) for mailman id 169424;
 Fri, 20 Aug 2021 11:21:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+ZW=NL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mH2ac-00085A-Fj
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:21:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63ce69cd-2b3d-4ece-9d71-5c6da333b2eb;
 Fri, 20 Aug 2021 11:21:32 +0000 (UTC)
Received: from DU2PR04CA0186.eurprd04.prod.outlook.com (2603:10a6:10:28d::11)
 by PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 11:21:29 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::73) by DU2PR04CA0186.outlook.office365.com
 (2603:10a6:10:28d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 11:21:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 11:21:29 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Fri, 20 Aug 2021 11:21:29 +0000
Received: from 0ea88ca6ad1c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BDFF79F-CB7C-4DE2-89A3-D20A5A760EBE.1; 
 Fri, 20 Aug 2021 11:21:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ea88ca6ad1c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 11:21:21 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3879.eurprd08.prod.outlook.com (2603:10a6:20b:8c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 11:21:20 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 11:21:20 +0000
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
X-Inumbo-ID: 63ce69cd-2b3d-4ece-9d71-5c6da333b2eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWwoyQDVbWoc1gV197GUIo3AFzui+JZogHS6GLjkp+4=;
 b=eF/DhkNEnduDww43wKvGTAr5kQV/koS+UJmv4O1xagrGjSFCf2xGZCtrIyOw+1koq2+TRNQAG+lUriyUd46ELmbabqGsiMVfmATwmlvoI2SVvBWIjkldwVJF4PAJl6jRlShCr7cIcEIjyWGSCPoiybJTqoAapWccqJLe4GuzqKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 207088c28f149a4a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TASW4qHSXawr3nqwpJ23dlY8DZTO1lXk+7De626JV4xwV/e1VSiYVJDcd3DXmpFvIJlFnFFOeMiIyCqn/MDavB5rvj9OxV8ahkH9qZsdUgKJAIYl2m2Wo1QEZWBATGNaTCRo8cCdVxcsFzFryi0T35reSd59lJWE5jyVV1mcpwnpb1MinxEeRSx8ufHq0+0ZtBTZAu7mNBx/9rSTJn/f5+r+66UyZQpRYjGy+2qebIwiencXdGTNSdiWYR4A6a7tDSWNX4MDxn0itDZCXm43aMY6ydAlZNttKXkt6mls8qH02zBw0X3ZjL4KpXAxuZTl9kW2KLRiMijP+U76MpOziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWwoyQDVbWoc1gV197GUIo3AFzui+JZogHS6GLjkp+4=;
 b=EgBVyjLJoY1jNfbf0MQDeB+Hg6/Ou6xDsgUbm/IOsLz/sKmy3WDGAyh3W0dH/S4fmzrg61jo4IC35DxeRc7x2ZKwPk+STYCyrtu8AXB/4x6ggNMXX4yEGvixDBBmcL3NW9fAPQBkexIEbD0WPV7PqsIAymKcIdJszopUPtMP2Bm0WFDym4N+PlmaUwvZdQJxB3bepZSf8drJIa2aV7FkEXLlPMV1SCMhP3PMsdO5YlodDd6s82nFIGPwdD/XbyIyWBsF++baQFoVAw/YlnzTpE0ATetmr6q5nKIHrxM7Ig7qOd9Hdi1UoR5LLbpjpGrUu6hci9oapmVM+0/PNXnfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWwoyQDVbWoc1gV197GUIo3AFzui+JZogHS6GLjkp+4=;
 b=eF/DhkNEnduDww43wKvGTAr5kQV/koS+UJmv4O1xagrGjSFCf2xGZCtrIyOw+1koq2+TRNQAG+lUriyUd46ELmbabqGsiMVfmATwmlvoI2SVvBWIjkldwVJF4PAJl6jRlShCr7cIcEIjyWGSCPoiybJTqoAapWccqJLe4GuzqKo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
Thread-Topic: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
Thread-Index: AQHXlPJ69O5DKvBqZU6v8IxjA4iLvqt7+GgAgABIsYA=
Date: Fri, 20 Aug 2021 11:21:20 +0000
Message-ID: <F287EFE7-B153-4FAC-AF1D-8636FBCAAEF7@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
 <da5db823-1875-ff7d-6d39-aacc170e994f@suse.com>
In-Reply-To: <da5db823-1875-ff7d-6d39-aacc170e994f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e2fa39b8-38c9-406b-2dd4-08d963cca839
x-ms-traffictypediagnostic: AM6PR08MB3879:|PAXPR08MB6750:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6750013CB48735A31E242435FCC19@PAXPR08MB6750.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g00Fx0o8Ae65mXiEFrQPke0DpO6tyBf2HNCyHlET0koISyXgdxfC/wWNzzHU8ctBFmNcanF1xP8Z2Il9oFXc/7c05Xb1mpUtC2aqVCZGNHiYfI3QPPxI+LAKcj+BEkwcAuU2meNWwAFfp6/43AWJapbIqWzbUuBfQidVhFMeU4wXYQ4pnp3vZuJZzBPBnHojq3HAQNFKxYS/PadEctyigEy32WnvIydgs6/4us2olFgL2VP/U/1BZv17JfTGwgpQC4C4VS0eBKD2agweylOcoIjtMmzHxOJqu0UXVhe0V1zUxvUVmCb2PCJOHekVjU9M9VTmHFq0Cu6BpTh7xeMeMDpoxlHGB0VlK5wrR32Fz91hqxEEp1Y/EO0kXBAwAdkJdO5b/BWBxNZnrv4LinGbPw+jTUynD3mzWc/sNKZ48EtqOszJ16/YqmH5c/EAboS/mmGpOGFxxfmjSfqLZ/ziJQz+ga3mcgTCp9tMVbIWvuCCbXv0+wk9mRSWAeCQywCY3nVweOwfL1oIRgozEkSggYQtNQUnMndO6bEyRIjsC/wk2zTpiM14FY+TBQjw7vDUCf6gWVJCKiy2osBiUDUpE43IPlT5caWtByFmIdhHzgo6i/5avxXZD6L8ZGfnWeZv/tNCPddtethKPRbZg8mefb7hYk9OCW4Z98TI5H9O8aImnZXnOJ1rptBTUu1LQjbnz7FjNvTGmHwgMoFerRDVkZZUlJ7JmR9EYc4BYiK4V1pIdQDmbEfE7vUtIvnpyQlS8SpR8QVjuRgM9zQAPG58wbUWAUV5unhYtQzNKuiOC2++DjGwLdy4jlhI8OT58qkrDpeZjcNke/Tf154U9QbdXw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(91956017)(66446008)(5660300002)(2906002)(76116006)(38070700005)(6486002)(64756008)(26005)(122000001)(478600001)(8936002)(66476007)(66556008)(53546011)(8676002)(6506007)(6916009)(71200400001)(186003)(83380400001)(66946007)(33656002)(316002)(4326008)(2616005)(38100700002)(54906003)(6512007)(36756003)(86362001)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDc3QzFSTHl3VjFQQUh2b2lRWWh6cGZQbzFuaVZoK0RZRmVWT2VEV0dFNDcz?=
 =?utf-8?B?S0t2bE8zbTFLc05xM3hyL3BIanBRdWsyQnN1ekFWMWo1NFhoNnVBL2RTLzh6?=
 =?utf-8?B?ZEhTckNIbTREZ2lNNGtzQXBCUXgyNVdzWTVhQzUrZVlkaGhyV1ZHYjkxc2VO?=
 =?utf-8?B?Q0RrS3RNRlZVdUFhWHlTdmI3bTdyNld0OWNoYStXQkxjV3lpL3FMV3FwOFFC?=
 =?utf-8?B?NzJaYXlYQnZVcDFpNUthVTRDSlc0ZGV3YXFmNE9iUmgxZitiRTBuZ0tJUmdp?=
 =?utf-8?B?NHRWVjB6ajBoQ1Flc2M5RGVKNGJ5R0Izd3VpeUczbWQ0UW5HUUZ3VWJuMTZ0?=
 =?utf-8?B?bXpqQU91dkg4SmEwT3NXaEVuQkNiY2NEZ3g0bUJ1RVZ0cDl0SjFyRVZXZGgx?=
 =?utf-8?B?UlZ5MUJ5TVZhcmFrczk4cEh4MmdkQzVWRzNYdlRaUlJ0dXFoTHgxcmphSVNQ?=
 =?utf-8?B?M3BLTXg2VXVMN1NsRTgvZXcxcTBSY1NKUXB1b3RPaktqUnZLTHFjSTZ5L3lD?=
 =?utf-8?B?V3BTVVMwYVo5ZEJPTFoyaHhUdEJZM2VLVW1TenlINGRmQ1NNM0FJVExHN3ZS?=
 =?utf-8?B?YUo4OWEzMDBabm1UWHFMdTdZdXFCUFdDK3NHS2RiN1p1Uld1UlFBQ3o4d2tT?=
 =?utf-8?B?amVZMFJ3Z2wzS1ZyQXZmM1MzemtVV00zY0U5OU9IWCtpa1FTTkFLSDFvejdq?=
 =?utf-8?B?bWNZREhjdjMyeHR6MWliTHc0L3k0TnlsOXNZaldKNmRXTWNOSDFYWE5hdHli?=
 =?utf-8?B?eG9Vb2l6bW1JYzV6RDUwOFM4bVAvOXVBaDlybWVoYkdEc2laSHJ3dGE2bjJC?=
 =?utf-8?B?OGpNU3NDekxHWU1SZVJPVGpsMitpZGdhakdsV3VvS0RoTGQvcXFCR0t5ajJE?=
 =?utf-8?B?Q0tBYjJxZ3RpSFB1T3dWeWhhRG9jZ09pRWRoVnNienkwUE1UZXQvNFU1V3JZ?=
 =?utf-8?B?T1Rkc3dhMVRLWWVQSmhLVkVJdWtySXhFNzdMWW53K0lGaEk5aWFJRVJoMFRh?=
 =?utf-8?B?T0dBd3ZlZDBCZ0pQYnhYdm5PRjVnZWpQRzV4VjhKRlJQK3c4TXBuV1d4Wmsx?=
 =?utf-8?B?bVVnQVQvYVpqRldKdjBqWUtnMkVmN3Q4L1VFWjI3VXRvR0VBdEZCaDBlWjha?=
 =?utf-8?B?Z01zOWpmT1RjZlN1Yld2dmx2Lysvd3dyQ0MrTHRiZ3VIOFFpbUwzUklLaFJ6?=
 =?utf-8?B?L0kvMWZXdTgvRGtUdzlMOVFZbFFMeEV2VkwzYVkyRUxhZTEyUmZHNmpLS2Fv?=
 =?utf-8?B?SzV0bTcwWk5DMHJsQUcrdFZpNm94VjBaZlhMZVdraTgvRWNUQ3UyOWp4djZL?=
 =?utf-8?B?Sm1PdlhFTDg2dFZycUhxVGRUOEtLMXgvZTVWdnNXUElWbnFnRmJOLzBjM2FD?=
 =?utf-8?B?UUk2ek9kaUFwU3d5bXRaMEFtRUxFUTQyclEzU3ZIQjBKeVFOMjBFRnM0N0li?=
 =?utf-8?B?cmRGdm4yYWdIUFhuamFuVWhUTi9ISU9TdWRVR1ZhY0pLdEk0RUM3dXB6eC9u?=
 =?utf-8?B?MHdtMllzcUxDRGFJekxpOVcwZytLQ3lJbm00ejdLcDFlRjEvdGwxMk1NVEZJ?=
 =?utf-8?B?Zm4xL3FZY0JLbU4zYlhsY3ZRKzNMVlpZcjQrbWVPQTlkTFk3WlBhanVwYnJY?=
 =?utf-8?B?OC8xUnZPMENXSEptVGJoVmk5SnhrS0xpZE1ubGxlR1U2eTRTUXRYSXJZU1RL?=
 =?utf-8?B?YVpHSEd3UHEzQnAvd2s4V0xmMGpQU1VUSDBxeUUwdXRvVzlnNi9xRFhLMDlC?=
 =?utf-8?Q?lLJFkzngI2MLjyA7+sz+GOB+B91JYLITxeH8UnJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5D1A7D16B4EFC40BF61D6CC999ACA0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3879
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b5b8dbd-ad40-4e59-b9f3-08d963cca2cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tlGvwZ4vKatQ1m1smvJ6Ue5li5xjcgRfD2DiFcwhnj/YwNEX1C80+QZwIYgDaADmlS0vo1oRVpOVW+OnmwOz1NqZCDI/+d9uUTwwllk3SHXzL+vGN2AJfAvZpUHaz/SId3vuNO9FxvO1VgyZIFsU66ry4UYlRhhzLoqg+D9mUIvjSwuhmacd0OZAwwG1RkoOOiLaS4z7soAkw167Vv2awGfpk+V5MxdaahLDplU0dFeVAqPcVJbE6pFMTeOTKXdnS2WCn4S7T+MgB1pCQmgfuYcVDhP9YNGrfpEUfXlrBvBspPnn5y8cddganGZu34/xq55SsdN6jnZDFA+RocV9deBb8YQ4lNpA120Fh6ICkZg/u3kGEWxWPKcQ/Gs5ChVtm881hJa+ndxmgIgx1d7K37jFTlz/DIBtQGmbzVU1RS2DheU8I9ubbac8GoyXoyCCoSdw1d8wxb//onKtfVd/6B4SgXJK+7q/4WyRkHjtuxCk2ER7eOFbKFolNwXA+b4YLTNLxlnZczOAn3KT14kfcVo1J6tAsIj79Y0DjhcO9MAHvx+foZfwScetHl7d+AYFZ0Y1e7XPLZKdxCA5CCAf0NxktWUHZ5uHFI3WKNSSlNvnKxUMa9DTdmc9u2KtoyhGICMSvJO/Rgy1NEpjuCfTR7Ub6/xFOiSqFyWxdzXdea0uIaGbHwWe5ts9B2mXfJZ1M6+4CcmHaYVA5ftspUO5djh4IUu8/SmIVaoN6K/NutZdAGekqPbkWOuWiGLuY4oWUoBhOVzutcoJQ35Ai0pKelzjDyvQEKW7vzWs5Zfv/gJh/hR9bFShQX0He3cV4TIE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(8676002)(186003)(82310400003)(81166007)(356005)(336012)(6512007)(6862004)(33656002)(4326008)(70586007)(316002)(6486002)(36860700001)(47076005)(36756003)(83380400001)(26005)(2906002)(478600001)(8936002)(2616005)(6506007)(53546011)(86362001)(5660300002)(70206006)(82740400003)(54906003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 11:21:29.6293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fa39b8-38c9-406b-2dd4-08d963cca839
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6750

SGkgSmFuDQoNCj4gT24gMjAgQXVnIDIwMjEsIGF0IDg6MDEgYW0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxOS4wOC4yMDIxIDE0OjAyLCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+IENvbXBpbGF0aW9uIGVycm9yIGlzIG9ic2VydmVkIHdoZW4gSEFTX1BD
SSBpcyBlbmFibGVkIGZvciBBUk0NCj4+IGFyY2hpdGVjdHVyZS4NCj4+IA0KPj4gQWRkIGRlZmlu
aXRpb24gZm9yIGFyY2hfaW9tbXVfdXNlX3Blcm1pdHRlZCgpIGFuZA0KPj4gYXJjaF9wY2lfY2xl
YW5fcGlycXMoKS5JbXBsZW1lbnQgZHVtbXkgZnVuY3Rpb25zIGZvciBwY2lfY29uZl9yZWFkKigp
IHRvDQo+PiBmaXggY29tcGlsYXRpb24gZXJyb3IuDQo+PiANCj4+IHBjaS5jOiBJbiBmdW5jdGlv
biDigJhkZWFzc2lnbl9kZXZpY2XigJk6DQo+PiBwY2kuYzo4NDk6NDk6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhwY2lfdG9fZGV24oCZOw0KPj4gZGlkIHlvdSBt
ZWFuIOKAmGR0X3RvX2RlduKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dDQo+PiAgICAgICAgICAgIHBjaV90b19kZXYocGRldikpOw0KPj4gDQo+PiBwY2kuYzoxODog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcGNpX2NvbmZfcmVhZDE24oCZDQo+PiBwY2kuYzo4ODA6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFyY2hfcGNpX2NsZWFuX3BpcnFz4oCZDQo+PiBwY2ku
YzoxMzkyOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhcmNoX2lvbW11X3VzZV9wZXJtaXR0ZWQn
DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29t
Pg0KPiANCj4gQSBjb3VwbGUgb2Ygbml0cywgbm90d2l0aHN0YW5kaW5nIEp1bGllbidzIG1vcmUg
Z2VuZXJhbCBjb25jZXJuOg0KPiANCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9wY2kvcGNpLWFjY2Vzcy5jDQo+PiBAQCAtMCwwICsxLDYxIEBADQo+PiArLyoNCj4+ICsg
KiBDb3B5cmlnaHQgKEMpIDIwMjEgQXJtIEx0ZC4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
DQo+PiArICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSB2ZXJzaW9uIDIgYXMNCj4+ICsgKiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbi4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBp
biB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPj4gKyAqIGJ1dCBXSVRIT1VUIEFO
WSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+PiArICog
TUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2Vl
IHRoZQ0KPj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMu
DQo+PiArICoNCj4+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KPj4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFt
LiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lg0KPj4gKyAqLw0K
Pj4gKw0KPj4gKyNpbmNsdWRlIDx4ZW4vcGNpLmg+DQo+PiArDQo+PiArc3RhdGljIHVpbnQzMl90
IHBjaV9jb25maWdfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGVuKQ0KPj4gK3sN
Cj4+ICsgICAgcmV0dXJuIH4wVTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgcGNpX2Nv
bmZpZ193cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGVuLCB1aW50MzJfdCB2YWwpDQo+
PiArew0KPj4gK30NCj4+ICsNCj4+ICsvKg0KPj4gKyAqIFdyYXBwZXJzIGZvciBhbGwgUENJIGNv
bmZpZ3VyYXRpb24gYWNjZXNzIGZ1bmN0aW9ucy4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjZGVmaW5l
IFBDSV9PUF9XUklURShzaXplLCB0eXBlKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPj4gKyAgICB2b2lkIHBjaV9jb25mX3dyaXRlIyNzaXplIChwY2lfc2Jk
Zl90IHNiZGYsdW5zaWduZWQgaW50IHJlZywgdHlwZSB2YWwpICBcDQo+IA0KPiBPbmUgb2YgdGhl
IHR3byBibGFua3MgcHJlY2VkaW5nIHRoZSBiYWNrc2xhc2ggd2FudHMgdG8gbW92ZSBhZnRlciB0
aGUgZmlyc3QNCj4gY29tbWEuIEFuZCB0aGUgYmxhbmsgcHJlY2VkaW5nIHRoZSBvcGVuaW5nIHBh
cmVudGhlc2lzIHdhbnRzIHRvIGJlIGRyb3BwZWQuDQoNCkkgd2lsbCBtb2RpZnkgYXMgYmVsb3cg
LiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3VuZGVyc3Rvb2Qgd3JvbmdseS4NCg0KI2RlZmlu
ZSBQQ0lfT1BfV1JJVEUoc2l6ZSwgdHlwZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgXCAg
ICAgICAgICAgICAgICAgICANCiAgICB2b2lkIHBjaV9jb25mX3dyaXRlIyNzaXplKHBjaV9zYmRm
X3Qgc2JkZiwgICAgICAgICAgICAgIFwgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmVnLCB0eXBlIHZhbCkgIAkgICAgIFwgICAg
ICAgICAgICAgICAgICAgDQp7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXCAgICAgICAgICAg
ICAgICAgICANCiAgICBwY2lfY29uZmlnX3dyaXRlKHNiZGYsIHJlZywgc2l6ZSAvIDgsIHZhbCk7
ICAgICAgICAgICAgICAgICAgIFwgICAgICAgICAgICAgICAgICAgDQp9DQoNCj4gDQo+PiAreyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgcGNpX2NvbmZpZ193cml0ZShzYmRmLCByZWcsIHNp
emUgLyA4LCB2YWwpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gK30NCj4+ICsN
Cj4+ICsjZGVmaW5lIFBDSV9PUF9SRUFEKHNpemUsIHR5cGUpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gKyAgICB0eXBlIHBjaV9jb25mX3JlYWQjI3Np
emUgKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZykgICAgICAgICAgICBcDQo+IA0K
PiBUaGUgbGF0dGVyIG9mIHRoZSB0d28gYXBwbGllcyBoZXJlIGFzIHdlbGwuDQo+IA0KPj4gK3sg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+PiArICAgIHJldHVybiBwY2lfY29uZmlnX3JlYWQoc2JkZiwg
cmVnLCBzaXplIC8gOCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICt9DQo+PiAr
DQo+PiArUENJX09QX1JFQUQoOCwgdTgpDQo+PiArUENJX09QX1JFQUQoMTYsIHUxNikNCj4+ICtQ
Q0lfT1BfUkVBRCgzMiwgdTMyKQ0KPj4gK1BDSV9PUF9XUklURSg4LCB1OCkNCj4+ICtQQ0lfT1Bf
V1JJVEUoMTYsIHUxNikNCj4+ICtQQ0lfT1BfV1JJVEUoMzIsIHUzMikNCj4gDQo+IFdlIGFpbSBh
dCBlbGltaW5hdGluZyB1PE4+IHVzZXMgaW4gZmF2b3Igb2YgdWludDxOPl90IC0gcGxlYXNlIGRv
bid0DQo+IGludHJvZHVjZSBuZXcgdXNlcy4NCg0KT2sgLiBJIHdpbGwgbW9kaWZ5IGluIG5leHQg
dmVyc2lvbi4NCg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBKYW4NCg0K

