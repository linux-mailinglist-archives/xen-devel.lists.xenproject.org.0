Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E15F7852
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 14:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417978.662715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmos-00045Y-0y; Fri, 07 Oct 2022 12:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417978.662715; Fri, 07 Oct 2022 12:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmor-00043X-UK; Fri, 07 Oct 2022 12:51:13 +0000
Received: by outflank-mailman (input) for mailman id 417978;
 Fri, 07 Oct 2022 12:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SCdg=2I=citrix.com=prvs=2723a6b7f=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ogmop-00043R-Q8
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 12:51:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b30111bb-463e-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 14:51:04 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Oct 2022 08:51:01 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM8PR03MB6245.namprd03.prod.outlook.com (2603:10b6:8:32::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 7 Oct
 2022 12:50:59 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc%7]) with mapi id 15.20.5676.032; Fri, 7 Oct 2022
 12:50:59 +0000
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
X-Inumbo-ID: b30111bb-463e-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665147067;
  h=from:to:subject:date:message-id:mime-version;
  bh=4niM8e1iZ9AOUUXfai6ODxFRpXhS9pTHqAUwctG0yyw=;
  b=T5wSoYCwj/IftK5shBAstnujpq+qhk6k6h1cj0gLXqQG6+d6/+1ZTg2F
   X5o+tmTT6v94vMkYkaI3C5pu8MP+WMa34UgNAmLMcjkpUCo9pepmhHtN6
   UCnJw5tlI3tkdbTtFAzDnJImWBqe7sndyCT/RXFa9VuQle7vEyof+puCu
   8=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 81840090
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:53Ym7a0UsV0UGJHne/bD5SVwkn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/2+pEIDsMWBzd9lG1Btqn08QS4VpJeeC9/IcRatNXObf5bIHElpt
 ZROMtedc55oQyKArE3zOLHt8HIkiq3WHeWsYAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 Put8sfSZgKvhjd4bWxLsayKpU8wta37tT5A5QU1bKBAtg6CmyEZAqxEKPDqJRMUYGX28s2SH
 L+fke7jrgs12z93V7tJR56iKhVirob6ZFTI0DwOM0SbqkAqjjQo1aomP+YrZ05SijGY9/h80
 9wIvpGrIesTFvSkdN81Dl8JTkmSAYUcoOWdeCDn7pTKp6H7WyCEL8tGXRle0bIwoo6bMUkWn
 dQEJTYEaAy0hu7e6NpXncE126zPhOGyVG8ukikIIQPxVJ7KcriaK0n+3vdK3S9Yuyx7Na22i
 /z1y9ZYRE+ojxVnYj/7AX+l9QuiriGXnzZw8Dp5qUerioR6IcMYPLXFabLoltK2qcp9uRmKv
 GLquHbDKRwjKfif8hW082Oombqa9c/7cNp6+LyQ0NdP2QXW7EpMTRocWB28vOWzjVO4V5RHM
 UsI9yEyrK80sku2Ut36WB7+q3mB1vIec4MIT6tmt0fSkuyNu1nx6mssF1atbPQJucgsSjFs+
 kKPm9rxLTdurKeUWTSW8bL8QTaaaXFFcTdaNHdsoQ0toP3Yg48DsTb1EfkkEIOrvszWGjWgz
 GXfxMQ5r/BJ5SIR7I2r8FaCjz+yq5zhSg8u+h6RTm+j9hl+ZoOue8qv81ez0BpbBIOQT13Et
 n5bncGbtbgKFcvUzHPLR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCLCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:tvXbf6kWdO4/zR50L67UMry2kFvpDfOvimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7Sc+9qADnhOdICOgqTP6ftWzd1FdAQ7sSibcKrweAJ8SczJ8U6U
 4DSdkYNDSYNzET4qjHCWKDYrUdKay8gcWVbJDlvhVQpG9RC51I3kNcMEK2A0d2TA5JCd4SD5
 yH/PdKoDKmZDA+ctm7LmNtZZmIm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYZ93
 TfmQCR3NTvjxj78G6R64bg1eUZpDLT8KoDOCVKsLlUFtzYsHfmWG2mYczAgNl6mpDs1L9gqq
 i1n/5pBbUJ15qWRBD/nfKl4Xic7B8+r3Dl0lOWmn3lvIjwQy87EdNIgcZDfgLe8FdIhqAJ7E
 rat1jpzaa/ICmw7hgV3eK4Ii1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdQHI0bFCz35Yg7GK
 02Zfusksp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIgUn2sG9pg6V55Yjt
 60RZhAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaILVHuBMg8SgHwQl7MkcUIDc2RCeI1JcEJ6e
 j8uXtjxBEPUlOrD9GS15tW9R2ISHmhXF3Wu7Bj26Q=
