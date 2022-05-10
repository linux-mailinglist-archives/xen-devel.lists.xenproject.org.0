Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372CD521E94
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325787.548521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRlr-0008Ro-Gn; Tue, 10 May 2022 15:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325787.548521; Tue, 10 May 2022 15:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRlr-0008Px-DD; Tue, 10 May 2022 15:27:31 +0000
Received: by outflank-mailman (input) for mailman id 325787;
 Tue, 10 May 2022 15:27:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAyr=VS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1noRlp-0008Pr-9t
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:27:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2a282d5-d075-11ec-a406-831a346695d4;
 Tue, 10 May 2022 17:27:27 +0200 (CEST)
Received: from DB6PR07CA0105.eurprd07.prod.outlook.com (2603:10a6:6:2c::19) by
 VE1PR08MB4766.eurprd08.prod.outlook.com (2603:10a6:802:a9::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.22; Tue, 10 May 2022 15:27:12 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::80) by DB6PR07CA0105.outlook.office365.com
 (2603:10a6:6:2c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Tue, 10 May 2022 15:27:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 15:27:12 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Tue, 10 May 2022 15:27:12 +0000
Received: from 02e0195bea29.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 254059D7-6AC7-4886-99F2-1680B921F0D9.1; 
 Tue, 10 May 2022 15:27:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02e0195bea29.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 May 2022 15:27:05 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM9PR08MB5954.eurprd08.prod.outlook.com (2603:10a6:20b:287::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 15:27:04 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::e020:ec0f:ab1d:c962]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::e020:ec0f:ab1d:c962%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 15:27:03 +0000
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
X-Inumbo-ID: b2a282d5-d075-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=c68OmMRCPPjmMiVzX9UexYsFC6mzDDSPz6C5kGHkCJrEJmNoWh6f2rGgZQkqHN3js70hQFTkfcgz02Z/27nH1xs8Zr2twesmUjnPS21eRyRw550FWKtP+WtJOBAeZFfIgZ2xvNVXI/LCjxAYFE08lTXFu/Av9WN9bUqVV93nJ3ZmqMPxK4RQ4IuL/LV2v94kbWR5WrMsntvlcA5mC605VtfEfldHxhK4ZdahMySbuoG5/FaKW5BYuvsFKe6gA3fWiWHWM1oFnUQsmCmYd561wygV++EVCK34QHpDWeWaUvXuloSAClKvnD1B0H20JwEmev+F5dn3d23L8P9XdcCs/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0KzPozjC1OK9JAbkmaz8yvhSEdH4R8WcBnRb/MMjI4=;
 b=TwZkf4wa1PVAjFL5NHfG6YDgHrE5UrfE24TwIr+yWSsiLW3wNB7dqLvKRTPjkDWR+g+HRPJDoaeeEF9dYSH0AM4GTIh2MYLemLjA8MFmX/6NN8calNXRuMQAzP6iIU8G13N1LYtTqoYK/0sIkzLd7816+YtvF6Nwv60PAMtgKr+082XCa2yeuwqwSUfSXznwTiICMTiw4ZCCRKpNX5D1uhAy3iAHndT9Xk0GZ4rS+0o1HT1HGD0k1XEpeK/2XAEokgpgAJwrMrsGMe2sB/9ap7r+0d3ZfXnogotpoJbbpZlCAANr7dUQKqjXbeKwRmU0JeOoeJRe5UdIX81jiAAUpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0KzPozjC1OK9JAbkmaz8yvhSEdH4R8WcBnRb/MMjI4=;
 b=Dy5lMAwjuC4DU3w/vG0Kbuyn2J/tYIfhCdUuJgMVeXyJnwE+IjVIWw3oUvBFuVtge2C7LZ4XoHv4EjLcXOdiwAeBTlFlr3M9teHgeFF5my0XDfvpjkMHyp3455AEgedMQpCAFruWQ1bE5dqfo5ACaSTihE8Uz1KTMfjEIlIvA8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b91a51e1381a7fde
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ4TSryOp5539bLO9+xVHevMhVxHUhWXuaKQ5MrES93l7VaRrtO/ZZEYDHUOUUepsJOMH65azGo3vdydackwCi+4FNUQcMk10/it6xEX7UG6H6XoKC1aiwUNs+NnlxWM6Ij6RYH5EqTh51diL8a6F7hJ6uFUm3NfvOlbknwr56NafaRzK4qJsf8hqCjxAElF/sy6q/OOqu+vi0orhmQw/slFYjViQQjP7G2kSt8iSLP+lzbLsxhzHXBXFewB8U/lQ9bJhgSE+hDjRfR4sHNcnThw7LOFlCW29mKYb4Uha9d6Lqdef5aBg7ZRyTqWKUdE6s+ty3omvSGbGkiECMdL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0KzPozjC1OK9JAbkmaz8yvhSEdH4R8WcBnRb/MMjI4=;
 b=K1zUr0idyEVFnfV09peZRvewMjPwWimIfnKOmW9CidYn5FwVkwVghCEwe32GAdCBTGMdpj2u2r6srf8FYKkgVnV0peQb3/Xoz+W7W1GIv1dTyy8AqztL0cGqG3IrGEMPARXsKS7uA99TnhfzYoTU9PYi5ARm8oiY439oNaDQ9qQLtYC5IJovnL8kgV/CFhCkpn9hAXRkIfvmBr+4V46U4Pifqv/t3oHKwtn5SWwchAlfzcKSaGIRdqM/os5d0A/aINdDcr9J2QwgkPStHFj6TLoVPoZ3suFJ6eOpms3vHoVO+AK4o6za2dqAAyQm9srnxZbMbzGpodauaCZo7qcUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0KzPozjC1OK9JAbkmaz8yvhSEdH4R8WcBnRb/MMjI4=;
 b=Dy5lMAwjuC4DU3w/vG0Kbuyn2J/tYIfhCdUuJgMVeXyJnwE+IjVIWw3oUvBFuVtge2C7LZ4XoHv4EjLcXOdiwAeBTlFlr3M9teHgeFF5my0XDfvpjkMHyp3455AEgedMQpCAFruWQ1bE5dqfo5ACaSTihE8Uz1KTMfjEIlIvA8k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
	<jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v4 1/2] xen: sync xs_wire.h header with upstream xen
