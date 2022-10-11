Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59685FADD6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 09:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419429.664209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiA3t-0007Vs-0k; Tue, 11 Oct 2022 07:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419429.664209; Tue, 11 Oct 2022 07:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiA3s-0007Sf-Sj; Tue, 11 Oct 2022 07:52:24 +0000
Received: by outflank-mailman (input) for mailman id 419429;
 Tue, 11 Oct 2022 07:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/N3=2M=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oiA3q-0007SZ-UL
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 07:52:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cd47189-4939-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 09:52:11 +0200 (CEST)
Received: from DB9PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:10:1db::34)
 by PA4PR08MB7641.eurprd08.prod.outlook.com (2603:10a6:102:273::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Tue, 11 Oct
 2022 07:52:17 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::2f) by DB9PR06CA0029.outlook.office365.com
 (2603:10a6:10:1db::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Tue, 11 Oct 2022 07:52:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 07:52:16 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Tue, 11 Oct 2022 07:52:16 +0000
Received: from 5851c18ca419.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9453B380-AE3A-4E28-9BEE-9A7308B457EA.1; 
 Tue, 11 Oct 2022 07:52:10 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5851c18ca419.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 07:52:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9096.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 11 Oct
 2022 07:52:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5709.019; Tue, 11 Oct 2022
 07:52:03 +0000
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
X-Inumbo-ID: 9cd47189-4939-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fc8UrCRe9RhtXjGtbFZlm3dHqalIwN4sfL35yTJ+OdOe5pd/QlIqCgBIxeD0v5BvNga+21vLvR4nsUVLDyx8DesahP1yFugb3/to7YkbaWriuO61aFwj2FxyNqyHQdWwenqJsbahW655IyWoVG1SHwShROu3OYnLEelOGbwfvdNt4myQeRlirKCLFU1jTIg7Bq2PNXYBAdOalwzA9PMpoTNmVPp1aPiO+MHxdnkV3gZIOIrTtmIvWw65tizR0zvfZBtTFPmHapnIcv9T0aShoUkwSJrMjFWmHPbUXqu8B74+Bk9Rj7sDrGgHoLKD8/PYTKpMIe8EbstWXZngSsZjXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+++nReco2zvuoEaFP+dp8pLVLMN5kLeKXds4nuY0d04=;
 b=nzgFefO+RUOY6e9UZpya6wd0MqKMqjwdOZijdT2ivsk7uECVuKA/xXajTotRq+UU+iUL/qjBcXU5tHaEYUEnaekVAgPFFhBvyiK9rPFW7LquTjYyeO7sVt/BxvKOaFuHZkORPVfruDbxS8qNNnGZnD0FNYy7Lsqpd9jbPekQ8KmeWyyzW07InmhFin/Qgyo5ElwIJyVpJktxXZPX3sOj6WgwV+JEwYnmsuVKiA6xb+BSP1xcjcYzkJsE1/vJR5MoO/I9skFB25YFwrTUy9lJT/zuQRGwnmkpSqlND1xdWchZ5f9g6k3B7+ynE1tWcgpvYZBiGirLz5+VIzS64MbYuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+++nReco2zvuoEaFP+dp8pLVLMN5kLeKXds4nuY0d04=;
 b=wdEcRmSdw7jdEe77rl3CbKgjs7IsmrE+MFnY1ajSrEbmT/oceb4bz3jX0PFloMwnQtuXzRXgZ5rsURkXCW06R/oTtYE54IPbxHbdp10bFa6z0sJxinmFvLmj4sjI8O1sd99Dz9cUXoHv6vpLQ7hj8XajSxicSZ4dUzEGgTefhqk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67238e4f5c8420f3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W06vR8WffKJQDlJ0S+6J3yfO2sfLeTdVofO0Yx/VYEwZmLl2vSHbMcfLTqh0QtDv5c5fYKTzIuGnnA7HCWaIaV9TpgfSWZWyMFIfotKJbcTeIDQPBfjg+nw/SKmYaEjC96j5jT6msqVlvuMryoitlNwcxizBkUBVXWR6ST1nFWpOtMLmlJaIpK7LRfcQi04MZLRdu5VUxOJ3dwJUei55YQcdWfLcY4Jhq6SkQXLZm+bXB/+8/9ajGlVzWLCu6ewBIln14R1QdaY9+JxnAqDXYHyRdSLy08oS5VR8hswwt308gnhcSBgba9pV+rws/YWMN35sW1fmunzG33PZhVScbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+++nReco2zvuoEaFP+dp8pLVLMN5kLeKXds4nuY0d04=;
 b=PCH17v8Hq+PXmEZ6zHL2iwMoLCuNEu6oMjA9VIV44XmbTLsggnA6rM1LRriimDhG2rOBNEhtTgFPB2qM7nreOsZgC4U4zDY9ZT5xWTsiEFroAkBRu9okrBWfjjutPJKwf/bXbgvIDpG9SJTc42qMjmuzs0H2/KSCXAm586IV7EbnfYe2mdQUf0p0R1CR749OuToab7KwPARTUaIf4vgtcwYzRJpjISz89MWkw/xXVE1PpCwq6E8ai88O+6exKFAk/iSab2YUE7LlSNL1H7K0w/1F1T8tINLV63WXL1qOIQNoWBWWazhtGtYpDTxhAXGtku4X5MPOPzqfsSeGPSkLSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+++nReco2zvuoEaFP+dp8pLVLMN5kLeKXds4nuY0d04=;
 b=wdEcRmSdw7jdEe77rl3CbKgjs7IsmrE+MFnY1ajSrEbmT/oceb4bz3jX0PFloMwnQtuXzRXgZ5rsURkXCW06R/oTtYE54IPbxHbdp10bFa6z0sJxinmFvLmj4sjI8O1sd99Dz9cUXoHv6vpLQ7hj8XajSxicSZ4dUzEGgTefhqk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Thread-Topic: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Thread-Index:
 AQHY1KFdAull5ChokkeaXft6EPXQra337WuAgAZ9tQCAATqNgIAAE7eAgABoeoCAAPMPAIAAXMKAgAN3ooCAAk5MAIABJ2UAgACEbQA=
Date: Tue, 11 Oct 2022 07:52:02 +0000
Message-ID: <FC753E33-7A6F-424D-B092-9B3D655E8437@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
 <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
 <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
 <0d33ecc6-898a-9379-f934-fe569cbdc8f9@suse.com>
 <3b3f6e1c-4f41-6b1e-b226-f0dd515d14ca@xen.org>
 <7d152954-4f5a-2833-f974-442c15f4e8b9@suse.com>
 <82963a1c-3301-72ff-e995-77c30ec5a64b@suse.com>
 <a957dfbe-c4c4-c8cc-93c5-616a44fe1797@xen.org>
 <319015d6-ec1c-3500-2437-00d40fe4d2c3@suse.com>
 <alpine.DEB.2.22.394.2210101657180.3690179@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210101657180.3690179@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9096:EE_|DBAEUR03FT017:EE_|PA4PR08MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6571cc-c81d-4f99-5f5a-08daab5d8462
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9Jegj3eyTkfXMDwtgZSFKa5td4RYNAjs1+e1w1RzZm6dxGndjj/4IEBLHarfpNR3aTLv/uDVBygi7st7+0jgL6io8f3rJ+EQlWoMLPHtdFVV3701xUj0yJct6BdZfPFNuNfsIJkvaiXsNnrppilEOan5ZblmVsY3w0w7ZhP4DFz8fgC6SaFlKa/LZ2jhlKfeQJ0vGu0pWbVvSBXWVLNNCCN9Gfr+moXpr2LSbuQyw938L+oVKKm3m+InQdh6M0neRv0rsG29fVvWBYsWPKgtW4GzyaD1TXb7Qnm08rzE1MEmm18vLDXhTgNK3JA7/VDPF+YCWRwrDGfmEBhyRmuafccfE9joEZicdTX4q0o06syV1BoLcECMsJzjGy3iHgtFt+W79F0vk7iLpLmbtoj6/HKZmeECXhu7BhUfJWpDrQZU1InVVR62HeFXPcZcc3CBbYOKlQS202xtfgmuUPg+lS8AN7TD1mmEU2dybtgUDvzBT6fdTBRvZETTfv8aANp2svVDGi7qRcfoYd3ySKRaO4UKa4mlaG06B8iPdYmcJVu2g9r2sDymeT1hGF8NEAyCqv9iHxsA55GLZtnXN/VxiNpzXPNOGNx9PILBJCRCWpS+I1kBu0tOipQ0nqJ//r1KRV2yXn57g9zVoKMpxLjTDkLylwjBcjSetWu8gQ7xuhUu/CTqRdz+F5DkTQt4hcdUSkVu2C+CQsmXrsfwoWXSRb7yu3ufjkOFj2VrfkiCTBYlirRYmXs2ciLmcMzx/Qxhbq9plky6xlnwHRo0kZY6ZjLqc0b9eUCtUHT/n3JOBh4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199015)(2616005)(53546011)(6512007)(4326008)(66946007)(91956017)(316002)(8676002)(76116006)(86362001)(6916009)(6506007)(38100700002)(26005)(66556008)(122000001)(71200400001)(66446008)(66476007)(478600001)(54906003)(33656002)(38070700005)(186003)(6486002)(64756008)(36756003)(5660300002)(2906002)(41300700001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4839BDF9C4F2394EB9FDFACF6A7B400F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9096
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ee22d27-9c8a-4dca-0b58-08daab5d7c23
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KcATyBfkboRdgJi2OuSo2tm0IXQrunNh5bbae9H/OsPiXn3sPoo/zzNh2IQofP5+Yco8hIZ1yyPHYNToXNzBgZTxAZbskqhNIW6bfRkmlmewxUs1AFb2cjn8zvqrUdKgf4k8BPf0o0qeYTRudurRcIQgHi+jVq6wivbtDDEarSLCnb0J9Ex+3bXm/SLwGcom0VECo2xNvObgyLLsERSOiuf7AmIu5TfyrydFKv/O3CGYQ2bsCfWCV4p5Tp0FIqFkn0sPgk9Q5PaRQ4Py4J8ToWvnOrMaFKCp5YXtWg4gFqq0izmRE9bnsmSgIXEA2QrRLNN85htc22QQBqPbTodwRdQ1jrJI9lOcRbp0i6HPCfOsm2q6cd4p+oq7zyoDPjRrTkJArfhGN71cnmQ8Md/fbc/lBh2dDJ9pQYFz1UL+KPCw3cwXpnEZupGkebATiLrg/Y4S/K9djfKy/XrQUtqmPslLTNqkrNz96jraYvm+5bWR4ilbjg2kiGHbET2wqwXDS2CJ1EP5NMg9uYS+KzbZBYbOUP0xZOxAGZy2qgWfcJRPCH7JT0K3zosA+DhzmiWj2VpZqioZpekqqYLZRtFnepYsFIhkvslpiBSda1wYNHvE2BpHQ+f91WNgggOJJEywvaqMhnV6aAbmVQ2d3symZlFQ/FLG/Lpw6GfUcXrrjd7pXelTXvQSqzpkiE/a9vhlAMR57E9E2Gzvwi3eRpnUch7uA6BpoiWPSh/DLNoWlWPtNKoSHnJCVE858SC0Zpmp8mGD+3lRSJ78lBBYzyBiaQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(41300700001)(40480700001)(6862004)(8936002)(2616005)(2906002)(6506007)(33656002)(478600001)(70586007)(8676002)(53546011)(356005)(36756003)(4326008)(70206006)(81166007)(40460700003)(5660300002)(26005)(82740400003)(6512007)(316002)(186003)(336012)(6486002)(86362001)(54906003)(36860700001)(47076005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 07:52:16.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6571cc-c81d-4f99-5f5a-08daab5d8462
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7641

Hi,

> On 11 Oct 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 10 Oct 2022, Jan Beulich wrote:
>> On 08.10.2022 21:08, Julien Grall wrote:
>>> On 06/10/2022 15:11, Jan Beulich wrote:
>>>>> ... the space cannot become ordinary RAM, then such a precaution
>>>>> wouldn't be necessary. After all hiding EfiACPIReclaimMemory from
>>>>> Dom0 just because it can't be mapped WB wouldn't be very nice
>>>>> either. I guess I'll submit v2 with this part of the change left
>>>>> as it was.
>>>>=20
>>>> And while already in the process of committing the patch I came to
>>>> realize that if the WB conditional isn't supposed to move, isn't
>>>> the change done for Arm then wrong as well? Shouldn't it then be
>>>>=20
>>>>          if ( !(desc_ptr->Attribute & EFI_MEMORY_RUNTIME) &&
>>>>               (desc_ptr->Attribute & EFI_MEMORY_WB) &&
>>>>               (desc_ptr->Type =3D=3D EfiConventionalMemory ||
>>>>               ...
>>>>=20
>>>> leaving the EfiACPIReclaimMemory case entirely unaffected by the
>>>> change?
>>>=20
>>> IIUC, the concern is the region EfiACPIReclaimMemory could have the att=
ribute EFI_MEMORY_RUNTIME. Is that correct?
>>=20
>> Yes, ...
>>=20
>>> Given that the memory is reclaimable, I am not sure why it can also hav=
e this atribute set (to me it means the opposite).
>>=20
>> ... at least on x86 all sorts of strange/bogus type/attribute combinatio=
ns
>> have been observed.
>=20
> Yeah... it is a good idea to be able to cope with strange and bogus
> firmware tables as it is known to happen

I agree with that but if we make an assumption that something is bogus, we =
should at least warn the user if possible.

Bertrand=