X-IronPort-AV: E=Sophos;i="5.95,166,1661832000"; 
   d="asc'?scan'208";a="81840090"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbE35edOF3dgPfXOrywh0vCTBDq/mJkWC/QmWmelupVOQetLHGOdvrxjgO10cuaYr/gVXhHCDWcDH6RpfDAEo+fakBJSTTQWoo7G6JLTV+ccMrtoDy0kDEyJnD1Dcwd3NgQ6dP7kwDHmoqXdJX/p7caq+MLhKedYFgIMTkjRgjt8MJCyuoGR3EGlGqRe0sq/0JRupe7DKVb4WZM8WP48uou/UH1i8T6fvXcZizHLUlTpD7mV4tkccN6GH/zdVti1chz6hfiDqyd0PagLkECYPf1Liol94a4nniaQvCAqsVhnYswtMSyt2/6dSDNzeBTAP0k0SN6yC/RCBAfclP6zZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuA8KWFhzq67ORrJrlMBqopD8OAJKPj6HyPtO9fF1Qc=;
 b=oQnLEV2wItJfgk6uUHaeMmf0cB/67FLB7xGMtzsv/dT0CEiutunS5iXXimkXrtQQ1L0MQ4uQmjJAC3odOHqTGPzjATMaG9qq1pW+mBFOUm6C+ivcCCXCQtuE3KoR9LUPPE0EPceC9hdpB5cyxWhOiNACvYfrbClNlwJzMYnl9rwcTQCneP+krY6RUOGkJwjvooGTQvRfW4QcVybXWtzndCer+R+Dwcuc2y7uGTr7/kBu40VfSHA0siK2lOuQpLLpu5o5CWxBnJZ6jTtFFkx87sA3LXNNYqDwVU2lq3oPsDxzF6ATIbAydJccLJzd3KT3PD2EByhwu/h+DAsku3KONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuA8KWFhzq67ORrJrlMBqopD8OAJKPj6HyPtO9fF1Qc=;
 b=AY0kjCAplN8uOJq34dc/LHpI0Z0PzV/Rri9Syz3jgljDzUjB2FidU3LuQLi15k7BmUfBUaw0L2CeHpk0jNoHMIOW0U2RvdIGEEWmvy++ep8Fy4oLBZKwc/a1coJ4XO4wtTBm+FuegDFiSryKGuxr/k/3OzoY+Hg/Tf0zMyfD41c=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: xenbits disk space "garbage collection"
