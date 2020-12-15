Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9282DAB6B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 11:52:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53051.92565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp7vw-00043Y-Ps; Tue, 15 Dec 2020 10:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53051.92565; Tue, 15 Dec 2020 10:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp7vw-000439-Mb; Tue, 15 Dec 2020 10:51:56 +0000
Received: by outflank-mailman (input) for mailman id 53051;
 Tue, 15 Dec 2020 10:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kWjD=FT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kp7vu-00042I-U5
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 10:51:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::612])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7a000eb-2963-4d24-a371-2c58a4570b0e;
 Tue, 15 Dec 2020 10:51:52 +0000 (UTC)
Received: from DB6PR0202CA0040.eurprd02.prod.outlook.com (2603:10a6:4:a5::26)
 by VI1PR08MB3838.eurprd08.prod.outlook.com (2603:10a6:803:b8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 10:51:49 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::e0) by DB6PR0202CA0040.outlook.office365.com
 (2603:10a6:4:a5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 15 Dec 2020 10:51:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 10:51:48 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Tue, 15 Dec 2020 10:51:48 +0000
Received: from 9a9c661c9ebe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7218F7FF-D947-42D2-A1CD-ED1FFF6ABD9B.1; 
 Tue, 15 Dec 2020 10:51:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a9c661c9ebe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Dec 2020 10:51:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1909.eurprd08.prod.outlook.com (2603:10a6:4:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Tue, 15 Dec
 2020 10:51:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 10:51:10 +0000
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
X-Inumbo-ID: f7a000eb-2963-4d24-a371-2c58a4570b0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cZP+bG6ufanOe/QG9Shy+mV6coSZ8lZ3AJAYjtc1rI=;
 b=j1KMRSq1u9hJmEbxJ6vTRMknki8dYSmVO/TMTQO/XA3+hq+IQvCat/wFBC/waVCVlZHptTUceljYMAkgiIfZ3S8Yr0qIiEAvOuwl5mI2kSYcHoJA6o3Zl6/8dOcoUz5z50A2Uc0TJkdA8jc0E+5BrGEq8MFPE2V9Wo6xYTvqoUs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a16aaf9e87e4bb3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhOh2/KnmQITG/VPm1tKYMyFxh/LKtoCi2mO9AZxiO53lHkHm+jWEg5TrkORJjNamweyvoIH7jf0vW4ML8bxAiTBkD4d8s55HtdpT+zqbj6/v2ixFVwrtBslyhbigDlUXWXsgGSYXMtlKNdKcyVpBJzPD1pK/qW7W1/3vX/dACfq85H3EBWHSUJdwFFRj+BYtzLwOLd+OCL20EWhNorYl7kAosgdkF7hFtbAEsi152Mct4PE3iGvnV4BgZ01eZHz3/QMRJbk+xR/VkJBYrUU1w7AyafX6FWc0dgVZBQIjPenjzddJgqn3zmVIC0xbw3/RBnv70FOu6vHXFoW+c4Dhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cZP+bG6ufanOe/QG9Shy+mV6coSZ8lZ3AJAYjtc1rI=;
 b=hRXi1LSB6LhJm8rnM5v76c5DwSn1E02VgiS9++8Sx8s8lwrQqS+ydSoxg+0Zv7PC+bZAaaiQiJ3tm3du35rYn6ZeoCPLeiDRI1zq0CR6qcL6Lv4xZNYIoIgY+F2VnIFt7/tf6UbKon7MJR1f9n0WOxpdbp9JH3ETC6x3IMRxGfnyi4MILrPf2RmX394oUin943H9jgKdFJoasIkZINSXE5INr7j2LjG8sRHxgHiO3cqlusdnqAfeiy0rR1siaBCzQ4jhNd12fhFWNYkBgMzxfpzfssua+hGeDlH2Hr2UlRPuid6GJnguLmRQ89Va8UH8JDNAX6kZ5f13sX3I1xW24w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cZP+bG6ufanOe/QG9Shy+mV6coSZ8lZ3AJAYjtc1rI=;
 b=j1KMRSq1u9hJmEbxJ6vTRMknki8dYSmVO/TMTQO/XA3+hq+IQvCat/wFBC/waVCVlZHptTUceljYMAkgiIfZ3S8Yr0qIiEAvOuwl5mI2kSYcHoJA6o3Zl6/8dOcoUz5z50A2Uc0TJkdA8jc0E+5BrGEq8MFPE2V9Wo6xYTvqoUs=
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
Thread-Index:
 AQHWzxYvVX92i8NXPkeNMctPP72KNqnx9LwAgAUGOoCAAAdQAIAA7OAAgAAIcgCAAAqfgA==
Date: Tue, 15 Dec 2020 10:51:10 +0000
Message-ID: <99C334D2-B77B-4B8A-8294-00A811CFB80B@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
 <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
 <1660236F-7BB0-4F3E-8CDD-10AE9282E2A3@arm.com>
 <6d693361-220c-fa1b-a04f-12a80f0aec4a@xen.org>
 <CD549B7A-97C8-40F6-B762-6661A7EFAED1@arm.com>
 <da26c36c-97ec-d9f6-abfd-642017c3df5c@xen.org>
In-Reply-To: <da26c36c-97ec-d9f6-abfd-642017c3df5c@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: e808acf1-12da-4ae7-eae5-08d8a0e76c3e
x-ms-traffictypediagnostic: DB6PR0801MB1909:|VI1PR08MB3838:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3838E2F2934D217D26ACDDF59DC60@VI1PR08MB3838.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BZenN5KiJOD9WNGK4GxKCVQtmXjK8YxsmxFfpK1U69Hy93rhHy1wiqHH/s/AOzkU90X2MKRn7BGFUoOU7hu2awOiks4UPudbSZMpkh4Ja246OliHWBGz5dsRnyIo9qvjX/A3QoiJqag5wlGmektNt/zUIiSWxLb0YircHsruEbDwPQBj58DrN9udwe1cgytmCofnskYi3+ehKzL/MqSrRg20T6udcTzY8+IZbQVpEAzgkgGwNaBCMNKkCw0D/HKmjQO7ed7RhZjISsF23RPPBba9/WteBYjrsKDXNavchgekVIfzXrtzlutJ7hL1G0gR4+YyeWGKnkfgRhGIf6DeDXExwtUsDjNxcNGdSGfz5yEimpTQLbQkbC2eqTG650B2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(6506007)(6486002)(4326008)(64756008)(53546011)(186003)(8676002)(6512007)(5660300002)(86362001)(7416002)(36756003)(91956017)(478600001)(76116006)(2906002)(66946007)(8936002)(83380400001)(26005)(6916009)(54906003)(2616005)(66446008)(66476007)(71200400001)(66556008)(33656002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?74guz9zU0MikcyWxj/QDzrILVpnO6Of1cV/Ro2D9dZucZj58HtJi/TnAGQcy?=
 =?us-ascii?Q?UPI0OgX6zMJPtpKxAL0PAKm9EIvWL/aE8enAOoEv2di33x/j6eQ89d54lgfz?=
 =?us-ascii?Q?wl3JLH/IzkirVJyguPB9pIL/GPqlxl0N5y4MDWeplnXmcM/d0k4IVhhyf0EL?=
 =?us-ascii?Q?WJCEclyOHnTDpKo/QJn4mxDUAQlSB06bzX+QioqLciJDE4N9qh3qaAnbQfSP?=
 =?us-ascii?Q?Jw7VYe5bZU5BOFzdJ4BQH6/K4ARMYQ+7+rB0I4I4EpbASGbYnO27Mq6qFjxZ?=
 =?us-ascii?Q?E0iZhJJwVRzay1kW5uetHApDDIC5MOyhrOnBdZjIJ05Z1f5U3DJn2mPWX/qH?=
 =?us-ascii?Q?cBy87P4sYzIN95EIOo0ajtadW+UZ6OQoJgsmCBH6sg8r2m57GPNLjGS+Tyxb?=
 =?us-ascii?Q?++eZj+acDHxfg/SGNiWIGye58xfSjnF7SplLjD+re5Xm1+x6OK/e27f9/74P?=
 =?us-ascii?Q?kRNpiLK/qyOYHtGlxqb9jcDdtN8r42UnmVTynKpOf1euSp+xuvTov6aXcwGX?=
 =?us-ascii?Q?qIbs70iG4zLh7MzDNQamHjH391Y3rIXfXk8P/bPQo8isnjC4i7sWRvY0fm1F?=
 =?us-ascii?Q?iD5pAc2f9pcvpH6rQsAApDbUIfWlL1T0IGW3L8nyP2n45KMsz0U6sPIFoYrU?=
 =?us-ascii?Q?axeFCXXYxWJ5Nu/sHcokfIUlnGfzvyzTz44xloJ/aXu0Fwz0WxEVuexrxo9s?=
 =?us-ascii?Q?fCZuxDHwNlwVkRiqC2fR06fvIPw9rNs3LuaeggdHV9d2cTIhANVGFH4Wo94N?=
 =?us-ascii?Q?mkHb6MLkQ+vQPP/3gxtYop0/IL2BnEMnrCbI7A1jV6FBdkx+nxAjrK18+yzJ?=
 =?us-ascii?Q?QnHlh1T5ANAdbQwvD13i9QHi2cSpiB545thKb+Db7UiuCpKc+tYVv1eEMnom?=
 =?us-ascii?Q?5ZN5dkBhVRBjTEkzYOrQiMh0zNCo4gLJwEFghlL+4gSQc9YK5WRqFaVQ3gTX?=
 =?us-ascii?Q?z5Y0JKLBYVWrgdebQUCf3CXqiO+x8W/ParuYKP5BE38F0kVllxeMsjXkuaFa?=
 =?us-ascii?Q?gpiU?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C2CE6A0117DE5C46AFBEF5281587279B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1909
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a1eb9e2-0daa-46d9-e40a-08d8a0e7554a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iOQuXN4i/TjXVKfEmoYnAflI1w75B2irRqTvdoCjEbK4YeLNJ+u3jydNwCKJrr/aVcHirqTrLzWRMheQ7QbVYsOMmSRcOMIy2K12EszA+gQ4IVKh96oo/r2z6FiVdAn5RYI7wUBFN2YN+U7sDQbvIgF4G+kqc2hdDSUopfbZ0t9EmlRnGBxWxwalB9RPc7MM0qzlI3ggvv4peevxUjtICKcjxpbhs0q35nlEYXK1kbnrz4hiEvBwimx1wKs3YG2HKI0/oNggMcfKe7X3T8qRTZljaZ4JpUgx/bzNR5DRFyTqqK8/10KjbfscxS0hzWwrCLbnEpVK7eV4k/GdQgaBjtT2+WCYDOQKXCHUVMN7KZ1dWxcSIOYATsXyl9mRahawIudE50S1Ze2cZ2zRvcXqGg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(396003)(346002)(46966005)(478600001)(4326008)(70206006)(33656002)(6486002)(8936002)(82740400003)(5660300002)(83380400001)(36756003)(70586007)(6862004)(186003)(26005)(107886003)(316002)(336012)(2616005)(2906002)(6506007)(356005)(86362001)(81166007)(54906003)(82310400003)(53546011)(8676002)(6512007)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 10:51:48.6777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e808acf1-12da-4ae7-eae5-08d8a0e76c3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838

Hi Julien,

> On 15 Dec 2020, at 10:13, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 15/12/2020 09:42, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi,
>=20
>>> On 14 Dec 2020, at 19:35, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 14/12/2020 19:08, Rahul Singh wrote:
>>>> Hello Julien,
>>>=20
>>> Hi Rahul,
>>>=20
>>>>> On 11 Dec 2020, at 2:25 pm, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi Rahul,
>>>>>=20
>>>>> On 10/12/2020 16:57, Rahul Singh wrote:
>>>>>>  struct arm_smmu_strtab_cfg {
>>>>>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>>>>>>  		u64			padding;
>>>>>>  	};
>>>>>>  -	/* IOMMU core code handle */
>>>>>> -	struct iommu_device		iommu;
>>>>>> +	/* Need to keep a list of SMMU devices */
>>>>>> +	struct list_head		devices;
>>>>>> +
>>>>>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>>>>>> +	struct tasklet		evtq_irq_tasklet;
>>>>>> +	struct tasklet		priq_irq_tasklet;
>>>>>> +	struct tasklet		combined_irq_tasklet;
>>>>>>  };
>>>>>>    /* SMMU private data for each master */
>>>>>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>>>>>    struct arm_smmu_domain {
>>>>>>  	struct arm_smmu_device		*smmu;
>>>>>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>>>>>=20
>>>>> Hmmm... Your commit message says the mutex would be replaced by a spi=
nlock. However, you are dropping the lock. What I did miss?
>>>> Linux code using the mutex in the function arm_smmu_attach_dev() but i=
n XEN this function is called from arm_smmu_assign_dev() which already has =
the spin_lock when arm_smmu_attach_dev() function I called so I drop the mu=
tex to avoid nested spinlock.
>>>> Timing analysis of using spin lock in place of mutex as compared to li=
nux  when attaching a  device to SMMU is still valid.
>>>=20
>>> I think it would be better to keep the current locking until the invest=
igation is done.
>>>=20
>>> But if you still want to make this change, then you should explain in t=
he commit message why the lock is dropped.
>>>=20
>>> [...]
>>>=20
>>>> WARN_ON(q->base_dma & (qsz - 1));
>>>> if (!unlikely(q->base_dma & (qsz - 1))) {
>>>> 	dev_info(smmu->dev, "allocated %u entries for %s\n",
>>>> 		1 << q->llq.max_n_shift, name);
>>>> }
>>>=20
>>> Right, but this doesn't address the second part of my comment.
>>>=20
>>> This change would *not* be necessary if the implementation of WARN_ON()=
 in Xen return whether the warn was triggered.
>>>=20
>>> Before considering to change the SMMU code, you should first attempt to=
 modify implementation of the WARN_ON(). We can discuss other approach if t=
he discussion goes nowhere.
>> The code proposed by Rahul is providing the equivalent functionality to =
what linux does.
>> Modifying WARN_ON implementation in Xen to fit how Linux version is work=
ing would make sense but should be done in its own patch as it will imply m=
odification on more Xen code and
>> some of it will not be related to SMMU and will need some validation.
>=20
> Let me start that this was a request I already made on v2 and Rahul agree=
d. I saw no pushback on the request until now. So to me this meant this wou=
ld be addressed in v3.

I think he agreed on the analysis but he did not say he was going to do it.

>=20
> Further, the validation seems to be a common argument everytime I ask to =
make a change in this series... Yes validation is important, but this often=
 doesn't require a lot of effort when the changes are simple... TBH, you ar=
e probably spending more time arguing against it.

Testing is important and effort evaluation also depends on other priorities=
 we have.

There are 20 WARN_ON in Xen and most of them are in x86 code.
If we do this change, the serie will impact a lot more code then it origina=
lly did.

I am not saying it should not be done, I am saying it should not be done in=
 this serie.
Such a change would need a serie upfront and then rebasing this serie on to=
p of it to prevent mixing stuff to much.

>=20
>> So I do not think it would be fare to ask Rahul to also do this in the s=
cope of this serie
>=20
> I would have agreed with this statement if the change is difficult. This =
is not the case here.
>=20
> The first step when working upstream should always to improve existing he=
lpers rather than working around it.

I agree with that statement but we should be carefull not to ask to much to=
 people who try to contribute so that they
do not feel like all changes asked are not too much to handle.
I am open to create new tasks on our side for the future when things to be =
improved like this ones are revealed by a
serie.

If this is a blocker from your point of view, we will evaluate the effort t=
o do this extra work and the serie will wait until
january to be pushed again.

Please tell us what you would like and we will check how we can plan it.

Regards
Bertrand

>=20
> If it is not possible because it is either too complex or there are push =
back from the maintainers. Then we can discuss about workaround.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


