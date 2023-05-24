Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476DF70F154
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538882.839219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1k7h-00068c-TT; Wed, 24 May 2023 08:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538882.839219; Wed, 24 May 2023 08:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1k7h-00066R-Qb; Wed, 24 May 2023 08:45:33 +0000
Received: by outflank-mailman (input) for mailman id 538882;
 Wed, 24 May 2023 08:45:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1k7g-00066L-H2
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:45:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56d83415-fa0f-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 10:45:31 +0200 (CEST)
Received: from DB7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:52::16)
 by AS2PR08MB9836.eurprd08.prod.outlook.com (2603:10a6:20b:603::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 08:45:22 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::2a) by DB7PR02CA0003.outlook.office365.com
 (2603:10a6:10:52::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 08:45:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 08:45:22 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 24 May 2023 08:45:22 +0000
Received: from 475d12ffc67c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D27593EE-B430-496A-8EEE-9301B544C8CC.1; 
 Wed, 24 May 2023 08:45:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 475d12ffc67c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 08:45:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9546.eurprd08.prod.outlook.com (2603:10a6:20b:60d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 08:45:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 08:45:13 +0000
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
X-Inumbo-ID: 56d83415-fa0f-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HaKm3gGkaSYZkrT2tkqOvdIV+RmDdenvT9gjfreHAI=;
 b=EnlOcS0Aysk6B5EjtI8Ugu8+t9vXg6NUYi4wvzfiycbBTr7MtIuT8NJdKWcxzsnz5FejMS9dlEc15Lw5cWC6G5iXR+GaQuS99H76za4RqATZqGSlOG8PER2BPZsG1EB+POJqcE9pKph5532PE+DO9QOhJXTecOOnAQ0dfDQVv0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91cf3ada4ab5f699
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAfZCJSyoTacN6HrCNcaQ+Owolae8NA8dzM01i5aIMM0gt2Oqqa6KBCA4oirJWAvNS0V1LQGaDsheSA1+t1V/Ww3yYU96U/IfCOoDSVuRlQ+f2L4FPavQdOU05O9qmx7fWQOKG780KEsWsYXgmWys3AWrPz4Ri659QxSSrL6W1k7X/aZoZhYrBQfE7j8NmvVkKvd2/yn5YRt/oMiX1ao4eJSonJzS+uM4ncOfcBlCLdk0+P8Q0FRWP3lErh+ymSICWro83x5rsfZ32E7pIv8A4XQ7Z3yQaVPPJuyIfHhhmrgIU1XnWuZPcBbNW5i6KUqoSwyUlP3hXm3qPrmiFLK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HaKm3gGkaSYZkrT2tkqOvdIV+RmDdenvT9gjfreHAI=;
 b=Hte5s74MtU6Z8NH3V3Ht/wOyxNfdtjVrJVdmhp47MPl8G0rGfdFG1h5m/CqnJQHuB08+EEYiw6c7DSuRGZt7aLFOCo3Io2E3pxHmk/T3k94hmzP7FBKlRXDWdGRrZembm126ihAOmu51n6cGAUHguawZNss5qSMhKNdhsbwCf7jnOusYedPWnul2TriPsRew+tQr4vxfzlEYNmfHCnAiJCuMvwtiLdHNDM/KvndIYugVpCkNbtIaLv7oVaMKx6GhTm+JM7csVDTnx+KGWU5ULLNzA4rZ9sJRoQfCUvMXfAj81THPaetzoaMg+VVPUreWsQ26Ne4x0lvVfqeb6L9foA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HaKm3gGkaSYZkrT2tkqOvdIV+RmDdenvT9gjfreHAI=;
 b=EnlOcS0Aysk6B5EjtI8Ugu8+t9vXg6NUYi4wvzfiycbBTr7MtIuT8NJdKWcxzsnz5FejMS9dlEc15Lw5cWC6G5iXR+GaQuS99H76za4RqATZqGSlOG8PER2BPZsG1EB+POJqcE9pKph5532PE+DO9QOhJXTecOOnAQ0dfDQVv0M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 11/15] build: rename CFLAGS to XEN_CFLAGS in
 xen/Makefile
Thread-Topic: [XEN PATCH 11/15] build: rename CFLAGS to XEN_CFLAGS in
 xen/Makefile
Thread-Index: AQHZjZUfrLy+HiKXh0WMCekPaQT+e69pHOWA
Date: Wed, 24 May 2023 08:45:13 +0000
Message-ID: <7F409345-9F8E-461E-AE41-1C0B59F633B9@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-12-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-12-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9546:EE_|DBAEUR03FT038:EE_|AS2PR08MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a54945-2199-4912-8ff7-08db5c33362b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m6jsEZixeJZ9f/P6hLt+b/jXeFrqGn7Cg8eFd2HKNEBNd+Lc/+T1shjt8J1tQn5J5n2s6KDzYXUhRZJs/WY2Y3fkJqVK2HNYn/Dzzqbq4JDMQBbiUo32R7LMkicutSEybuQxZDk6IcYkNrW6PAmE1PtMP7bYlOPvM3HcRVlCfQbHRFF8LgTbmzMDo5hlz5OMbWBcn5DqrC3yIfRAH10n4fX4h4qXut00cW5pJa7MOrkMqYs3rAlhIw5r9gIvA5G/+7M7es7BquuoIhNQ4ALnC+BSZpLW2xSUVcrGNlDN/cgJKGf8xadAriMntvIOW8XQzTl9pIqu/aqRZ7UtgFLEekuOeTWID6wLNIuSL+DNMMFQJhgLqInHf19MqnaOpQPtZe1yd3sSUtDgBrcfG89WwxX3DhGMr+ecWEqf9G3Sb/LhZxJa2qeqyEFu3LiQEPdhRjp8lQKp7ilNFev2zInd6MOMDO67FRNXaGKUNRLvw2lVwr7luZvDHVZT1HOdylTQb85OBrl1sAfiBnycHI7R3PqMaY2LryOjW9Z9ps3IWqSzu5vDw8nSdBo3j5uz4dNFrD2G4xsTaSsaaI7bh8VUe7VXLXpFvZPmqAjFi8+Nt6uPDzw9qKPPoRvrfbhUAXyMOBkISx1rWWo/MT0uOUGOzA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(6506007)(6512007)(122000001)(53546011)(2616005)(71200400001)(66556008)(66476007)(66446008)(86362001)(186003)(91956017)(478600001)(54906003)(64756008)(26005)(66946007)(76116006)(316002)(33656002)(6916009)(4326008)(558084003)(41300700001)(36756003)(2906002)(38070700005)(5660300002)(38100700002)(8676002)(8936002)(7416002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6EA68C32215A9F42B7499318B48B77B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9546
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66e80116-eb70-4aa4-b495-08db5c333100
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+x+1IdrLGmlp5bOte38LPoaTMBbwlsEVJkn+U9py59yuYbEaND8l6j1vu115NOQdsFgzfBYn6uJ/Uzlgh1q+qnxiACaPtX3I+CMddbAYi7XiJpLsThzJy3oLCPmggyAQipbw0vv+2D+rYmpNNGsHUcntjYS9vFrcEJFyIC/h9SQAd0nLcxGwR5bhQTGpbK9NjJeW+0xfzCDYlKGqVfThANOYmm7gO8m6J2g7v1B0MhUEodUxjcF/g4swBhZAqjH9F/U341Ih/aBtVffVKUe7G6eJTR+6H8uNA/2eOTL/8hzrnEkDXJ1ckYDcFnQIfHFym8tnepGkR+kYhs3qD/UkdBS8CjNWcblbo/oZ/ljedrVOp2n/j0wsjzaXEqUufTYVHZu7OTVy1nGuiPjNzslVTaIh/lM4P4Mf4YsFDqUNZpGQ3h8KSdbAkFJ1eVFJ2C5xCpV5ETjcyo0pxH7wLZ2LmTee0J4er+yNV6WGZCqskW+1XhtuFhU7tiNNf3mrCKJcnOzYtuQP7X+BcyS4QM9dSQ90GrIqqz6+4vjsCPJ95LW/iAeNP5049T2F8EsedY43bgQddBOBxeEEq9iv9f5A5Xl4mUxhxL+iCHPwu0rMdLjslLEVzsxTbv4Sh5g5vFPY3VQZi7bostOl43xx1qp0RURZb3SJuPVin/egXDxmxtyPiV8oKuljtA4f3+5lEtAoNaFN42e5q0nTuSfHIP9aAe9rV6K7WEeKXP/6F2KaDurms5XjeYBPP7POQqVJ0mQ17Brie+mMmbb7KI2aACBlDn3gkb7Eh0F7JaJ/zvkvfU4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(5660300002)(6862004)(8936002)(8676002)(186003)(2906002)(4744005)(33656002)(36860700001)(86362001)(36756003)(336012)(2616005)(47076005)(81166007)(356005)(82740400003)(26005)(82310400005)(6506007)(53546011)(40480700001)(6512007)(107886003)(316002)(4326008)(54906003)(478600001)(70586007)(70206006)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:45:22.4969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a54945-2199-4912-8ff7-08db5c33362b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9836



> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> This is a preparatory patch. A future patch will not even use
> $(CFLAGS) to seed $(XEN_CFLAGS).
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>