Thread-Topic: [PATCH v4 1/2] xen: sync xs_wire.h header with upstream xen
Thread-Index: AQHYYBZZ0f0HhWtpOEKVI6rFIZ2ezK0YRJ+A
Date: Tue, 10 May 2022 15:27:03 +0000
Message-ID: <8DBA83BE-0537-40C1-8014-FFF7883CBF3B@arm.com>
References:
 <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
 <20220505002304.401417-1-sstabellini@kernel.org>
In-Reply-To: <20220505002304.401417-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f15434cd-d61f-405c-dd77-08da32998e13
x-ms-traffictypediagnostic:
	AM9PR08MB5954:EE_|DBAEUR03FT030:EE_|VE1PR08MB4766:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4766499C70952B8FE6540FD0E4C99@VE1PR08MB4766.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J996UOs0R7T48S5E6SlKcPlyyBGXMsBppntaUuRr0ZqDEt4zcvd6nIIvVvpF3dSTs7lB+LxI48lOsGQDt3uEgSFG7IUbfRY5gTzc/Sb+NHnZL8mQMOr3Bwjl1m4d4PxiD66snxfnRTuseIDweCj5tii1eUxg/HRWSdhheG1cqCfY3CjC7KrzLjvE1uhig6+/UGCe/IAmN9CDVNr49OGvDN5LecYvxd5WJKRkGozZOaO4Bw4VgBQtnIVL7ZxN5S0V+kqu6cmTi1bSKtdn0Q48Jhcci2sZkDfct8gLTC6rZbI50MqbnMrElLoHfSaYqRCgLICEMXwjCZMLnbaZMHw2xqBBAo6qZjsh/10dvIywLEmSO/IiwIej+LUQE3kg7apPRzxc9ibS5n7HOTw3MteIz+CRPnuGHQ1CJPMvHcq544AUugXptcFZfcYCGe8ejscJE4Sd1x1GwwSRoEra21lOa9HeDmvwXatPTPOJxH/Vr3p3j/Fn4iSkjU731Y6JM6juhcRbFw9jOuXBpyj5Ex4CH0QuhvrOSOJZ+jQOD32Chn50bgfXM0jXoZmSZg/k+6cfBzFu8lMQFY7HCwojQtyOmjeFBk8ARoaoGyzRI82c93lJMPd4RPug4HMFJvwKiiPNt3jGM8+Ufbkq6XTVi+EmzrO7NKJk8G9VynETzV97HZok7FOiIV6UVddirIOyYozxN5dnCvcparD98ExiCrmoA8/NrojUm4MjxVtRYKXVXQI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(76116006)(8936002)(26005)(54906003)(66556008)(66946007)(91956017)(5660300002)(6512007)(66446008)(64756008)(2616005)(71200400001)(316002)(66476007)(4326008)(8676002)(86362001)(83380400001)(53546011)(36756003)(186003)(6506007)(6486002)(38100700002)(38070700005)(2906002)(33656002)(122000001)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6068C99424A2F4E8050ECAA020936E7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5954
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8a9f0f8-045b-4ee8-6aa5-08da32998924
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gyj8DkAarUwUqUOhLpMrR7ZpiMTbz7t487U+27JMb5JPO3I8jQxm44Q8MCOk5Ovrguu6ayqi+reHroXfIqWDGqt+q3yWd4zAFypC94gjq7L9RajcRHlE+ilUZQH/ESbUzOGHpCLzWWcYBHZjWtq2PjTM8OH7tb//7mStUix7qV9eAFTvnFh0QsRkQd+sEnjUE/F965jB0w+2rmTlIu6f55ndfED4qN59Le9YvDQUdHzTqLQTnZsTDTu8TMugu+JokcTPCiZCMmDuWHhEm+/Xin2TLCCqmh2mnv6k60KgsJP84aXKZtoSGSibQ5r9AN/xuEq1dzWHnGIH1DS6jLwfLHuCnSpYRz+wIpPzYrvnqpnUK4ABb4hQ7gZVSzK9TvdLAv9co3JfEF0qGdKEx5bwQA4FdcVICR+uS2kf4nH/gL5R1VNmJOCzcvKJR70rQeVt38ujg6UjrPwZtuV7RNc7jhzqDT9Bu7V463lxlOi0x3UnVY2pQdCGJ2eEfNWBN4sl+fFeci4nSJU72r9AaDB2QybLHQylJL7zqEGhCzs/aWnxx3tGe8XfvkF68RXVRdMSwaMn83OhHebcynlHu16k0qDSb8Gk8aFAjRWjlOMn1bEtrbIgpoABNv2BqF0dJGirKBFtB7NucIMpRvbVKut1hwysER0GZlKMKhzPy8NWM6LZ0gsDc0Yt40V1bjEPo4km
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(2616005)(40460700003)(107886003)(36860700001)(6512007)(82310400005)(8676002)(4326008)(6862004)(36756003)(47076005)(186003)(336012)(316002)(70586007)(54906003)(70206006)(53546011)(2906002)(5660300002)(6506007)(86362001)(508600001)(8936002)(33656002)(6486002)(81166007)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 15:27:12.1241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f15434cd-d61f-405c-dd77-08da32998e13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4766