Thread-Topic: xenbits disk space "garbage collection"
Thread-Index: AQHY2kty5yg/FDgjgE6XFBAR+Da7aw==
Date: Fri, 7 Oct 2022 12:50:59 +0000
Message-ID: <4ABCA839-C1CD-4132-9DEA-2FB01CA4476E@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|DM8PR03MB6245:EE_
x-ms-office365-filtering-correlation-id: 7f0a2be3-d4c8-4ad4-96fc-08daa862956b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Dq/pw/4jJ+rUe5yU6VfTx1zwnnrpmjAuTCjPgFw9d3/XYWzioyewS1J5N875LWjXfLQHMhQYwFPC33Deuz/kVSeYn4Peqy5khbgXZlUr7FC5IXvEDOI1HXLhjYDsw+Vz7mZsw+akg9hH1CsQzdDqSkUkLUGLosFmcGKyfIz7GwwgJVYJIcr8xH9v58mgQfJ9yGCN8+xtYWmbMnkmQrFNScdtle/7dOUQwMoWIu4E4NwQ2EsdZrNi9ipbCy0ICzPDPI/oFX1HOTXmnWZ4YjjlaN7cJIQik8gJD9gDZYGUYLT8KcrXyN7l5Qt7aRR7OyKgW5W2VHZ3oqRHCNpQQJP/ReoPcfesE82skvxtlPybb3hjIoEr/TXUpo+jknPx6HlAYzh16EDLrzWugnVODXyqtGgzFXIJ7dHmGYooNbO6b8si+IONQgY4hJ1LVaL+pc7HNdoPvZt8HpeVUuBZKpuQjLZh+btnSCk6JHGzpy15oiYXhZTGlas1NbQttIaWMwWUnw6B1AyoAYzDi7lChpJ+dBc5cKkxuEn0HXMhHLsyFewlrXpmozfzZmo7b61vhATmguIDM4mkjIZVqDuvL0IiwSd0eKEpMWuZwhQ/hfUwkJWgVixAKHvtpM7VYcnCCPcX2KSG4rRQzNduEMdPNPK8Gjfu/2nbrnTO4gRxd9VP2bnLzaaIisE8jCpaPBhA+oJVVZGriFm5NnUAZ8K9YhMrVaUYCNZCmBaH0mOGlbzyDPwiiibnEnZS89dydDcqjc2Zo1yabLke2WTWo7VASo905f0Q7ZZetCQrGpunTLfAsscpctFs29QMrN4I+Blim2sa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(5660300002)(2616005)(186003)(6512007)(2906002)(38100700002)(91956017)(26005)(6486002)(8676002)(478600001)(41300700001)(6506007)(71200400001)(66556008)(83380400001)(6916009)(66446008)(122000001)(316002)(66946007)(64756008)(4744005)(86362001)(8936002)(76116006)(82960400001)(99936003)(36756003)(66476007)(38070700005)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXR6WmtHMU5IK1FTMXdmcjJHdG9OZVNOZHRPdGJPTnd0UVlFdkRKU0NqU05n?=
 =?utf-8?B?bkQ0WmRpalhOZy8vNS9ZYmpxZStWUFJ3OHY4TkxIYkZIMWxNakhXUXRVU0wx?=
 =?utf-8?B?a3NCcFBpS2ozd3FTTEh0OXFOenFWckVKTUJnQlFPbkQ2eVFDbFYxbjRBNyt1?=
 =?utf-8?B?d3IvSW9mbWw3UjZGVWFDZmpCTkd2elI3V0Vyei9nYklIOWNMdDJFWHNwQ0ht?=
 =?utf-8?B?RktSUGd6VmVzLzdJZGw4T2toRVJUQmhBeXVOelBVTTRnZHVXQWtxamhFdE91?=
 =?utf-8?B?TzZ0VDJLMUx2QzViWG9DWHpZNldYcEhvMkI1b2pqVjZ0UkJ0aVp3ZkcvampE?=
 =?utf-8?B?eE1DQkVNR1h3UkZRTlgydmhPYktDK0xlODlBUFZTZituMW14UDg5N2M0TG5o?=
 =?utf-8?B?Y0ZrL2hGaDhpVXVZaUxpTGdYS2tlbUVMRi96SlhRb2pHZlllVUFBZUFrK2Ur?=
 =?utf-8?B?SUNvU1ZhamdtdUJoQVhNYXNhQUhqWTJiSEgwNyt5bzFxVXJSV3M3Q2FxN3hQ?=
 =?utf-8?B?Y0x6cEo1QnlqRDdGUEM5ZG5Id2NVWlFYbVhRY0tpVUVtQTFlMkU4d1BUWmVr?=
 =?utf-8?B?L3paRG4xSWhwRWJEYjRKN3hRSk1wZVhHdmFuckZrWUFjb3JoOXpVRm43VW8y?=
 =?utf-8?B?dkxCRGUzWGNVYXlFMmgyUnpsSGcrcFlKekFtWHZLMVY0NExkMmFqOTR3RktK?=
 =?utf-8?B?V0lHSk5zWTFaci82SHBQWDQvOWl1V3FSR01PMTFkYlYxdFJoaVduWWFZSEtX?=
 =?utf-8?B?aWM0amRsV2VyNTlGUTJLNGVWTUs1YTJjbWpud2wzMEd0K1BIU2hSQ1ZyVEJD?=
 =?utf-8?B?T2NTek83QVFQSXlYVnNWcGVaL0dpYm9MUlN0WVZHbTZUMEJPWEFhNlh1clp5?=
 =?utf-8?B?Vmg3Q0N5M3Zody82SW5oS0IwUkxLdjRFa1UrN21Db1AwcDRMcnZmdEZSdGtm?=
 =?utf-8?B?QTY4MERzbGlMRE8vMWNHcUNQdHlRSmhXc1M4TWJZOEt6WTVYYmFMLzBGNE0w?=
 =?utf-8?B?ZlA5YjlFblNFSXlKdVIzN3hBREx3TDZHNXkrMGU4bU55VWRRbDE1ZnZUZSs4?=
 =?utf-8?B?QzBvYS9vdHM0Q2FwYklzbU9CM2poaXo5dWFuNXhUL1ZOaU5oZlBabDhrNDd0?=
 =?utf-8?B?WDB5UlhaQitmK3FQM0oyMU9LTFl6U1lRcjFNcTJKcnBKVm1tbTBmbVhnVllk?=
 =?utf-8?B?QWZreWsvQzNWRzRsZklpK0JYMExqV2RGL2NyQlI5dnZPTUdwUEhJd0VOTFBn?=
 =?utf-8?B?TlEvT1Nmd1A1TzFxYXEyNE94SWVmR1B4R1UwanBrb2V1RXpwSzBRYVNJUjho?=
 =?utf-8?B?cldNVC8rWUN5dms0WnlkZDdvU1JWSmcrYnpMdCt0c3FQeXNnNzREL2xxcXp6?=
 =?utf-8?B?YWNtU25TcHhRWk04NTZRSjMvU3RNTHJjbXZiRURySTZWSWIzOGpmUzFqbXBX?=
 =?utf-8?B?MnhsY3h2d1dEWHVnY2FsV1RrNDFyNDM1UTlFQVVKL08zS1ZJZFRxUDhpdmJq?=
 =?utf-8?B?T1UybXlRYmZuTUlldGRtMHMrblI1SWhLR1ZRUXFDZjgwM1FYbkViRWVIdUtq?=
 =?utf-8?B?aitXNEFRN0p1L2M0UzNnc1A2TTE0K0xlQWc2N01zdVkwN2JRcjE0T1NlV3Vh?=
 =?utf-8?B?dDUvdkYrNThxVGRiZ0gzVGNqZ0ZHbUMyM21henJUK3lVMktPU2Jqa0dFeHNC?=
 =?utf-8?B?cG1WTjJEa3I5QXFUNEx2c05DM2tGdGhOQ0QrZ2hHZDc1T2JlQjhLTFZ6ZXk2?=
 =?utf-8?B?cUdHb28vUkJQbDYrYUN6dGxENTlCNGlBUmpkYVFyanFGaUtsYXpWYkR1dUdt?=
 =?utf-8?B?VjhtZlF1VjNMR3Vmc0ZqSnVqbmw2VWtFdmdFM0ppNXVMc0xEMWVxZVFmUkFy?=
 =?utf-8?B?azc5Nit3VkkzWGswY3JkSjRHQy9CZExVOUFsYXhJQTQ4RVhaR0JOdDVPbGdr?=
 =?utf-8?B?WXJjT2tXUG9OUzdkeWovTXB2dkZoanVNK0xWZThxVTZZR1NrM28vcVREd2hn?=
 =?utf-8?B?SDRPblZkdHNXVVFRYnpnYVVHbkQwQzdLNDNoVFd4dzhiSDJOOUU5S1d2c3I3?=
 =?utf-8?B?bGRwQldrd0lWcGZwc1F4NFJJMWRQcmNOUWY1NWhkeVdXQ1pPNmg2ZUVma1pr?=
 =?utf-8?B?WGl5R0pPdVEwbElVWHBoVVBtWkFlOHgyY2RJQ0gra0gyOXVvMm1YK1RRMndO?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1F09FA5B-E886-48D3-BC6A-5D939EFC0FAC";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0a2be3-d4c8-4ad4-96fc-08daa862956b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 12:50:59.2995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ADqI7j3WNebxASkSRs7ihNog+N25r3OgQTNvTs2ZThsktQ+nNGSKGiY/qJsNQ6WdIwoECBAHH8501Vb/+1GqY7Ral9EcKLLE2Q5vk1XRI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6245

