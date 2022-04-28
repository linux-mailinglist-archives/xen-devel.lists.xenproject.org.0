Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440435131A5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 12:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316436.535358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk1lg-0007ja-VC; Thu, 28 Apr 2022 10:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316436.535358; Thu, 28 Apr 2022 10:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk1lg-0007ga-RU; Thu, 28 Apr 2022 10:53:04 +0000
Received: by outflank-mailman (input) for mailman id 316436;
 Thu, 28 Apr 2022 10:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk1le-0007gK-6z
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 10:53:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5db9c68c-c6e1-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 12:53:00 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 06:52:57 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB4255.namprd03.prod.outlook.com (2603:10b6:805:bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 10:52:54 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 10:52:54 +0000
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
X-Inumbo-ID: 5db9c68c-c6e1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651143180;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Z61ehkT4y0mzG0gbmx+gOfonJoFan/0VGSVnm2X9FE4=;
  b=QsQ1SAP/ZEYjPoJnBNy9KQKvLXpP3IGHpbi8jOym7EnZnTwvhgRH6K9q
   Pl9gC7BTKddF+aVozdc1Mf+mHaAHrLcEFrRlf5BKBa++9ON5Urf0dipaN
   FZnWrHhr14ctbM3VahSc/boA59vrGfK39NKejdqhcWEvxBt2rf4sdmyQH
   I=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 70531904
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MPRQaqhXKkHs+T+ZrDbZNfhEX161YREKZh0ujC45NGQN5FlHY01je
 htvW26GO6yOMTH1c9B0OYqz9EgDuJTUmtRmTQZr/yljE3wb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nd4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVw2BpbFx91aahtJVCEiJK5Ev+DsYlHq5KR/z2WeG5ft69NHKRhseKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehWht7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wrI/vNmuzS7IApZ0aDEFsuMQdmzBtRJx32dl
 FOYzVTnDURPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7Fxk+RVa95/6jhSaWVtNZM
 EgZ0jIutbQo9VztQtSVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeQDUr0
 hqDmYPvDDk26rmNEyvCq/GTsC+4PjUTISkafygYQAAZ4t7l5oYukhbISdUlG6mw5jHoJQzNL
 /mxhHBWr90uYQQjjs1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:IFQ0X6zWZWu/fORnXdZ/KrPxsOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICOgqTM6ftWzd1FdAQ7sD0WKP+UyCJ8S6zJ8n6U
 4CSdkDNDSTNykcsS+S2mDRfbcdKZu8gcaVbI/lvgpQpGpRGsVdBmlCe2Sm+hocfng9OXN1Lu
 vr2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnR4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUpZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpQoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEK86JX/r1cop46zuNCd3B13Z
 W6Dk1WrsA+ciY3V9MIOA5Te7rBNoTyKSi8QF66EBDAKJwtHU7rhtre3IgVjdvaC6DgiqFC06
 j8bA==
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70531904"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEQAkElepIYxpTRyVDqC5/qbBdBXHLZHgjVkHWBd+891ocxeTGeQyG01ZGp88VzAHsWTH8a5z1I+ZC5K4gzePNFoejkmc7F2g1jarQm/1l/SDA444ORyg2Vx7Qnp91hljLZWNKZsv98NDFtye7olvBmRCoZdw3q2joG23sHiV3IXA9nx79VNFRtCnmzKVfPvF+0c3tvy5KXsCb8Uu84zrcExYOkH9WaYjSuSVcx06b+w6VBUNBgjtrtgjnrJUM2AL9wOloWODn6BicVAxi/muBqnUDgEMF46ZYE44vBu9BhUHrDrh+PiRRaTYmsYnS+gQrm5/VlosXA5uJ5gsjoAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX8f38mpLEajZFN110opSJeEK9TsOBhL4snGced19tU=;
 b=U+Z55g9Dq7AK/VNftslW/g/UnQy2FIaLXqrLU2pVH57fS5sk2spYre4MDiUilqKv1BFbTf20SVlOJ4mHrL3/DJYkpLAyYYcjIlTFJai9I+WwbjfyW/n/BTOXqk06Dn95zGsSIofpBrfpHlC8/9fEtBkNtXLHvqF8vVHDEQ2VadWw20C4Bfa/egbdshIq0OdCY/zfu7cXREx+BG1v4143E/0VkEMNVfgstXgDvF5D/oLhkwcESVL49AwY9OuSfc+ejfEoNV+qfpj4NNbhLkzG4U7oxzVp2Bx0eujiwGlmPX/1qSTYjzZ+zL35mVYUDnwIrKUyH+afvIG2/j5H8RxXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX8f38mpLEajZFN110opSJeEK9TsOBhL4snGced19tU=;
 b=BAVW2UY+N1gWVyy3Vk8kUl0GH+GeB/XgWhKc0VlyEGxnSs6b3JVfFI/m6px0xhTjmRY2ZXhJ+y37RUhCS7mImq/TsK7LteoD9te5mS1lyzifd21uQ163bZQmcLakMqpDuRsgmKeeLQSRfm2DlojyT1h2QaPApHnXWh/R824eh+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Apr 2022 12:52:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Steffen Einsle <einsle@phptrix.de>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/msr: handle reads to MSR_P5_MC_{ADDR,TYPE}
Message-ID: <YmpyAkgmqphvI9oQ@Air-de-Roger>
References: <20220428091359.90431-1-roger.pau@citrix.com>
 <4843821d-4e9b-f57d-cf84-375f0b8a3ff2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4843821d-4e9b-f57d-cf84-375f0b8a3ff2@suse.com>
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64ddddc2-6411-467e-935c-08da29053f61
X-MS-TrafficTypeDiagnostic: SN6PR03MB4255:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB4255EF9269E1863865F051108FFD9@SN6PR03MB4255.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	864GAOUhD9wDvKNOYSwvQ3074CQXa0XKpYa8IlIZD49jsYbUR3fuFJPcUX0cjNYy6tvjKyMgVc/qaN56oM6GmOOxatnAvrmeZ7iREVHitzELvv/qWbkYTqXMfdlli0W38OtR1SmfPsBCnZGBHcNhD4A5ri31HVzYEBZIuR3f2IQ473X0UdY/mUC6684RjmZSDlY4FbL9UiKcK+IEQkaEmbldw475jIvrUE92/QydaMj5CWafUSRxoHpe0jsttfAq2iRRmxkpC5WzpPp1D0JHy/Zjf1Lfivvk8gTRnKdrqw96m0+7a4KUYSTP9sCTHrgQB2OYO08igbwSLa9Zcr85tJp3ASYNcRDfpaCNDrzmsOAdP2coSK+BcM/AIYJDaWH9s5WRbvijbXIJT/y3K9/3g/QaLwTvDMe4N0kBZTpbFmS2uWXN9B0aHkhVE33EcWlqaV35l2zU6ylhTKuK7jIX2rISMhSsCftbBReHK91SY8jQGEU3sPOq8l89PC/dGOvwMxjWniPaZ60jBDxiUnNOc5p6A7/4i2SfWZ0ygM6uIvf8I0N2Z32igFWIe8b2CF3j7ki44zP7NX1yJWmehmzcTWeGAmyDvSO3QDWMg46aVbyfmA8KbGUn2JyDIdELfaxfq5qWssiAB3uauvI46Wdzyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(508600001)(6916009)(33716001)(6666004)(85182001)(54906003)(53546011)(6512007)(9686003)(6486002)(26005)(4744005)(66556008)(5660300002)(82960400001)(8676002)(86362001)(4326008)(316002)(66946007)(8936002)(66476007)(2906002)(186003)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGV0eUNacVJkMzZ5T2pSaUlLYkp5S1Q0d3U4NlJzczdDRHpyaHJmL0QwUUph?=
 =?utf-8?B?MGt6YWhZYWFNSjdiNjRUVjF1a0tOTjBOV2QzYS9jRE95RElGcG42UmM2djJy?=
 =?utf-8?B?MnVmVXMvVWEwL0lEL002ZGZrRUpscy9lWFh5OEFXNWhJN3Jwc0ZIazlzcGt1?=
 =?utf-8?B?bUt4K1pERVpmVDNPVUVwQzdNWmVadTlhUk9kckVheVZyMjM1T1VIMHdwRFAz?=
 =?utf-8?B?UjhnR3dDc3FVTkN6eHhoVzZRK2tDeXR6M3BkR21kK3g0eVEwMktmRm5BUWZV?=
 =?utf-8?B?VlIyVnV5N1VVTllqUXJmUmg4TU1HWmdpZXhmcVRkdy9VMkc2VTlXWVNiNlBx?=
 =?utf-8?B?OWpLRndkM2hya1FUdmVReWdBd3hLYTBRUzNLcG9lSU94M055YVd0TTJQMjZS?=
 =?utf-8?B?TkNGZ0ZaemhxUDN0cmExRnVzNnovSnZFaFhVUmhwR1huRWN4eUU0RjdCVkdR?=
 =?utf-8?B?WXFwVGRob28rWmFRaDFIUVJsZ1NJTytrcnRWdWNXTkZwYW1vV2VJTlYzKzlo?=
 =?utf-8?B?cVNnS2NkbkJJNFRQOFlyeElFQUhGenM0MG1jaUgrRGNpcUNXcU1naHl6ZmFT?=
 =?utf-8?B?cGNJYkNUYnhsa1MxYng1cHJnVTJFLzFpUHdranJkdXpIbzZ5Z2NDbmF0Z2JP?=
 =?utf-8?B?d1JTTGVmTk1ub3QxQ3hxVDBoLzFpTUExYzJ5ZVZZWERBeDA5dTBSMDJCeFA2?=
 =?utf-8?B?STVJQ1V1eFVLSllzdHVERlljdXFMSVZPM20xdDJqOUlMUjMzSUxZSndSVWNS?=
 =?utf-8?B?S2RhYVJjVldLSjQ4dklHR3I0NUpza25hTmQwYXlDZXd6c0czRUVGZis0TVc0?=
 =?utf-8?B?TGpmSm5sL0h3dmdvSjZGWVNTZ0trRHpRQmcvcjJrR3ZvdEpvYy9mV0J3cFFp?=
 =?utf-8?B?Z3VoOSs1Yk8wMm15RUdwNHZKeFVqd24zbnBIcy9WZllDcGxwWkVZbTlxOHVV?=
 =?utf-8?B?Rno3RjRkNGMwenNXK3FESzM4cUwxbWFQZE1TU28xN3dXTDZ6KytFY0JydmJy?=
 =?utf-8?B?ZmpOaE54MG0zaXJUeDhkdXVwTjBZcVREbk9KVmU3ZjFSOENZdDhTSzhDbytB?=
 =?utf-8?B?Z3V6eTBKOGJDVVVzSWZ6VkN6MFdUUndzSlBwRldHcHFYdG9mWHFTOFZMS0Rm?=
 =?utf-8?B?ZmVhcEVkOUFPYVpiN2t2czlEcThNdS9YRDFyVStaOEJrNXpVd1BkUnRVTkpi?=
 =?utf-8?B?VXg1TEJPZGRNdi9CeWcxQW85ZmxXMW1keDN6N1drYmNjR0FSZWZieWIyRUNC?=
 =?utf-8?B?eC9ZUjdyMk40cmttdWlsTEhseU8wbXZ6Rml5VGZSa0REVTVSNmxBekdFZEpS?=
 =?utf-8?B?K1I2cndMSDdQWWtieEdrUGh6QllHUFUxbGdiUTc4ZWpnV0tER29leG5weUpk?=
 =?utf-8?B?QmVZSmRTQkNXZUJRK0ZjMXFQKzJnQVdVTWxVRzZVVkpzak1Gb2k2elhwN0VD?=
 =?utf-8?B?b0wycEtZbDJtTUFJVlJHMFpwZGpxYVdENFcyUDF3ZWU3WEQ1RUszVlNsTWlE?=
 =?utf-8?B?a2l2c1ZmMW83RmxHSXU4aVFTdlZTcUc2Tk9DYitybXl6cXY4b04rVjZDNUpj?=
 =?utf-8?B?MEhBWEdiaDhrMy82L3pWMkpJWDV5NXRNNU5TKzdJZkhXeGlaK0F3S2tISUNy?=
 =?utf-8?B?ZnQwYTh6VXNXTmxCek9ES0ZReG40UmQ1WTdwei9DWCtpZzVQR0ZzRGpmNGFz?=
 =?utf-8?B?NVhaeFhFdnRJSkxiOXIremZHbWRQTmVXK0lQeHdJTC9weEQ0dWRydTYwRXFY?=
 =?utf-8?B?TXJmSWthVmtIa0piSXZxaHB5d2p1bWptNHBGTktUQWp1TjFzL0RXK2tsVDdO?=
 =?utf-8?B?QytMNm5SK2ZTamN2dU8wcVNkdEJPTVdTMjQ4TWtRS3hjVTBWN0tDQklJajZz?=
 =?utf-8?B?N0N4Y3ByZ1M4TzNQYnh4YU1KLyt0VE1CMnI0WHRtQXpWM3BobUhxNk1WWWVD?=
 =?utf-8?B?N2JkMy9YUFlsN2pZVjFMMFR0UHFTeDhWRjhjWHg1RHdQTWZFOW55MDB4bDFZ?=
 =?utf-8?B?ajVNTTY1OWY4S3FLeDZCS2NlSHRuS0NqTStsNFdGQ09yNFF6S01KSVN6ZXFs?=
 =?utf-8?B?VlRQR0FYUlhJcm1ubUZ5OTl1eWhYWXU1V015S1YxajlUeFd0aVVGK05vNGkr?=
 =?utf-8?B?eXFUTm5nVURZejFTalRaVFBjVlM1c3RFSUZiRjNRMHB3K1duRWwzN3dwUU1Z?=
 =?utf-8?B?bmNSQ3ZaZmRhUm15QXBkbFk2ZTY5c1RmeEdWNklRK0dGLzAvajJnZFEzUTBi?=
 =?utf-8?B?Wnh3eCtQMHpzTHpZRkNQV001K2lRUnpmK1JiOWRVbmZFTWNnWWtROG5VczVr?=
 =?utf-8?B?cjVTd0N6ai9UMHArNkZXNHVZSWtuMnJmdnYxQWtveFBoRzU3RHNuZUwvZjRz?=
 =?utf-8?Q?LhmH0IsDS4ptOsuc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ddddc2-6411-467e-935c-08da29053f61
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:52:54.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOBsa9OeBA4OgJxcTFS7YVCMpWkqJwA0cMEzKq8exIOmOA6h2JDrGdzGZQ6DF/vkuXGXYVR+/S1t3vXK2rlxwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4255

On Thu, Apr 28, 2022 at 12:39:19PM +0200, Jan Beulich wrote:
> On 28.04.2022 11:13, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> > +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> > @@ -1008,8 +1008,24 @@ int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
> >  
> >  int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
> >  {
> > +    const struct cpuid_policy *cp = v->domain->arch.cpuid;
> >      unsigned int bank = msr - MSR_IA32_MC0_CTL2;
> >  
> > +    switch ( msr )
> > +    {
> > +    case MSR_P5_MC_ADDR:
> > +        /* Bank 0 is used for the 'bank 0 quirk' on older processors. */
> > +        *val = v->arch.vmce.bank[1].mci_addr;
> > +        return 1;
> > +
> > +    case MSR_P5_MC_TYPE:
> > +        *val = v->arch.vmce.bank[1].mci_status;
> > +        return 1;
> > +    }
> 
> Could I ask you to add a reference to vcpu_fill_mc_msrs() in the comment?

Sure.

Thanks, Roger.