DQpIaSBTdGVmYW5vLA0KDQo+IE9uIDUgTWF5IDIwMjIsIGF0IDAxOjIzLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogU3RlZmFu
byBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4gDQo+IFN5bmMg
dGhlIHhzX3dpcmUuaCBoZWFkZXIgZmlsZSBpbiBMaW51eCB3aXRoIHRoZSBvbmUgaW4gWGVuLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxp
bmlAeGlsaW54LmNvbT4NCj4gLS0tDQo+IGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby94c193aXJl
LmggfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gMSBmaWxlIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS94ZW4vaW50ZXJmYWNlL2lvL3hzX3dpcmUuaCBiL2luY2x1ZGUveGVuL2ludGVyZmFjZS9p
by94c193aXJlLmgNCj4gaW5kZXggZDQwYTQ0ZjA5YjE2Li4wNGRjYTc3YWJjNDUgMTAwNjQ0DQo+
IC0tLSBhL2luY2x1ZGUveGVuL2ludGVyZmFjZS9pby94c193aXJlLmgNCj4gKysrIGIvaW5jbHVk
ZS94ZW4vaW50ZXJmYWNlL2lvL3hzX3dpcmUuaA0KPiBAQCAtMTAsNyArMTAsOCBAQA0KPiANCj4g
ZW51bSB4c2Rfc29ja21zZ190eXBlDQo+IHsNCj4gLSAgICBYU19ERUJVRywNCj4gKyAgICBYU19D
T05UUk9MLA0KPiArI2RlZmluZSBYU19ERUJVRyBYU19DT05UUk9MDQo+ICAgICBYU19ESVJFQ1RP
UlksDQo+ICAgICBYU19SRUFELA0KPiAgICAgWFNfR0VUX1BFUk1TLA0KPiBAQCAtMzAsOCArMzEs
MTMgQEAgZW51bSB4c2Rfc29ja21zZ190eXBlDQo+ICAgICBYU19JU19ET01BSU5fSU5UUk9EVUNF
RCwNCj4gICAgIFhTX1JFU1VNRSwNCj4gICAgIFhTX1NFVF9UQVJHRVQsDQo+IC0gICAgWFNfUkVT
VFJJQ1QsDQo+IC0gICAgWFNfUkVTRVRfV0FUQ0hFUywNCj4gKyAgICAvKiBYU19SRVNUUklDVCBo
YXMgYmVlbiByZW1vdmVkICovDQo+ICsgICAgWFNfUkVTRVRfV0FUQ0hFUyA9IFhTX1NFVF9UQVJH
RVQgKyAyLA0KPiArICAgIFhTX0RJUkVDVE9SWV9QQVJULA0KPiArDQo+ICsgICAgWFNfVFlQRV9D
T1VOVCwgICAgICAvKiBOdW1iZXIgb2YgdmFsaWQgdHlwZXMuICovDQo+ICsNCj4gKyAgICBYU19J
TlZBTElEID0gMHhmZmZmIC8qIEd1YXJhbnRlZWQgdG8gcmVtYWluIGFuIGludmFsaWQgdHlwZSAq
Lw0KPiB9Ow0KPiANCg0KSeKAmXZlIGNoZWNrZWQgYW5kIHNlZW1zIHRoYXQgaGVyZSB0aGVyZSBp
cyB0aGlzIG1pc3Npbmc/DQoNCkBAIC01OSw4ICs3MSwxMCBAQCBzdGF0aWMgc3RydWN0IHhzZF9l
cnJvcnMgeHNkX2Vycm9yc1tdIF9fYXR0cmlidXRlX18oKHVudXNlZCkpID0gew0KICAgICBYU0Rf
RVJST1IoRVJPRlMpLA0KICAgICBYU0RfRVJST1IoRUJVU1kpLA0KICAgICBYU0RfRVJST1IoRUFH
QUlOKSwNCi0gICAgWFNEX0VSUk9SKEVJU0NPTk4pDQorICAgIFhTRF9FUlJPUihFSVNDT05OKSwN
CisgICAgWFNEX0VSUk9SKEUyQklHKQ0KIH07DQoNCj4gI2RlZmluZSBYU19XUklURV9OT05FICJO
T05FIg0KPiBAQCAtODcsOSArOTMsMzEgQEAgc3RydWN0IHhlbnN0b3JlX2RvbWFpbl9pbnRlcmZh
Y2Ugew0KPiAgICAgY2hhciByc3BbWEVOU1RPUkVfUklOR19TSVpFXTsgLyogUmVwbGllcyBhbmQg
YXN5bmMgd2F0Y2ggZXZlbnRzLiAqLw0KPiAgICAgWEVOU1RPUkVfUklOR19JRFggcmVxX2NvbnMs
IHJlcV9wcm9kOw0KPiAgICAgWEVOU1RPUkVfUklOR19JRFggcnNwX2NvbnMsIHJzcF9wcm9kOw0K
PiArICAgIHVpbnQzMl90IHNlcnZlcl9mZWF0dXJlczsgLyogQml0bWFwIG9mIGZlYXR1cmVzIHN1
cHBvcnRlZCBieSB0aGUgc2VydmVyICovDQo+ICsgICAgdWludDMyX3QgY29ubmVjdGlvbjsNCj4g
KyAgICB1aW50MzJfdCBlcnJvcjsNCj4gfTsNCj4gDQo+IC8qIFZpb2xhdGluZyB0aGlzIGlzIHZl
cnkgYmFkLiAgU2VlIGRvY3MvbWlzYy94ZW5zdG9yZS50eHQuICovDQo+ICNkZWZpbmUgWEVOU1RP
UkVfUEFZTE9BRF9NQVggNDA5Ng0KPiANCj4gKy8qIFZpb2xhdGluZyB0aGVzZSBqdXN0IGdldHMg
eW91IGFuIGVycm9yIGJhY2sgKi8NCj4gKyNkZWZpbmUgWEVOU1RPUkVfQUJTX1BBVEhfTUFYIDMw
NzINCj4gKyNkZWZpbmUgWEVOU1RPUkVfUkVMX1BBVEhfTUFYIDIwNDgNCj4gKw0KPiArLyogVGhl
IGFiaWxpdHkgdG8gcmVjb25uZWN0IGEgcmluZyAqLw0KPiArI2RlZmluZSBYRU5TVE9SRV9TRVJW
RVJfRkVBVFVSRV9SRUNPTk5FQ1RJT04gMQ0KPiArLyogVGhlIHByZXNlbmNlIG9mIHRoZSAiZXJy
b3IiIGZpZWxkIGluIHRoZSByaW5nIHBhZ2UgKi8NCj4gKyNkZWZpbmUgWEVOU1RPUkVfU0VSVkVS
X0ZFQVRVUkVfRVJST1IgICAgICAgIDINCj4gKw0KPiArLyogVmFsaWQgdmFsdWVzIGZvciB0aGUg
Y29ubmVjdGlvbiBmaWVsZCAqLw0KPiArI2RlZmluZSBYRU5TVE9SRV9DT05ORUNURUQgMCAvKiB0
aGUgc3RlYWR5LXN0YXRlICovDQo+ICsjZGVmaW5lIFhFTlNUT1JFX1JFQ09OTkVDVCAxIC8qIGd1
ZXN0IGhhcyBpbml0aWF0ZWQgYSByZWNvbm5lY3QgKi8NCj4gKw0KPiArLyogVmFsaWQgdmFsdWVz
IGZvciB0aGUgZXJyb3IgZmllbGQgKi8NCj4gKyNkZWZpbmUgWEVOU1RPUkVfRVJST1JfTk9ORSAg
ICAwIC8qIE5vIGVycm9yICovDQo+ICsjZGVmaW5lIFhFTlNUT1JFX0VSUk9SX0NPTU0gICAgMSAv
KiBDb21tdW5pY2F0aW9uIHByb2JsZW0gKi8NCj4gKyNkZWZpbmUgWEVOU1RPUkVfRVJST1JfUklO
R0lEWCAyIC8qIEludmFsaWQgcmluZyBpbmRleCAqLw0KPiArI2RlZmluZSBYRU5TVE9SRV9FUlJP
Ul9QUk9UTyAgIDMgLyogUHJvdG9jb2wgdmlvbGF0aW9uIChwYXlsb2FkIHRvbyBsb25nKSAqLw0K
PiArDQo+ICNlbmRpZiAvKiBfWFNfV0lSRV9IICovDQo+IC0tIA0KPiAyLjI1LjENCj4gDQo+IA0K
DQo=

