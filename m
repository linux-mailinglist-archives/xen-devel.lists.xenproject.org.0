Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1F2DAA4F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 10:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53003.92494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp6rs-0005pP-8U; Tue, 15 Dec 2020 09:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53003.92494; Tue, 15 Dec 2020 09:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp6rs-0005p0-5B; Tue, 15 Dec 2020 09:43:40 +0000
Received: by outflank-mailman (input) for mailman id 53003;
 Tue, 15 Dec 2020 09:43:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kWjD=FT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kp6rq-0005ov-H1
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 09:43:38 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.56]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d027654b-4a39-495c-a82b-6a57fde61bdd;
 Tue, 15 Dec 2020 09:43:37 +0000 (UTC)
Received: from AM5PR0502CA0007.eurprd05.prod.outlook.com
 (2603:10a6:203:91::17) by VI1PR08MB2765.eurprd08.prod.outlook.com
 (2603:10a6:802:18::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 15 Dec
 2020 09:43:34 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::96) by AM5PR0502CA0007.outlook.office365.com
 (2603:10a6:203:91::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 15 Dec 2020 09:43:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 09:43:33 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Tue, 15 Dec 2020 09:43:33 +0000
Received: from 0a9899d5fa4a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F511974-48C0-47E9-8073-4E4D9278C132.1; 
 Tue, 15 Dec 2020 09:42:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a9899d5fa4a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Dec 2020 09:42:55 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2166.eurprd08.prod.outlook.com (2603:10a6:4:85::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Tue, 15 Dec
 2020 09:42:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 09:42:54 +0000
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
X-Inumbo-ID: d027654b-4a39-495c-a82b-6a57fde61bdd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzCfZ4dkI+6GzsvDBOmc9NLeXomTJwtVy73SG90+9K4=;
 b=gY03mZ0zDR6+Jfq/dGGBskNl17UlUnWgAXzCUPvfU1KtmSoo8XqB8o4Se9CzxfV8bWHj3xV68Kxn3rXo5wtzSAUwD796RCz/qSq2q8T7EGpT3Z3oyEIsVY91ZDJVe2XTQrzhip5wqq7a3S32dtFLdHxYmv/Q/QPZdxg/qqGfqx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71e8f12a5191d1c1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqF3JsHoqVopjRMSfttRJptIFqWjIXemFZfK8H931o/1iz4b2J4G9AhemKjkAR0fg1+pb/LS2nu6KMikNu7MC1wPianXME6zg7E1pOhdcCooYW3izYy/4G075eQyr+tmgJoYfFDlzLFGdf36F8kPflyhJf+nBN9/ssFjCEsxJqmD1uldlkBW+8CpKk+B9TfIlcbJ4ZOjrg3L1aN4yQ0bEnK3oT9f0+gsoeWtbPCH4AM/7swlFCreRZQarZZxBfiLk4IV51bkjlSaG1ktpOpKO9wnZP50KWgHTxUe/NyHXP6w1VjYKbeKuh/tTnoRlKlv5tqAbVmFPl2ZoHa4yXgwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzCfZ4dkI+6GzsvDBOmc9NLeXomTJwtVy73SG90+9K4=;
 b=cJ6wwO7oLyQhh9rBjFycc2WUC9/bJ+By/ovQ0wz58GGMvKCRjv/01gUYOJ3FKMgvmefNsRFWEssJ+AXrsuJ88NJkcA6bok8jWKWPUGXxmsTb18hlWkc63mrPpF47N/UDmM5OvRFobxxi2ge5yUIUhgIga3Zo5LLYyj0vPbiPLyntq3xpMk2DMgwYUGvbIJb0L8DrZB+d3zAyOeNfLe3NG3t6Y6iq3S97dETkA/PQFpF59ygMmwTNOE7ChvfnsPM4zk1xefJzscrnuXMeoAwjsUvnH8vBIBxT9doCxlzUzKqxKtahOwJgVO+ZEZYqiCOlHXDgKPx4JrsBXndrF2R+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzCfZ4dkI+6GzsvDBOmc9NLeXomTJwtVy73SG90+9K4=;
 b=gY03mZ0zDR6+Jfq/dGGBskNl17UlUnWgAXzCUPvfU1KtmSoo8XqB8o4Se9CzxfV8bWHj3xV68Kxn3rXo5wtzSAUwD796RCz/qSq2q8T7EGpT3Z3oyEIsVY91ZDJVe2XTQrzhip5wqq7a3S32dtFLdHxYmv/Q/QPZdxg/qqGfqx4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Index: AQHWzxYvVX92i8NXPkeNMctPP72KNqnx9LwAgAUGOoCAAAdQAIAA7OAA
Date: Tue, 15 Dec 2020 09:42:54 +0000
Message-ID: <CD549B7A-97C8-40F6-B762-6661A7EFAED1@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
 <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
 <1660236F-7BB0-4F3E-8CDD-10AE9282E2A3@arm.com>
 <6d693361-220c-fa1b-a04f-12a80f0aec4a@xen.org>
In-Reply-To: <6d693361-220c-fa1b-a04f-12a80f0aec4a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab773086-c665-4340-1f1d-08d8a0dde387
x-ms-traffictypediagnostic: DB6PR0802MB2166:|VI1PR08MB2765:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB27655DDEE52A95BF6D16A0809DC60@VI1PR08MB2765.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KHhz885yeH11hIuihwUhoSDFurlCq6u8C15DGnSrG++PRpB0bea2l7X0wQLeRfse60g4AqKpIvKt6izR0yy3DsQgGi2rAVxguVRNBZczLr3x9PQYGc8RkdyDph5ucCmdXjqKaBQNDf3siyGVQJP0CTRrsRikPnhfvdWQJengnUttcW1/Wq+9Feqx18upCpVu4cPtxmhcajMiBK6R4mnHw17civoaKqUQkUVwFUJaoyPbg9PTZNixSmwY6SIFS0Tx6ZXtw+EaAYAIlj3wjR1yULuDFv+kj04zrEn4JqKnXGciWrYYWrgesQ3HBJ/5HX3O9UbEZQSt1Q0MD4h23jewaUvImzOVz8XONdXVh7mFm4N7cS2xx4NXzbK8BAeK77ym
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(316002)(66446008)(186003)(478600001)(66476007)(66946007)(54906003)(91956017)(64756008)(6512007)(66556008)(33656002)(76116006)(8936002)(6916009)(7416002)(83380400001)(4326008)(2616005)(5660300002)(26005)(36756003)(8676002)(86362001)(71200400001)(6506007)(6486002)(2906002)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?7z1Ub+4hJoU7rSqsHoKKxwU0q2/oGsZwdA2nfsyJty38rrdYY/zN5mSuSjiM?=
 =?us-ascii?Q?vXOUeWVdsF3LwOTyc9ARnj6b9yHGj4A59jlrfQ6kVx3iccOrCMTzDKNvPkQx?=
 =?us-ascii?Q?urWhxN2mKxdxgcG23hEf++LJS7vCkAdOSYrt3unCLUvDvKY7HZ9C7Snguc4f?=
 =?us-ascii?Q?stRnPdByDsL9iL9R/k9iGqVsODvlZgdSINYDBUwCGpqtNkfAg+QmmeHvDhi4?=
 =?us-ascii?Q?MrrlbI9nK8btFqQrXA4iosFbTv5U+yVnTGLqrOLKQIdtfzSQTGQ/3xbk88u7?=
 =?us-ascii?Q?MJJE8oMNGZBlhupP64ZX/ibKgUSOIIJ6QNMGGfNnTBvqsmuqLKDicsYUgWi0?=
 =?us-ascii?Q?Ma/CXk2TaditcX81eDfRUuyjpW9KkrTzBZ9X3HdsnaIgwZf+DooFdybUWGnC?=
 =?us-ascii?Q?OH7XivQWGorGEwZ6Syo4a25gxfwGN9hQ658VU/kUIF3tz8j+7G5dSABflzFJ?=
 =?us-ascii?Q?XYDpwK2lhM8YuSD3m6Jn7bfQZLinrwLNn18QIfyfpeSP4FoLJqiVjylrTMWf?=
 =?us-ascii?Q?VlLWjmJZhI4cw0iJto8xaUVkfqoZZW2hmmfAEaoObtAK1pMUVAMJsQ965m38?=
 =?us-ascii?Q?zQDiVtabA45trtGWbdkxNeoWMXoT9W2rd9J7+c2FhMVENkYLovduPlDSxCYa?=
 =?us-ascii?Q?UWYHqSpqK6LzBKdiXYqzdV6YLj9rugDhDJ5o67Nh0yyrNIiWKzfIyF3bciRf?=
 =?us-ascii?Q?yaCPcBgaExXIpemtstB6K+DA0A634srk/xG6teLzI5akolMW/Wtshkhf8rXJ?=
 =?us-ascii?Q?BLVq6XMScTuVsS3Eysvfdu7RhmZKPgAjhBq/0vmKFVKfq8KECeJZWr1ipmdr?=
 =?us-ascii?Q?BPDq5hhXb0/jlmI5hI4B1MOCUAp51qN+gmRuaIn0zv8pYbU/GrFpurM0xkNv?=
 =?us-ascii?Q?d+bsGUdJcYzEal7anKOYLbdBtZ0dZeKSYWLiOps5L8E9SYaAPoH+aVhARhs3?=
 =?us-ascii?Q?Hhfo12F97qEioa1GVWdtFGWgjTNYTY5XZ/IwtnbMiTsaZLZj8fc6xn3MTG1O?=
 =?us-ascii?Q?+k/o?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68AB3AEB0E46974595D7AEC76A2F7A45@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2166
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4339a8d-88f7-4c9e-678a-08d8a0ddcc5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	laB3cTuPiDoaLlXk3JciNrFVao0aCQzf4ZlEoEuA13L9pBMUFWEckQdzdZqaH9RFCLIgU0fPB3si4rmvU0WapnZj1NFbYOJXxZGeHVfUFNZeo9V2hETdg0XI6NlN0XNOXIDUNOglxNp4TAUPKEUOCKIouZZ/1UWo50lghZCmt6rKG7wjT0igXQZ+J1mysjeKjVCiCWQJb9lC1tjpT9kKu51v7P/WWuS+P0KcSJYEAb6PyqzX6x7XE70NB2WzCMRGltGaBFYCgzaXe8MI36hUlrmsJXlmzZqMqLqBKqasp7juxwJ2gkNkEoeeurBsleyVKyVCXrdpdO+ISnECaskcSIRUgPKHNTuAwQFR70QlBVku0OoL/AgRDJcTQsetuvddif6u6/dVpw8Xm827yOlAiA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966005)(36756003)(2616005)(4326008)(6486002)(6506007)(81166007)(8676002)(70206006)(6862004)(86362001)(70586007)(47076004)(2906002)(33656002)(316002)(5660300002)(53546011)(8936002)(83380400001)(6512007)(82310400003)(107886003)(54906003)(336012)(186003)(356005)(478600001)(26005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 09:43:33.7825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab773086-c665-4340-1f1d-08d8a0dde387
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2765

Hi Julien,

> On 14 Dec 2020, at 19:35, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 14/12/2020 19:08, Rahul Singh wrote:
>> Hello Julien,
>=20
> Hi Rahul,
>=20
>>> On 11 Dec 2020, at 2:25 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Rahul,
>>>=20
>>> On 10/12/2020 16:57, Rahul Singh wrote:
>>>>  struct arm_smmu_strtab_cfg {
>>>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>>>>  		u64			padding;
>>>>  	};
>>>>  -	/* IOMMU core code handle */
>>>> -	struct iommu_device		iommu;
>>>> +	/* Need to keep a list of SMMU devices */
>>>> +	struct list_head		devices;
>>>> +
>>>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>>>> +	struct tasklet		evtq_irq_tasklet;
>>>> +	struct tasklet		priq_irq_tasklet;
>>>> +	struct tasklet		combined_irq_tasklet;
>>>>  };
>>>>    /* SMMU private data for each master */
>>>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>>>    struct arm_smmu_domain {
>>>>  	struct arm_smmu_device		*smmu;
>>>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>>>=20
>>> Hmmm... Your commit message says the mutex would be replaced by a spinl=
ock. However, you are dropping the lock. What I did miss?
>> Linux code using the mutex in the function arm_smmu_attach_dev() but in =
XEN this function is called from arm_smmu_assign_dev() which already has th=
e spin_lock when arm_smmu_attach_dev() function I called so I drop the mute=
x to avoid nested spinlock.
>> Timing analysis of using spin lock in place of mutex as compared to linu=
x  when attaching a  device to SMMU is still valid.
>=20
> I think it would be better to keep the current locking until the investig=
ation is done.
>=20
> But if you still want to make this change, then you should explain in the=
 commit message why the lock is dropped.
>=20
> [...]
>=20
>> WARN_ON(q->base_dma & (qsz - 1));
>> if (!unlikely(q->base_dma & (qsz - 1))) {
>> 	dev_info(smmu->dev, "allocated %u entries for %s\n",
>> 		1 << q->llq.max_n_shift, name);
>> }
>=20
> Right, but this doesn't address the second part of my comment.
>=20
> This change would *not* be necessary if the implementation of WARN_ON() i=
n Xen return whether the warn was triggered.
>=20
> Before considering to change the SMMU code, you should first attempt to m=
odify implementation of the WARN_ON(). We can discuss other approach if the=
 discussion goes nowhere.

The code proposed by Rahul is providing the equivalent functionality to wha=
t linux does.

Modifying WARN_ON implementation in Xen to fit how Linux version is working=
 would make sense but should be done in its own patch as it will imply modi=
fication on more Xen code and
some of it will not be related to SMMU and will need some validation.
So I do not think it would be fare to ask Rahul to also do this in the scop=
e of this serie.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


