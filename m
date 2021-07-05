Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03AB3BB90B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149912.277266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jtv-0008Kw-Vn; Mon, 05 Jul 2021 08:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149912.277266; Mon, 05 Jul 2021 08:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jtv-0008J4-RO; Mon, 05 Jul 2021 08:24:23 +0000
Received: by outflank-mailman (input) for mailman id 149912;
 Mon, 05 Jul 2021 08:24:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jU53=L5=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1m0Jtu-0008Iy-QM
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:24:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65a38be0-dd6a-11eb-843f-12813bfff9fa;
 Mon, 05 Jul 2021 08:24:21 +0000 (UTC)
Received: from AM7PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:20b:100::23)
 by AM9PR08MB6802.eurprd08.prod.outlook.com (2603:10a6:20b:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 08:24:19 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::c9) by AM7PR02CA0013.outlook.office365.com
 (2603:10a6:20b:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 08:24:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 08:24:18 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97");
 Mon, 05 Jul 2021 08:24:18 +0000
Received: from f1e79c82518b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC153FE1-2DB6-43C6-86DC-8DFF67DD35E2.1; 
 Mon, 05 Jul 2021 08:24:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1e79c82518b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 08:24:11 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6589.eurprd08.prod.outlook.com (2603:10a6:102:159::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 08:24:10 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5%3]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:24:10 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1aa::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 08:24:10 +0000
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
X-Inumbo-ID: 65a38be0-dd6a-11eb-843f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEl4brartcAHQUPbgw9ZN9Araas3hK5D+e7rf16BL8U=;
 b=qTAvGIb8pc+5GZqweFCFqFdSvU3clQ4SsKOMe+73X98hE/QV7ZUigq/f11r+z+a/U7FUXzKpxf52coQHQoMi5wWJPXjXLWpMZPewKfPWi6zMHk2DkOLMOAt/isRI4QXpUvuhrRVEflAhLlGu1mkJmBBGqlYZtFQo7NI09j3H2EU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d3061f4468de5f4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTM334XLOVzTICEGsc2PyISJGN+4eM/70cByTZVuNWl25N6rIrh8z6U/qCdOn/ZoZw6xpTdhpf44OFYRy8nzT293wqlkSIZpXvbbJsoqEob3SyBwjzIOVD+6lQe0bjei2WEww5EkseswITxP9PpPcGg0FcWdn8QuRhNu14HpNZgdqnotijdZs6JycwFFDaPO9ZhI40JaQB24aeKjQVwxbDmiSvKBuV8cGB+8nTK2Lod4i7onNYHmCRp+sU7iqASe0ZK8WJw8AB8743xzV/C2BZP9KA/kuBKUQ5LfkxaEkeIE7ox2oEKLYZ0GiOZHB/q5erDAZu3Atr29fUZSLm4ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEl4brartcAHQUPbgw9ZN9Araas3hK5D+e7rf16BL8U=;
 b=DqQrucEqNsK8Gk7LjELBg5rkoyFaYLxXZNcuMbu95HjyzZULmGWbFfnjyNyyZYDOetFXlzZG6bnI697g99oz4wA+nGYsgFTn71wt1rdief61tnnO3tMYAAasOhxSURAGDxpShGuVtHdHpj03Ol/oMFWviZY9xTn2kxLuH465ZVLfv8/nUZs2W5FzV+/06ZAlk91wMGGgecFe6viP0fjsQuSV9nEVF+6p80/IXyBgZSFCQ2/wTiXHSZh7D2f7DquxxuUEvahsEAIEAnk5U+4DOC0Mcw2dvgXKyuzycjqNjmt1HV3H7wVKbOyFxp1L3/R6ibi5pw92Y5mNViw4VRl4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEl4brartcAHQUPbgw9ZN9Araas3hK5D+e7rf16BL8U=;
 b=qTAvGIb8pc+5GZqweFCFqFdSvU3clQ4SsKOMe+73X98hE/QV7ZUigq/f11r+z+a/U7FUXzKpxf52coQHQoMi5wWJPXjXLWpMZPewKfPWi6zMHk2DkOLMOAt/isRI4QXpUvuhrRVEflAhLlGu1mkJmBBGqlYZtFQo7NI09j3H2EU=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] tools/xenstored: Stash the correct request in
 lu_status->in
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210701140307.2516-1-julien@xen.org>
Date: Mon, 5 Jul 2021 09:24:04 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <42DD523A-826E-4404-9B50-2BF0494F882B@arm.com>
References: <20210701140307.2516-1-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24b16ae6-a2d8-43e4-c966-08d93f8e48ca
X-MS-TrafficTypeDiagnostic: PAXPR08MB6589:|AM9PR08MB6802:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB68028276F80EAD1D55DC8B79E41C9@AM9PR08MB6802.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8koR8Qwg/F0YE+u6TeQCr0UIRT8GHT9ln/fw41Uw6eUt2DpluJznsOOgdneFfn2wjGsBs35MPeTD2WRxGsaJ28Not/GTfqYpdE8iH5RbW5+SpwilITevhWLYxEJh4f62RO2inmmUSGiBwX1EcPuCr0bWHZafhcsKaucPsO8hteRvQ8yU53qs0Kh8mjRFic3Gq5vC7js2Rpl+3Rycj6C7Jm0GEuubkpS3zOSkQPJwMlNkgon5qsmzqoQQrfqLwrQJRphKbSozkwWR77taxUQ4cvi3BQf7IIlezBfvc7BsRmMDh7MsWtjAT3/e6hj3jE0LFnJY+eU3Am75VbOx5JD1Sm1fhuJD8Ri/aWF8+ivuV55Q1cUJk02wwK/gJ8TLjyEAV6hbaQMqt8rWMfzLPtAbYUbLguSE5H6U/htxpNOH+NTMEZKF2c1btM2KDC2Q9CDgdp2yWjKgItoPaUSPmm31CuWDL2yFmgWWcMZm54eBi1GSnVs+n8mtTTuX07oKPnb3lUS822ftjoVRCJQThxN/b86ge58G/2Uk3PSNcz5y9dXArC2EI+t3JPjmUzICjdjt5h9sn89N0N/JJ6zS4eyutPIy4h4I8gV78OfMNRAGezMlMS47kp7tf4FOqsVlFZk9rp8wFQeyvcpbu8dIZ7z9OWqDef/SAWBTGH2VWG8PoS5ML7wo/fKEcV6L3mz2x+VrdKsVLtf6UdvG/Tb37W6vfXiH+jc1WG3A72tdHFdFhaQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(136003)(376002)(396003)(86362001)(2906002)(6506007)(478600001)(66476007)(6666004)(36756003)(186003)(16526019)(26005)(66946007)(66556008)(53546011)(5660300002)(38350700002)(38100700002)(6486002)(6512007)(8936002)(54906003)(956004)(6916009)(4326008)(33656002)(44832011)(8676002)(52116002)(2616005)(316002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?N0psGr8S/FxZJ/DkFBVQU/fABub+huovF+Kc2F10Q0Ye1gytExRS21OtKTXR?=
 =?us-ascii?Q?bQ59TEHLFS6/QOHWnAIHkFSemfK+RS2Ldu9a1U0sdbzgpfQVmC1ytMW8k1NG?=
 =?us-ascii?Q?44RYin2RQtuXOvK5DXWfA9oslVpxa+80KArcwPmSUz5j5SH0NSiwkEbREMzD?=
 =?us-ascii?Q?zOg8gyLfyOSrLU8f8+IfuqTTQV5Hb+eoK3BytDM/UpGEQRb202aS2FogyMk5?=
 =?us-ascii?Q?YFIN5q596ul7yCjVK1jm+cS0YQr1eG6JAp8+fH1H4yvrdaLBuBBm2rucIK19?=
 =?us-ascii?Q?mHHup2jQprC0LEJafrFUeMog3plsAmAVO3a1M21ak8UK7s/fTjWLzis0ivO1?=
 =?us-ascii?Q?F55jQu54CgZxBYw4qjifr239KpaGJ7r/ZT/ACDRvK57kjMJ8U7VhWTsTGdwj?=
 =?us-ascii?Q?4Wm6o91pn5u1XDPqhh6wtStMG9LPbvQYnrmNNg7P6pqYbz3QNnYtkcj8wUk+?=
 =?us-ascii?Q?93bVa33HEMnmXWbK7mRrPmYgmw5g93TeZQtmJ8uJDyIlQjkACL3JgwQPMQMj?=
 =?us-ascii?Q?dRMpNDwZoilxLUy5G2VPa/Po9eHQa0+dZV6rjmxPOSWtKXtslWaCfAfYO+W4?=
 =?us-ascii?Q?E7E2DDbr/3n73ueBujPkc6LhY9K9lpWUKoOzZ8VVhFCuTAUfFlUQEn3FcUIY?=
 =?us-ascii?Q?4UJ1D2dVtCj8u9sjHB52pNZTs/pOfZfEcIO4lLUx5FXijw410f+ZTsismsmt?=
 =?us-ascii?Q?rw5b7K/VTTURg7BiM5Q9yla64uqJvF/m13hilxoqfdzH2OhVhXIKfh1CcDBa?=
 =?us-ascii?Q?gQ2Ednu36Jej1CM8OnZ/ckJhGoDo4IYObABYpKf3+33KaVwRK57+B9NR+j08?=
 =?us-ascii?Q?7ONQOmGm34xIR0CH9oIl7/j+eNCOM3bd/OZp7e8TYD4SaO2kzLt0eYxCHWTX?=
 =?us-ascii?Q?+YqDiSSk5YBPY1ddq/a3Pji+vwrSL4/qkq24R1EntT0IN6bK6x7q5hiQyvge?=
 =?us-ascii?Q?qnc3XHvcqPjYbMRrZo2j4zuCxnH6XH0g0MouBN38fdlVUS/cDxoeXZo5Ae4L?=
 =?us-ascii?Q?eVPr02MQdGd4/qoEoNKuqAfpxUkoPN9zPrP+b4H4KONQ7MQ2WLS75ap6Z+Bv?=
 =?us-ascii?Q?iEqonH9SsfvIOfGS5LHJyG2nMvM2nBfCTLDURhgwuYEA8/iyGORx/9VfXtYX?=
 =?us-ascii?Q?5VC0G4tubtj/XB2iORACuMK9cg4kgGsNbyf5sacvIvsC0zuFFfWS7UDDjQP3?=
 =?us-ascii?Q?AgXfKjCC5CJ03LKeVt9ufHNmhxl6y7+2MPFb3Slxp2SveqI0zD6jw7sPpA5a?=
 =?us-ascii?Q?SS+g85Ci0FKk15p2eYWWvD20yYXhxC3fWsdBOUsnwQC1P4hzIoYfKgM8BVNv?=
 =?us-ascii?Q?x54URYqZcxERkJ+HphmAD0If?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6589
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9018e6d4-41e6-4f5f-b42b-08d93f8e43c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TiexPKlLHeVLqbOJuxEUK3kbhZWwGlhnMvQ5b16D9Ik5/VCfYW9d37zisjgiING223TAKTWK9xcRHmEYd7ZZBiIh/YkEdlq/Jo4O3h0idE0GuX4TNV5D1gT6hGQyaIRvs+99CIRsMrBzkJBoOVDczBrY4z1RHG8XTWNoLaANjAgts7nD46Kv5ADLGKetMxgKW0ybz5gx5jlsunmv/T4iHMgDVXQEOtSQ61vkcRK97EfrpIvRDBmXka/MLfbmG97bpcaKGO89QhYyBbeD+IjHYM1ywNFObzN+Dt0D/ocWrL0KLMen+cuvQ9y+WCOUoJ2mLhUFwhPsO5CZrEXtBDWvSN61De7kE8yw0d3xCV/WkF4dWVwp8AZtHnzIkDoMXNa0+7ErIFkMROEnn2s8gf0iCJRK136xl7iwXBeZhKl8sq1Q18dOUpFZE9YUO6Wt42lr6HXo14jqODvLt5NrFWTC42Myfe84mTayQhZIwQWch7m9GWEsbFOys7/HxWKgIUpTZ95A+xU4N97/icwaJxHzFNHtLmdwbJJJ0waajwE3tlOqD4jLe7wCMyxugC6HxY40PZxooBCooLXe7kJ1Koxhu+aBruLIp5CKUVX7w6HijtfuuyL0ZElzvpvpYlALRCbaXckC/wxq2cm3mGP0s7iEOc4ACX5q+EwiTW2xmTbpum932WmWFqYL1mzIRDAbWv+AMpChlz4I1k4FpgwUOo60Tw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(46966006)(36840700001)(53546011)(44832011)(82740400003)(6506007)(6512007)(107886003)(4326008)(186003)(86362001)(16526019)(6486002)(356005)(6666004)(26005)(33656002)(6862004)(81166007)(36860700001)(47076005)(2906002)(478600001)(336012)(54906003)(5660300002)(316002)(36756003)(83380400001)(70586007)(70206006)(8676002)(2616005)(956004)(82310400003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:24:18.7601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b16ae6-a2d8-43e4-c966-08d93f8e48ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6802



> On 1 Jul 2021, at 15:03, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> When Live-Updating with some load, Xenstored may hit the assert
> req->in =3D=3D lu_status->in in do_lu_start().
>=20
> This is happening because the request is stashed when Live-Update
> begins. This happens in a different request (see call lu_begin()
> when select the new binary) from the one performing Live-Update.
>=20
> To avoid the problem, stash the request in lu_start().
>=20
> Fixes: 65f19ed62aa1 ("tools/xenstore: Don't assume conn->in points to the=
 LU request")
> Reported-by: Michael Kurth <mku@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: luca.fancellu@arm.com

>=20
> ----
>=20
> This was sadly missed because the on my testing the 2 requests were
> residing at the same place in memory.
>=20
> This was reproduced by creating domain while Live-Updating. Without
> the patch, Xenstored will crash.
> ---
> tools/xenstore/xenstored_control.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstore=
d_control.c
> index a1b1bd5a718d..ff9863c17fa4 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -103,7 +103,6 @@ static const char *lu_begin(struct connection *conn)
> 	if (!lu_status)
> 		return "Allocation failure.";
> 	lu_status->conn =3D conn;
> -	lu_status->in =3D conn->in;
> 	talloc_set_destructor(lu_status, lu_destroy);
>=20
> 	return NULL;
> @@ -757,6 +756,7 @@ static const char *lu_start(const void *ctx, struct c=
onnection *conn,
> 	lu_status->force =3D force;
> 	lu_status->timeout =3D to;
> 	lu_status->started_at =3D time(NULL);
> +	lu_status->in =3D conn->in;
>=20
> 	errno =3D delay_request(conn, conn->in, do_lu_start, conn, false);
>=20
> --=20
> 2.17.1
>=20
>=20


