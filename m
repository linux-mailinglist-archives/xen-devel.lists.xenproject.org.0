Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71405548521
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 14:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348172.574466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jF6-00044e-OW; Mon, 13 Jun 2022 12:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348172.574466; Mon, 13 Jun 2022 12:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jF6-00042L-LJ; Mon, 13 Jun 2022 12:32:28 +0000
Received: by outflank-mailman (input) for mailman id 348172;
 Mon, 13 Jun 2022 12:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6zz=WU=citrix.com=prvs=156a1e8c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o0jF5-00042F-Ax
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 12:32:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df65f375-eb14-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 14:32:25 +0200 (CEST)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2022 08:32:20 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5151.namprd03.prod.outlook.com (2603:10b6:208:1ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 12:32:18 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 12:32:18 +0000
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
X-Inumbo-ID: df65f375-eb14-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655123545;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DDmdS9C20E6VAFH26/qcnxPol0BlQF0mtAlYVXyViM4=;
  b=gtka6HC2KlfeTIpaNPlykR5yQEYV7hNEXFaaqzmDGffaheXhO/08+h2P
   Xt6wnG9Wy++ez/rQRCbaETWez2xCFacVgrl+BAT17VJ2E7ZxNGH8aCb5X
   nOi4Cl9U+m/woOPw9qaxCkiGGZAMbM2HdMs4BSRWujiVQuQEuXIi9ixsG
   0=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 73869221
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nU+wD6t1bCPgsFupYJZrdshQZ+fnVEpfMUV32f8akzHdYApBsoF/q
 tZmKWiFParbZDCgL9h2aIuy8k1Q7J/QzoAySVE/rSAzQnwS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW13U4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8yH4jBpOYYViMESShDNqdJ9+PgPz+w5Jn7I03uKxMAwt1IJWRuYcg9xbwyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4ADmm5v36iiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3O9fRmuTKKpOB3+IKwboDfasSIf9hUs2Wdu
 lLrpWHyWThPYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IB8LUVq2p9Gph0j4XMhQQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQKHBYYyYBFVcB+4O6/9h1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlkRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:tKmasKBgV1H5gGzlHej6sseALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UossHFJo6HlBEDyewKiyXcV2/heAV7GZmjbUQSTXflfBOfZsl/d8mjFh5NgPM
 RbAulD4b/LfCNHZK/BiWHSebtBsbq6GeKT9J3jJhxWPGZXgtRbnn5E43GgYytLrWd9dP8EPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+zQ+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRieerRfb8yPT9GA+czjpAV74RHIFqewpF5t1H3Wxa1e
 UkZS1QZvibpUmhJl1d6iGdpTUImAxemkMKj2Xo2kcL6PaJNA4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NreQg+Csa4nZcjEBS2dL7tUYvGrf2qYUh2rA37QdQCtMNDSj64IcoHK
 1nC9zd/u9fdRefY2rCtmdizdSwVjBrdy32DnQqq4iQyXxbjXp5x0wXyIgWmWoB7os0T91B6/
 7fOqplmblSRotPBJgNS9spUI+yECjAUBjMOGWdLRDuE7wGIWvEr9ry7K8u7O+ndZQUxN85mY
 jHUllfqWkuEnieRPGmzdlO6FTAUW+9VTPixoVX4IV4oKT1QP7xPSiKWDkV4oKdSjUkc7vmst
 qISeBr6qXYXBjT8K5yrnjDZ6U=
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="73869221"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk1W3K3/wF+hcAGqRyT1LpPbtpfGa9fGZ6c02LcwAYKHO1KbAeU2p74N/KDEuf5h4FGwIz86u7W8UJ8057YfnLtnrf0gqLnMOLqb3AJ+96TZODnR/WYhj9wEcvruh1E7znL/CwaiDW2lkvoPaGHcPI0hJgcZf/KOLvrnG0IE+2V0s5NkvBe8Ce3I/7lQZSSC8bwgkoUn2Od2KScF2phxvVtSTr6dPiiQUNZ3ij86dplWz9hUq9E3sq0dsMcnpMvrsGzlUw/z+PsImOq25qI1U2N2+kiqX3zvzvy9vgUnScgi86NIvknahrV6qkjyaYyKrpxpM3XQ5zodjoXVTtQTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl1hpugtFISblOFnrxcOsdjwspC8D6kL2znPeVQKb64=;
 b=NumEmYf68rV/eVtcPd/oW8PsBtdEThaaaj1yp32tMaKD24W0pl9gMJgDfDJeyLwYMfjlNLzOT5RMYNcvfvYTH4suCNVpQWrvl/L0WPHtRKWp7AdXLRZ77URFAjZ1J1JslemU8abOaCPJ1ZivuHofcsKQDni6b9gxQ0AjDlaQQbJwWNWI4v5+M93WkO1M3ahHpR/39wzvw41fGwC6k1ik2P8FrHYkjUYIKKRJlsDssDj9BhMlLTIExTpDmMmY+XDezUXPpyW/Sth+yevcuWiMUkH1rdy4q0JRtA8+ysuXvskWRQnZxiIklnHac2tLozLQ+RmxdSQdiguX0uTKBVGdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yl1hpugtFISblOFnrxcOsdjwspC8D6kL2znPeVQKb64=;
 b=oj+yoOKleWGRmgn7CarNUkHsbHfYZlomG7phuQZdPX/8tiWGexAB0jLrITD9qt/08gXBglpS3nSr052c/wXd3PgvTpYoer5ZqCHLkFEzabmx0aeA3jDBYDmrsVgtCXpKh/Grj7m5XgX9ZR5afQoiBz6nUm4Vf0uzvWFWInTafgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Jun 2022 14:32:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YqcuTUJUgXcO3iYE@Air-de-Roger>
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
X-ClientProxiedBy: LO4P123CA0289.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d361de2-bf98-45ca-afc5-08da4d38c168
X-MS-TrafficTypeDiagnostic: MN2PR03MB5151:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5151D29E7DCEC1DFFC8289188FAB9@MN2PR03MB5151.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/A9oOn1hHEnWJsAI9l4Fbieyddf0dIirqpNe5PDxYonIpNx/vS1kdvDvtyJd1l2M2htTMd/kBobBIGCN1FifBedFO3fkAmWo+hSj2U8UL1iUG5B/I4T/ZhnINdNTJMTaB3E9w5eOnl6u2UsvNsbvBEtOWvGaMYQiziwn+jRkKgnlX+DW52MBRIAwCCBK19k+7+38GylsF1X9y2/YrADKiIRm9alwvsGOTfwIOSxVL6+WN8zO+Ev3wryJ8zGesrY7Ll0CosIsUqjio1hMLXI+oj6CS/yWFd13Zgp0cexE1k/cv3+/mq/dzeuHGEzUHFwjt/HGDqfuSZWljegnT2nmlMMzhH+a5m1pHZxvY64dvZwBwTfDlVBC9qgucQjIQhVY7rPce9GroMphfldFiZmoOaDXmquJYKqjRbwJDPwlzHU5CbxO3q0lg3KNY6pLM4ONCoi8ItFKagDYy8zZ6kQkreoQdyu/Sgp5IYTy4TLgH0HkY2TrmBWpie5+x1fspPy1Xr0jJ1fYWId0DnyEFHcqiMF8rPhmSkQ7tlelAJINUh1e5itVKw4uNfmNoLMW9qfVh1qKPkqzrJ04ibJqZij8olXZXOxKdFHXLEf8eoWAWwAHvEC7f+lknbEc9TaYJynK4BlTgkKkAl1/aPNlmN2OaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(366004)(186003)(86362001)(54906003)(33716001)(508600001)(2906002)(66946007)(6916009)(38100700002)(316002)(85182001)(6666004)(8936002)(6506007)(5660300002)(26005)(66476007)(8676002)(4326008)(66556008)(9686003)(82960400001)(6486002)(6512007)(83380400001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTlKTVI3YjZHSk5sZSt1NkUvSXhFZ3VDT1RxMWtXU1JGYTBZVGNoakJjNFVn?=
 =?utf-8?B?dXlEWmFNSTNOc3pnVEFPWlJUWFZ0VG53L0Q5TUVEM01RSTF4WlFybCs4eE1t?=
 =?utf-8?B?aWRvOEt1dUtmYTdveHJzbnBXbDBxL0RjeDR4RjE4UW1vN1N5OWlONnNsZnRv?=
 =?utf-8?B?Z0IrMi9tVzRkVFJsY0pyWjFmdzRCa1BqTWMyeEtBWXYrcFBOWjRWcHVFQWJi?=
 =?utf-8?B?dVVRU2JhTThFN0pyY2huRStpU3R3TkIySXgvZTV3MEE4di9tNU1ZT3lnTWJ1?=
 =?utf-8?B?cC8wa1A4Y3dEMGpEb0ZaUjQzMS9jTkZ6Njgxa0ZaRXFXdWo4VHdEOHM1SER4?=
 =?utf-8?B?WU9CZDBLY0RFZTNoYzJOZHdEbGJIbXpRKzNmQmVFUnR4S3F1d0ZDUGFyckhT?=
 =?utf-8?B?ZWVGQ1lDMzVTUDh6ZVJBZWlYNlUyUHFTQWx3aFJaeUFyei9FejF2bGVnN2pS?=
 =?utf-8?B?OHp0U3YrZ20yMldrbWZteTc0ZEpvck56cWZkYnNSNWtCN1ZyUmVOZ0V2cFFT?=
 =?utf-8?B?VlNGMWk4TWgyWGV1TTJnOTRoYUh3SHFTS2JseDdCWjU0QVRNbWtLMFBISmY4?=
 =?utf-8?B?cGhhR1k4OFAvb1FDbWQxN1RJYlN6V0RwQzVJaFZlVTBvUXRNWE1VdG15RGcy?=
 =?utf-8?B?MlcrRzdGNk41QjJDTlVsb3ZObHN1TUdmbUhMWUlZWTVVVWlNKzdRK3BIb2Rp?=
 =?utf-8?B?RGRvK3UzbzE0Q2kxWXI5UHhkZzJ2aER4TWNJZXp1RDFRaU4zS2ZyRVZKWHp6?=
 =?utf-8?B?dFpUMjBlMzI2QnJtN1czT0hVM24rajFYNDJEMHdJc1g1U0svVlpsR2lCOXBR?=
 =?utf-8?B?SU9UNkVXeXBWNFltcG1EcjhOL3NQNnpxY2NCNnUreVFpTEhuci9hcW9VaUkx?=
 =?utf-8?B?b2d1SkVQZVBlRTRNT0FSQ2wzSzdsNVdwTGozb2FSMWpuWnA0RGNyQVAxK0Ri?=
 =?utf-8?B?REhvRHc1UldMTmJ3a2wvUjlIOXY2TitEY0RqU045WkRIYmlQTHk3NXJBcldE?=
 =?utf-8?B?Ryt5dTRpOFN2OTVjRjNFeDNmWUt4ZGJSTi9pVE1MVmtzNGVKMUh5M1EwSzJQ?=
 =?utf-8?B?dEZGaWdiNHpyOERJQWNmRjc1dFlXa1hKakJNaDlwanZIN1d1ZEtYeFFNOStB?=
 =?utf-8?B?a3BqLzB5ZkxGSHF4SHY0NGx3SE53cCtvQmsxSFBrdm11bVY3U085OVhnbnpD?=
 =?utf-8?B?ak9Yd0trcGtYOVd2REtQelgrNTlNOVhvNFV4NDIrQk5FdWJRR08yWkljamRS?=
 =?utf-8?B?ZzFjT0hEMklxTVBNWnJyZkkza3lmSGdWNjQyNzRJcHlVQVp3UkdpTzI5QlAz?=
 =?utf-8?B?RUdkN0MwN01pY0FESlV4MHVVYkdzeXlFRjljdUJnZ3dNSzRaNy9pcS9TcnVW?=
 =?utf-8?B?NnJ5bXV1eHNUaG9ZU0pPWW5GZnc0emxkTktGSGJqMEtodUp6OFpnY3B5aEpX?=
 =?utf-8?B?MWhyZGRBRGVNWm4zaXBkZG5VRVRXNndzMkJZVUFwZC84dzR4NVExRGlaT09x?=
 =?utf-8?B?QUhTK0dYZ09pam9hSDRROHVPYkNqY2ZJcERFUjhUbUUvZ2dPR2VCeVZIdWJY?=
 =?utf-8?B?STJ5aWdiNktwWC8xT0FndVdjRU1zeHhoYk9LVHppSVpoVjFZSEdGVyt3Uktu?=
 =?utf-8?B?NlhFdWVYb29Vc3BOclpkbzN2ZHd0Tm1GRVc4QVpMQi91TXJnYkZJck1iTHg2?=
 =?utf-8?B?RjNIY1dYdFRMQkpvM2Z6WHpDbG9GRVo2K08zbUZRRnVWMG1IQlBUS3dNb1NL?=
 =?utf-8?B?bC9WY0YzcVlyRlI2VHVQVnNjK3cyZFZpYnlHeGM3TVpMczJVNmRreWxYSGpW?=
 =?utf-8?B?MnNJR1hxOVpVVm9mM2lVNGl3M3F3UmQzL3JnbWhpbjlqZmkweXJZMjN0ZllQ?=
 =?utf-8?B?K0NrcThXRmxZajZLNFF4bE9xNEx6cWQ1VnRIc1RGWHpVQUZnUTdoOFNRTFNH?=
 =?utf-8?B?OU8wWmpoR2RPbTF0YlRLYzM4dXQ1Y29vdEpGZG0zZ2d4MGxnRy83Rjg0M2lQ?=
 =?utf-8?B?VjRqenZmZUxkUlVjS1l5bWFjaTFkL0lidzdldllQQW9zbGtMRzV0OXRKUUx6?=
 =?utf-8?B?ejNiUE9HZkpDYUJFVENwQ1grb3lGWmQyeTdxTzM4TG9wenRyVlVwbzZQNlg1?=
 =?utf-8?B?NHo5aDNKRFRocDVKeTZPaGRaL1VoVXJLU0RwNUdaT2N1cDJGVWJ0bjNxU24w?=
 =?utf-8?B?TnBTT002MytTRUs3T3QyR1kzdkdVZzFZaEFTN3pFa1FkZHV1SU1kRmtrVGxa?=
 =?utf-8?B?N2dRZ0h0MmN6SElEd05odE4rK1JYbGloS1BITzc0cGVXemlpYnlPaDR2dEVC?=
 =?utf-8?B?Nmx3NHBLL3dhOWVaYjhVVndIaXV6THRqYXZJWk1USFlrNEVBMW1yMStpUkwv?=
 =?utf-8?Q?oGAfMCOMpzxPq8p0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d361de2-bf98-45ca-afc5-08da4d38c168
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 12:32:18.7216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bE5IWJgzgqmKPDVnIFiYSA6fmcbe1CzW63qg8A/m8qiVxtVl7rUY4ffCnNYWVbfjf/5cowaBbTb66ywMCfkJoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5151

On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> On 13.06.2022 11:04, Roger Pau Monné wrote:
> > On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> >> On 13.06.2022 10:21, Roger Pau Monné wrote:
> >>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>>>> Prevent dropping console output from the hardware domain, since it's
> >>>>> likely important to have all the output if the boot fails without
> >>>>> having to resort to sync_console (which also affects the output from
> >>>>> other guests).
> >>>>>
> >>>>> Do so by pairing the console_serial_puts() with
> >>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>>>
> >>>> While I can see the goal, why would Dom0 output be (effectively) more
> >>>> important than Xen's own one (which isn't "forced")? And with this
> >>>> aiming at boot output only, wouldn't you want to stop the overriding
> >>>> once boot has completed (of which, if I'm not mistaken, we don't
> >>>> really have any signal coming from Dom0)? And even during boot I'm
> >>>> not convinced we'd want to let through everything, but perhaps just
> >>>> Dom0's kernel messages?
> >>>
> >>> I normally use sync_console on all the boxes I'm doing dev work, so
> >>> this request is something that come up internally.
> >>>
> >>> Didn't realize Xen output wasn't forced, since we already have rate
> >>> limiting based on log levels I was assuming that non-ratelimited
> >>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> >>> triggered) output shouldn't be rate limited either.
> >>
> >> Which would raise the question of why we have log levels for non-guest
> >> messages.
> > 
> > Hm, maybe I'm confused, but I don't see a direct relation between log
> > levels and rate limiting.  If I set log level to WARNING I would
> > expect to not loose _any_ non-guest log messages with level WARNING or
> > above.  It's still useful to have log levels for non-guest messages,
> > since user might want to filter out DEBUG non-guest messages for
> > example.
> 
> It was me who was confused, because of the two log-everything variants
> we have (console and serial). You're right that your change is unrelated
> to log levels. However, when there are e.g. many warnings or when an
> admin has lowered the log level, what you (would) do is effectively
> force sync_console mode transiently (for a subset of messages, but
> that's secondary, especially because the "forced" output would still
> be waiting for earlier output to make it out).

Right, it would have to wait for any previous output on the buffer to
go out first.  In any case we can guarantee that no more output will
be added to the buffer while Xen waits for it to be flushed.

So for the hardware domain it might make sense to wait for the TX
buffers to be half empty (the current tx_quench logic) by preempting
the hypercall.  That however could cause issues if guests manage to
keep filling the buffer while the hardware domain is being preempted.

Alternatively we could always reserve half of the buffer for the
hardware domain, and allow it to be preempted while waiting for space
(since it's guaranteed non hardware domains won't be able to steal the
allocation from the hardware domain).

For Xen it's not trivial to prevent messages from being dropped. At
least during Xen boot (system_state < SYS_STATE_active) we could also
active the sync mode and make the spin wait in __serial_putc process
softirqs.

Thanks, Roger.