--Apple-Mail=_1F09FA5B-E886-48D3-BC6A-5D939EFC0FAC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello all,

The xenbits disk is getting somewhat full.  If everyone could take a =
minute or two to take a look in your own home directory and space on =
/people/, and delete anything you don=E2=80=99t need, that would be =
helpful.

`du -k -x | sort -n -r -k 1` is my normal rune for this sort of thing, =
if it helps; feel free to suggest your own if you think you have a =
better one. :-)

We=E2=80=99ll also be looking at archiving old home directories and =
other content, but it=E2=80=99s good for active users to do some =
=E2=80=9Cgarbage collection=E2=80=9D of their own occasionally as well.

Thanks!
 -George

--Apple-Mail=_1F09FA5B-E886-48D3-BC6A-5D939EFC0FAC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNAILIACgkQshXHp8eE
G+3S4gf7BF7OrH7g36Q3fHw9qGoQMT6bF7QR7JkiD+dXVueMdxAc0gnczZtXryQD
wLGamP4P2bUZOtcaH/CdoalupGo1DRXv7Fm+OG5ZKOTsBZiRu/720yZ+R2yp8KDB
cW4SjFJBprzIku5wu+0YF/pp3f8fLQ72MnfGzGH1Wz0at+r4fWDwD9+mu5juMzOt
PqyJ1wWj8cHzKS94pE838qeJ/d+X7nDTdf+NIenyauNeQ25WgfexG3u5Kofxdu4X
VhtALEf76/RWfdkJp169OcOeeoaLHFWOeCCS7+YURhQpjQXi3qh237mlV5WevQAC
6LOk8mInFiqnGZvIHigi489L/rIvmA==
=oWEn
-----END PGP SIGNATURE-----

--Apple-Mail=_1F09FA5B-E886-48D3-BC6A-5D939EFC0FAC--

