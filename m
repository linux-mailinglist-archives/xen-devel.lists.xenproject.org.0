Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D058855E588
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 16:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357155.585603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6CZg-00071K-3s; Tue, 28 Jun 2022 14:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357155.585603; Tue, 28 Jun 2022 14:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6CZg-0006ys-0M; Tue, 28 Jun 2022 14:52:20 +0000
Received: by outflank-mailman (input) for mailman id 357155;
 Tue, 28 Jun 2022 14:52:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAZO=XD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6CZe-0006ym-R7
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 14:52:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50067.outbound.protection.outlook.com [40.107.5.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70beaed-f6f1-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 16:52:17 +0200 (CEST)
Received: from DB6PR0501CA0040.eurprd05.prod.outlook.com (2603:10a6:4:67::26)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 14:52:14 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::bb) by DB6PR0501CA0040.outlook.office365.com
 (2603:10a6:4:67::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 14:52:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:52:13 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Tue, 28 Jun 2022 14:52:13 +0000
Received: from c4641c7cb94c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89222CF9-4897-400C-A1DC-E29A9BE96B89.1; 
 Tue, 28 Jun 2022 14:52:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4641c7cb94c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 14:52:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB7290.eurprd08.prod.outlook.com (2603:10a6:20b:435::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 14:52:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Tue, 28 Jun 2022
 14:52:00 +0000
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
X-Inumbo-ID: e70beaed-f6f1-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZgeIupU9VHXKbgfRsbU8TlI6LS5m/uJ6BdO54ztqPZKu/m4zia4MAXJDmtPJl21/MtSVZqCNSfISnPXfnk3dI1RPORB2B1CWpJLmHQq4W061fP6FhKTniAS6yJFkzS3jgGOJMKFkNqz93GYQFGlVp4L/V8K1FfrNn/x28X5FGsUZJ5/aAprKJeDoUqqJoQo5Tkup1C8DDwiPpTafTU4VetF1EMUHVk1oA9Qum7NOoD28rPgPYZYb2m8yseGOR6LIMgEAoUQ7f9KvVIpEpLnvoE1/FSNyyTh977p+5oiKHzvVD/cOFyyqSenZ/APe/fs9fXcyASGQaHi7R5X2s6kqXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3Usn+WLduDq2CAWi0URDioj7XgRGUFCPKnDcPy7kPU=;
 b=YWHSQfPKv24+FairVlQE24ApxBSG+maX0aEPT0UcDD6qkXEGeuMfSWSyJJcjCe/9DuE0WtA0GZdfPvisuEo50ueD6z/cprZBDpPXxNLhQAZXhgroi1N8V/Qv3MpxnmYgP2ZT55OiZVeB3bxXTThLfK66qYfADO1Pvc3n8Clv7Dhsr2gCsybew93LNeQWLaPyiGcz7Q7S/pTqV3IB9vreCC2IORVq7WoQTmOuhyRtCKp67d4BNzKjqAXI26QcJBC1nSOgamMZc4HjxmH78+gNFXkn2v4EC9PeToOS2I7fzoEEGTLNbGn13KGXLcCc6RyuYdLMxXW3m0XS5NCEEGMPzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3Usn+WLduDq2CAWi0URDioj7XgRGUFCPKnDcPy7kPU=;
 b=QJho5GkSb9LpwtaROMwU7dcf0qOJSF8rPgtBLqCfsYuacExJiqzgDCUhVoYsrRg/0DOWRN8sWXN5dHqq366CaF/17NcwV33xML/p8s0Wjb86GCNW4T86EvpDRfoNpC0qA/D55B3nBJu4z8BEeX+g3Zmhli/7qBdoaq5Z4ufsP8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d40ca54d5ac9106
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QemuhnuxxRrkMgUVG4Kuxs4BjfAtOnbAxWtM7pHQy/+yiInQuQYFvx/ThJoFITNLiys1hgsRe/3SclmwwafpfgfDnHEjLoJVTmy3KbUgwEr4XAqqC38ltax36QjfeZdW4O73Cn1vjMdYccaw8FiY1c0t4smLv5yYd/vmClun4vHS49fiyuLA4h+VJO6P0/lQF+IbO94UQeDqvFuXjako08HhIcCgJ5J1g/HrpF85VZdQogN+20WGhL6wTr3PHFPloFdyFfbHOka6XB6Zea/CPiEnsYoO6B9EvYLjZJWEBh5hkTspT6TW4XC0zsPpNVI1XWs7ei78ZYq6PYsLVqOvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3Usn+WLduDq2CAWi0URDioj7XgRGUFCPKnDcPy7kPU=;
 b=l7jB00QhdNcOHZ/zitLAmi3uQcLlYv75DP70VaRPNs2BohKFq8BPDxsO1zFIp9lzT6f5laHDCxFFUvMHbXN/MVvJbc7v2cjRIbOcmSBGXN+rt2CiZzpGOkNUC5cpm1z1HjBBVu9R7q7ztMaFByLiJ73EwcLJmVOE7ASRwOIf0mbVItqQJi9BEKqlcIh5WAH92ZGnl3g4Q+HsXZFn3/vzVcG/de3LNX3TFA9N6883ZSIOqJhyFkVIqC0YISpvthg84N0geoceGWHCyY0VC9wU5x0uSq7Z1YLttcGnL6eKYO+0H2hi8luAm+HYE4hxgNNylpkII62JXOyDvZicUebR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3Usn+WLduDq2CAWi0URDioj7XgRGUFCPKnDcPy7kPU=;
 b=QJho5GkSb9LpwtaROMwU7dcf0qOJSF8rPgtBLqCfsYuacExJiqzgDCUhVoYsrRg/0DOWRN8sWXN5dHqq366CaF/17NcwV33xML/p8s0Wjb86GCNW4T86EvpDRfoNpC0qA/D55B3nBJu4z8BEeX+g3Zmhli/7qBdoaq5Z4ufsP8c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Topic: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Index:
 AQHYhkX7DDZgCoAMsUecvv2wUY+1U61bhmuAgAGTuwCAAAWdgIAHwJOAgAAJOwCAAAcgAA==
Date: Tue, 28 Jun 2022 14:52:00 +0000
Message-ID: <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
In-Reply-To: <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 33a5013b-9183-4edd-63cf-08da5915c994
x-ms-traffictypediagnostic:
	AM9PR08MB7290:EE_|DBAEUR03FT007:EE_|AM6PR08MB4916:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eh9E1A+Jag0J21rmNahOV10V9ba0Zb3W9yPLKIipB7GnGg1PQWGpbY9SDYRJNF0b3rtcF9Lc3B7l4GufGn+u1bAG7Mrg7s4OWNAAUC8iXXt4WSJ0FPaeIh1MmAF3RO8oYIlBemaqEZ3KtErUIuvfVA9UF+d69Cb4hgmNb+f1ApJn6c36+k/X1Bz3dmuA7tatt3zkOCwBGRCD8tL0aOWKzXE6LdRmrvF+L3+vbfFzs9zsAYyvFefFGvIcyXSho+sYUG+fvi3Afh7ebyWIPeBIpf6faCsd6Sx6I3N+NYdlFzginvM4HuHyI19JQJAavmrP6JKs6Bn4yFbZrF9U5SluXH5SNwq6AExjbBEsTq8hTTeyM55qNf1mDTEvMGZ2ykOF5ZT9Vp+fVU20ByShRHfQ55o3PACu/ZTsLCnFqU9oC7PPU7AIjO9pi2ToEgkFhFvzhqjiTV0M4F3wz48DN0/QQEkptqgyp8uyTLTxynJD/t2j4x+wOAysrUU8FoHq+rN5K/mCbecMdoUpEDoGaQ2xqrcXNgwrw63J/6YEdvQI44PS8i58GDBH6f/LexwQp7UL4quMbyGRroCPVZWBII1lHqjTJK6XOR8dugFcMq0pz+7e15xs9V+32y+6xMAXFCygVvTuSHpgn7IgGt74bMQ0sLPXIrzZXRLujv71FVSqHYPr5jh76qIUV+WOLiaJbjtPxAVBnb6XSF+WE2bKzru1SxSgRv06eIvIwRkvJseIj78jdV1R7N2wD9L/k9+ViKnfHCj3hsqgstrc1KCgB2AZTFAZbApijoBLbKcK6fZrGVmGU93jkGL5WhR/Rm8Pw8Mx/KhSdl8ekXOhB65KftK3Cg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(26005)(66476007)(186003)(8676002)(38100700002)(66446008)(41300700001)(6486002)(6512007)(54906003)(5660300002)(2616005)(76116006)(38070700005)(478600001)(4326008)(64756008)(33656002)(6506007)(66556008)(122000001)(36756003)(91956017)(53546011)(8936002)(2906002)(71200400001)(66946007)(316002)(6916009)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4DDEEEA0EC8F344585A1D504B92DFF21@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7290
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f639868-4f66-4e56-a57e-08da5915c19e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aOnhfDxEsza7wQgdjtyV0iK0t3NCrX36eiYY8vpVCprSrGYZsane7so3+MmnKEPnGUryPInvoOmAIO4+jXQPeZIaHqlIYAqNsCGtgrxz1yvwfEAeSawm6X+iegByuMp8qcF8iD6EMR7YkaO6dT4IKuVvU41Bq/ycwFwcbT3VI4l3FRFvd3tyBviM9QC8I0ActiRHwQP1yCqf6mRFmzqjN4/wShyh3HHHFF3YGfwNpo2dA/D9sOPHgnNs4vtoXFAVcfVaxI7tIi9GcFXm+Uv45svdxYGg40GlvCtlc7SlitwTnEm3WilWn3isnX3VzjQimFFSNwdndi5vvDhItJJaeUHx6t9LO4kMpCtDZqkBJ00GuT0lCrueCPgpvtSjsGZCsJFrOh2Nkn96w+vURhH/AwQDpmwwLlosmdRQzdSpAb0SOfcaZscOPvwcyQLM30F2XuS5ThJvSad+6v70M/dKufQeTPS/WWG2fDuciKy1UyrXQ+mYsitkr1o+Cj2hESeKI4T7+RsaMz6p0LpKfEaWWmwTBjIL6vJb8b9JT0ZR3gmSCrUnFxWOF1XUq3bIutFeeNCzoGZOA3FzNO+eO9CNT4AqXrtWjiSlzRKojVWvAyj68k7UCuOPdC0m9Ij1vdPQLqO6bcu4NjEd9T7Rs+A9P7jQSiJP6j3i0vXEVuxblGI+hz0fcH+f4vkxsVMvFa2tR0nxwQXvA9HVWb/U4A2SmIWB33DQpAO5bpgztinTwVl++sWh4nXRYoyADg449e+4NJFa5gj8aHOMfVG6LdpdjfN0aAalE80Npn/erHoPttjBiCHk7Aom8jfUF4kiFQLu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(40470700004)(46966006)(40460700003)(33656002)(6512007)(53546011)(336012)(8936002)(6862004)(6486002)(8676002)(2906002)(5660300002)(4326008)(81166007)(41300700001)(356005)(82740400003)(478600001)(86362001)(36860700001)(6506007)(316002)(82310400005)(36756003)(186003)(47076005)(40480700001)(2616005)(26005)(83380400001)(54906003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:52:13.7320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a5013b-9183-4edd-63cf-08da5915c994
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916

Hi Julien,

> On 28 Jun 2022, at 15:26, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 28/06/2022 14:53, Rahul Singh wrote:
>> Hi Julien
>=20
> Hi Rahul,
>=20
>>> On 23 Jun 2022, at 4:30 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 23/06/2022 16:10, Rahul Singh wrote:
>>>> Hi Julien,
>>>>> On 22 Jun 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi,
>>>>>=20
>>>>> On 22/06/2022 15:38, Rahul Singh wrote:
>>>>>> Guest can request the Xen to close the event channels. Ignore the
>>>>>> request from guest to close the static channels as static event chan=
nels
>>>>>> should not be closed.
>>>>>=20
>>>>> Why do you want to prevent the guest to close static ports? The probl=
em I can see is...
>>>> As a static event channel should be available during the lifetime of t=
he guest we want to prevent
>>>> the guest to close the static ports.
>>> I don't think it is Xen job to prevent a guest to close a static port. =
If the guest decide to do it, then it will just break itself and not Xen.
>> It is okay for the guest to close a port, port is not allocated by the g=
uest in case of a static event channel.
> As I wrote before, the OS will need to know that the port is statically a=
llocated when initializing the port (we don't want to call the hypercall to=
 bind the event channel). By extend, the OS should be able to know that whe=
n closing it and skip the hypercall.
>=20
>> Xen has nothing to do for close the static event channel and just return=
 0.
>=20
> Xen would not need to be modified if the OS was doing the right (i.e. no =
calling close).
>=20
> So it is still unclear why papering over the issue in Xen is the best sol=
ution.

It is not that a static event channel cannot be closed, it is just that dur=
ing a close there is nothing to do for Xen as the event channel is static a=
nd hence is never removed so none of the operations to be done for a non st=
atic one are needed (maybe some day some will be, who knows).

Why requiring the OS to have the knowledge of the fact that an event channe=
l is static or not and introduce some complexity on guest code if we can pr=
event it ?

Doing so would need to have a specific binding in device tree (not to menti=
on the issue on ACPI), a new driver in linux kernel, etc where right now we=
 just need to introduce an extra IOCTL in linux to support this feature.

Cheers
Bertrand


